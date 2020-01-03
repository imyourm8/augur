pragma solidity 0.5.10;
pragma experimental ABIEncoderV2;

import { PredicateRegistry } from "ROOT/matic/PredicateRegistry.sol";
import { BytesLib } from "ROOT/matic/libraries/BytesLib.sol";
import { Common } from "ROOT/matic/libraries/Common.sol";
import { RLPEncode } from "ROOT/matic/libraries/RLPEncode.sol";
import { RLPReader } from "ROOT/matic/libraries/RLPReader.sol";
import { IWithdrawManager } from "ROOT/matic/plasma/IWithdrawManager.sol";
import { IErc20Predicate } from "ROOT/matic/plasma/IErc20Predicate.sol";

import { IShareToken } from "ROOT/reporting/IShareToken.sol";
import { OICash } from "ROOT/reporting/OICash.sol";
import { IMarket } from "ROOT/reporting/IMarket.sol";
import { IExchange } from "ROOT/external/IExchange.sol";
import { IZeroXTrade } from "ROOT/trading/IZeroXTrade.sol";
import { IAugurTrading } from "ROOT/trading/IAugurTrading.sol";
import { IAugur } from "ROOT/IAugur.sol";
import { Cash } from "ROOT/Cash.sol";
import { ZeroXExchange } from "ROOT/ZeroXExchange.sol";
import { Initializable } from "ROOT/libraries/Initializable.sol";
import { SafeMathUint256 } from "ROOT/libraries/math/SafeMathUint256.sol";

contract AugurPredicate is Initializable {
    using RLPReader for bytes;
    using RLPReader for RLPReader.RLPItem;
    using SafeMathUint256 for uint256;

    event ExitFinalized(uint256 indexed exitId,  address indexed exitor);

    bytes32 constant internal SHARE_TOKEN_BALANCE_CHANGED_EVENT_SIG = 0x350ea32dc29530b9557420816d743c436f8397086f98c96292138edd69e01cb3;
    uint256 constant internal MAX_LOGS = 100;
    bytes constant public networkId = "0x3A99";

    PredicateRegistry public predicateRegistry;
    IWithdrawManager public withdrawManager;
    IErc20Predicate public erc20Predicate;

    IAugur public augur;
    IShareToken public augurShareToken;
    IZeroXTrade public zeroXTrade;
    Cash public augurCash;
    OICash public oICash;
    address public childOICash;

    mapping(address => bool) claimedTradingProceeds;
    uint256 private constant MAX_APPROVAL_AMOUNT = 2 ** 256 - 1;

    enum ExitStatus { Invalid, Initialized, InProgress, Finalized }
    struct ExitData {
        IShareToken exitShareToken;
        Cash exitCash;
        uint256 exitPriority;
        ExitStatus status;
        IMarket[] marketsList;
        mapping(address => bool) markets;
    }

    mapping(uint256 => ExitData) public lookupExit;

    function initialize(IAugur _augur, IAugurTrading _augurTrading) public beforeInitialized {
        endInitialization();
        augur = _augur;
        zeroXTrade = IZeroXTrade(_augurTrading.lookup("ZeroXTrade"));
    }

    function initializeForMatic(
        PredicateRegistry _predicateRegistry,
        IWithdrawManager _withdrawManager,
        IErc20Predicate _erc20Predicate,
        OICash _oICash,
        address _childOICash,
        IAugur _mainAugur
    ) public /* @todo make part of initialize() */ {
        predicateRegistry = _predicateRegistry;
        withdrawManager = _withdrawManager;
        erc20Predicate = _erc20Predicate;
        oICash = _oICash;
        childOICash = _childOICash;
        augurCash = Cash(_mainAugur.lookup("Cash"));
        augurShareToken = IShareToken(_mainAugur.lookup("ShareToken"));
        // The allowance may eventually run out, @todo provide a mechanism to refresh this allowance
        require(
            augurCash.approve(address(_mainAugur), MAX_APPROVAL_AMOUNT),
            "Cash approval to Augur failed"
        );
    }

    function deposit(uint256 amount) public {
        require(
            augurCash.transferFrom(msg.sender, address(this), amount),
            "Cash transfer failed"
        );
        require(
            oICash.deposit(amount),
            "OICash deposit failed"
        );
        // @todo emit state sync event to deposit on Matic
    }

    /**
     * @notice Call initializeForExit to instantiate new shareToken and Cash contracts to replay history from Matic
     * @dev new ShareToken() / new Cash() causes the bytecode of this contract to be too large, working around that limitation for now,
        however, the intention is to deploy a new ShareToken and Cash contract per exit - todo: use proxies for that
     */
    function initializeForExit(IShareToken _exitShareToken, Cash _exitCash) external returns(uint256 exitId) {
        exitId = getExitId(msg.sender);
        require(
            lookupExit[exitId].status == ExitStatus.Invalid,
            "Predicate.initializeForExit: Exit is already initialized"
        );

        // IShareToken _exitShareToken = new ShareToken();
        // Cash cash = new Cash();
        // cash.initialize(augur);

        _exitShareToken.initializeFromPredicate(augur, address(_exitCash));

        lookupExit[exitId] = ExitData({
            exitShareToken: _exitShareToken,
            exitCash: _exitCash,
            exitPriority: 0,
            status: ExitStatus.Initialized,
            marketsList: new IMarket[](0)
        });
    }

    /**
     * @notice Prove receipt and index of the log (ShareTokenBalanceChanged) in the receipt to claim balance from Matic
     * @param data RLP encoded data of the reference tx (proof-of-funds) that encodes the following fields
      * headerNumber Header block number of which the reference tx was a part of
      * blockProof Proof that the block header (in the child chain) is a leaf in the submitted merkle root
      * blockNumber Block number of which the reference tx is a part of
      * blockTime Reference tx block time
      * blocktxRoot Transactions root of block
      * blockReceiptsRoot Receipts root of block
      * receipt Receipt of the reference transaction
      * receiptProof Merkle proof of the reference receipt
      * branchMask Merkle proof branchMask for the receipt
      * logIndex Log Index to read from the receipt
     */
    function claimShareBalance(bytes calldata data) external {
        uint256 exitId = getExitId(msg.sender);
        require(
            lookupExit[exitId].status == ExitStatus.Initialized,
            "Predicate.claimShareBalance: Please call initializeForExit first"
        );
        RLPReader.RLPItem[] memory referenceTxData = data.toRlpItem().toList();
        bytes memory receipt = referenceTxData[6].toBytes();
        RLPReader.RLPItem[] memory inputItems = receipt.toRlpItem().toList();
        uint256 logIndex = referenceTxData[9].toUint();
        require(logIndex < MAX_LOGS, "Supporting a max of 100 logs");
        uint256 age = withdrawManager.verifyInclusion(data, 0 /* offset */, false /* verifyTxInclusion */);
        lookupExit[exitId].exitPriority = lookupExit[exitId].exitPriority.max(age);
        inputItems = inputItems[3].toList()[logIndex].toList(); // select log based on given logIndex
        bytes memory logData = inputItems[2].toBytes();
        inputItems = inputItems[1].toList(); // topics
        // now, inputItems[i] refers to i-th (0-based) topic in the topics array
        // event ShareTokenBalanceChanged(address indexed universe, address indexed account, address indexed market, uint256 outcome, uint256 balance);
        require(
            bytes32(inputItems[0].toUint()) == SHARE_TOKEN_BALANCE_CHANGED_EVENT_SIG,
            "Predicate.claimShareBalance: Not ShareTokenBalanceChanged event signature"
        );
        // inputItems[1] is the universe
        address account = address(inputItems[2].toUint());
        address market = address(inputItems[3].toUint());
        uint256 outcome = BytesLib.toUint(logData, 0);
        uint256 balance = BytesLib.toUint(logData, 32);
        address _rootMarket = _checkAndAddMaticMarket(exitId, market);
        setIsExecuting(exitId, true);
        lookupExit[exitId].exitShareToken.mint(account, _rootMarket, outcome, balance);
        setIsExecuting(exitId, false);
    }

    /**
     * @notice Prove receipt and index of the log (Deposit, Withdraw, LogTransfer) in the receipt to claim balance from Matic
     * @param data RLP encoded data of the reference tx (proof-of-funds) that encodes the following fields
      * headerNumber Header block number of which the reference tx was a part of
      * blockProof Proof that the block header (in the child chain) is a leaf in the submitted merkle root
      * blockNumber Block number of which the reference tx is a part of
      * blockTime Reference tx block time
      * blocktxRoot Transactions root of block
      * blockReceiptsRoot Receipts root of block
      * receipt Receipt of the reference transaction
      * receiptProof Merkle proof of the reference receipt
      * branchMask Merkle proof branchMask for the receipt
      * logIndex Log Index to read from the receipt
     * @param participant Account for which the proof-of-funds is being provided
     */
    function claimCashBalance(bytes calldata data, address participant) external {
        uint256 exitId = getExitId(msg.sender);
        require(
            lookupExit[exitId].status == ExitStatus.Initialized,
            "Predicate.claimCashBalance: Please call initializeForExit first"
        );
        bytes memory _preState = erc20Predicate.interpretStateUpdate(abi.encode(data, participant, true /* verifyInclusionInCheckpoint */, false /* isChallenge */));
        (uint256 closingBalance, uint256 age,,) = abi.decode(_preState, (uint256, uint256, address, address));
        // (uint256 closingBalance, uint256 age,,address maticCashAddress) = abi.decode(_preState, (uint256, uint256, address, address));
        // @todo Validate maticCashAddress
        lookupExit[exitId].exitPriority = lookupExit[exitId].exitPriority.max(age);
        setIsExecuting(exitId, true);
        lookupExit[exitId].exitCash.joinMint(participant, closingBalance);
        setIsExecuting(exitId, false);
    }

    function _checkAndAddMaticMarket(uint256 exitId, address market) internal returns(address) {
        // ask the actual mainnet augur ShareToken for the market details
        (address _rootMarket, uint256 _numOutcomes, uint256 _numTicks) = predicateRegistry.childToRootMarket(market);
        require(
            _rootMarket != address(0x0),
            "AugurPredicate:_addMarketToExit: Market does not exist"
        );
        if (!lookupExit[exitId].markets[_rootMarket]) {
            lookupExit[exitId].markets[_rootMarket] = true;
            lookupExit[exitId].marketsList.push(IMarket(_rootMarket));
            lookupExit[exitId].exitShareToken.initializeMarket(IMarket(_rootMarket), _numOutcomes, _numTicks);
        }
        return _rootMarket;
    }

    /**
    * @dev Start exit with a zeroX trade
    * @param _taker Order filler
    */
    function trade(
        uint256 _requestedFillAmount,
        address _affiliateAddress,
        bytes32 _tradeGroupId,
        IExchange.Order[] memory _orders,
        bytes[] memory _signatures,
        address _taker
    )
        public
        payable
    {
        // @todo Handle case where the exitor is exiting with a trade filled by someone else (exitor had a signed order)
        require(
            _taker == msg.sender,
            "Exitor is not the order taker"
        );
        uint256 exitId = getExitId(msg.sender);
        require(
            lookupExit[exitId].status == ExitStatus.Initialized,
            "Predicate.trade: Please call initializeForExit first"
        );

        setIsExecuting(exitId, true);
        zeroXTrade.trade.value(msg.value)(
            _requestedFillAmount,
            _affiliateAddress,
            _tradeGroupId, _orders, _signatures,
            _taker,
            abi.encode(lookupExit[exitId].exitShareToken, lookupExit[exitId].exitCash)
        );
        setIsExecuting(exitId, false);
    }

    function startExit() external {
        address exitor = msg.sender;
        uint256 exitId = getExitId(exitor);
        require(
            lookupExit[exitId].status == ExitStatus.Initialized,
            "Predicate.startExit: Exit should be in Initialized state"
        );
        lookupExit[exitId].status = ExitStatus.InProgress;
        withdrawManager.addExitToQueue(
            exitor,
            childOICash,
            address(oICash), // rootToken
            exitId, // exitAmountOrTokenId - think of exitId like a token Id
            bytes32(0), // txHash - field not required for now
            false, // isRegularExit
            lookupExit[exitId].exitPriority
        );
    }

    function onFinalizeExit(bytes calldata data) external {
        require(
            msg.sender == address(withdrawManager),
            "ONLY_WITHDRAW_MANAGER"
        );
        // this encoded data is compatible with rest of the matic predicates
        (,,address exitor,uint256 exitId) = abi.decode(data, (uint256, address, address, uint256));
        uint256 payout;
        for (uint256 i = 0; i < lookupExit[exitId].marketsList.length; i++) {
            IMarket market = IMarket(lookupExit[exitId].marketsList[i]);
            if (market.isFinalized()) {
                payout = payout.add(processExitForFinalizedMarket(market, exitor, exitId));
            } else {
                processExitForMarket(market, exitor, exitId);
            }
        }
        payout = payout.add(lookupExit[exitId].exitCash.balanceOf(exitor));
        (bool _success, uint256 _feesOwed) = oICash.withdraw(payout);
        require(_success, "OICash.Withdraw failed");
        lookupExit[exitId].status = ExitStatus.Finalized;
        if (payout > _feesOwed) {
            require(
                augurCash.transfer(exitor, payout - _feesOwed),
                "Cash transfer failed"
            );
        }
        emit ExitFinalized(exitId, exitor);
    }

    function processExitForFinalizedMarket(IMarket market, address exitor, uint256 exitId) internal returns(uint256) {
        claimTradingProceeds(market);

        // since trading proceeds have been called, predicate has 0 shares for all outcomes;
        // so the exitor will get the payout for the shares

        return calculateProceeds(market, exitor, exitId);
    }

    function claimTradingProceeds(IMarket market) public {
        if (!claimedTradingProceeds[address(market)]) {
            claimedTradingProceeds[address(market)] = true;
            augurShareToken.claimTradingProceedsToOICash(market, address(0) /* _affiliateAddress */);
        }
    }

    function calculateProceeds(IMarket market, address exitor, uint256 exitId) public view returns(uint256) {
        uint256 numOutcomes = market.getNumberOfOutcomes();
        uint256 payout;
        for (uint256 outcome = 0; outcome < numOutcomes; outcome++) {
            uint256 sharesOwned = lookupExit[exitId].exitShareToken.balanceOfMarketOutcome(market, outcome, exitor);
            payout = payout.add(augurShareToken.calculateProceeds(market, outcome, sharesOwned));
        }
        return payout;
    }


    function processExitForMarket(IMarket market, address exitor, uint256 exitId) internal {
        uint256 numOutcomes = market.getNumberOfOutcomes();
        uint256 completeSetsToBuy;
        uint256[] memory _outcomes = new uint256[](numOutcomes);
        uint256[] memory _sharesToGive = new uint256[](numOutcomes);
        // try to give as many shares from escrow as possible
        for (uint256 outcome = 0; outcome < numOutcomes; outcome++) {
            uint256 sharesToGive = lookupExit[exitId].exitShareToken.balanceOfMarketOutcome(market, outcome, exitor);
            uint256 sharesInEscrow = augurShareToken.balanceOfMarketOutcome(market, outcome, address(this));
            if (sharesInEscrow < sharesToGive) {
                completeSetsToBuy = completeSetsToBuy.max(sharesToGive - sharesInEscrow);
            }
            _outcomes[outcome] = outcome;
            _sharesToGive[outcome] = sharesToGive;
        }

        if (completeSetsToBuy > 0) {
            require(
                oICash.buyCompleteSets(market, completeSetsToBuy),
                "processExitForMarket: Buying complete sets failed"
            );
        }

        uint256[] memory _tokenIds = augurShareToken.getTokenIds(market, _outcomes);
        augurShareToken.unsafeBatchTransferFrom(address(this), exitor, _tokenIds, _sharesToGive);
    }

    function getExitId(address _exitor) public pure returns(uint256 _exitId) {
        _exitId = uint256(keccak256(abi.encodePacked(_exitor)));
    }

    function setIsExecuting(uint256 exitId, bool isExecuting) internal {
        lookupExit[exitId].exitCash.setIsExecuting(isExecuting);
        lookupExit[exitId].exitShareToken.setIsExecuting(isExecuting);
    }

    function isExitInitialized(uint256 exitId) public view returns(bool) {
        return lookupExit[exitId].status == ExitStatus.Initialized;
    }

    function verifyDeprecation(bytes calldata exit, bytes calldata /* inputUtxo */, bytes calldata challengeData)
        external
        view
        returns (bool)
    {
        uint256 age = withdrawManager.verifyInclusion(challengeData, 0 /* offset */, true /* verifyTxInclusion */);
        // this encoded data is compatible with rest of the matic predicates
        (address exitor,,uint256 exitId,,) = abi.decode(exit, (address, address, uint256, bytes32, bool));
        if (age <= lookupExit[exitId].exitPriority) return false; // Providing an older tx results in an unsuccessful challenge
        RLPReader.RLPItem[] memory _challengeData = challengeData.toRlpItem().toList();
        bytes memory challengeTx = _challengeData[10].toBytes();
        uint256 orderIndex = _challengeData[9].toUint();
        return isValidDeprecationType1(challengeTx, exitor) || isValidDeprecationType2(challengeTx, exitor, orderIndex);
    }

    function isValidDeprecationType1(bytes memory txData, address signer) internal pure returns(bool) {
        RLPReader.RLPItem[] memory txList = txData.toRlpItem().toList();
        if (txList.length != 9) return false; // MALFORMED_TX
        // address to = RLPReader.toAddress(txList[3]); // corresponds to "to" field in tx
        // @todo assert that "to" belongs to a set of contracts on matic; txs to which qualify for state deprecations
        (address _signer,) = getAddressFromTx(txList);
        return _signer == signer;
    }

    function isValidDeprecationType2(bytes memory txData, address exitor, uint256 orderIndex) internal view returns(bool) {
        RLPReader.RLPItem[] memory txList = txData.toRlpItem().toList();
        if (txList.length != 9) return false; // MALFORMED_TX
        address to = RLPReader.toAddress(txList[3]); // corresponds to "to" field in tx
        require(
            to == predicateRegistry.zeroXTrade(),
            "isValidDeprecationType2: challengeTx.to != zeroXTrade"
        );
        bytes4 funcSig = BytesLib.toBytes4(BytesLib.slice(txData, 0, 4));
        require(
            funcSig == 0x089042f7,
            "isValidDeprecationType2: funcSig of challengeTx should match that of zeroxTrade.trade"
        );
        (,,, IExchange.Order[] memory _orders, bytes[] memory _signatures) = abi.decode(
            BytesLib.slice(txData, 4, txData.length - 4),
            (uint256, address, bytes32, IExchange.Order[], bytes[])
        );
        IExchange.Order memory order = _orders[orderIndex];
        require(
            order.makerAddress == exitor,
            "isValidDeprecationType2: Order not signed by the exitor"
        );
        IExchange _maticExchange = zeroXTrade.getExchangeFromAssetData(order.makerAssetData);
        ZeroXExchange exchange = ZeroXExchange(predicateRegistry.zeroXExchange(address(_maticExchange)));
        IExchange.OrderInfo memory orderInfo = exchange.getOrderInfo(order);
        require(
            exchange.isValidSignature(
                orderInfo.orderHash,
                order.makerAddress,
                _signatures[orderIndex]
            ),
            "isValidDeprecationType2: INVALID_ORDER_SIGNATURE"
        );
        // @todo Check order expiration
        return true;
    }

    function getAddressFromTx(RLPReader.RLPItem[] memory txList)
        internal
        pure
        returns (address signer, bytes32 txHash)
    {
        bytes[] memory rawTx = new bytes[](9);
        for (uint8 i = 0; i <= 5; i++) {
            rawTx[i] = txList[i].toBytes();
        }
        rawTx[6] = networkId;
        rawTx[7] = hex""; // [7] and [8] have something to do with v, r, s values
        rawTx[8] = hex"";

        txHash = keccak256(RLPEncode.encodeList(rawTx));
        signer = ecrecover(
            txHash,
            Common.getV(txList[6].toBytes(), Common.toUint16(networkId)),
            bytes32(txList[7].toUint()),
            bytes32(txList[8].toUint())
        );
    }
}
