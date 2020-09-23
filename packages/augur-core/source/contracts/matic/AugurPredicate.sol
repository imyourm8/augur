pragma solidity 0.5.10;
pragma experimental ABIEncoderV2;

import { PredicateRegistry } from "ROOT/matic/PredicateRegistry.sol";
import { BytesLib } from "ROOT/matic/libraries/BytesLib.sol";
import { RLPEncode } from "ROOT/matic/libraries/RLPEncode.sol";
import { RLPReader } from "ROOT/matic/libraries/RLPReader.sol";
import { ProofReader } from "ROOT/matic/libraries/ProofReader.sol";
import { IWithdrawManager } from "ROOT/matic/plasma/IWithdrawManager.sol";
import { IDepositManager } from "ROOT/matic/plasma/IDepositManager.sol";
import { IErc20Predicate } from "ROOT/matic/plasma/IErc20Predicate.sol";
import { ShareTokenPredicate } from "ROOT/matic/ShareTokenPredicate.sol";

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

    uint256 constant internal MAX_LOGS = 10;

    PredicateRegistry public predicateRegistry;
    IWithdrawManager public withdrawManager;
    IDepositManager public depositManager;
    IErc20Predicate public erc20Predicate;
    ShareTokenPredicate public shareTokenPredicate;

    IAugur public augur;
    IShareToken public augurShareToken;
    IZeroXTrade public zeroXTrade;
    Cash public augurCash;
    OICash public oICash;
    address public childOICash;

    mapping(address => bool) claimedTradingProceeds;
    uint256 private constant MAX_APPROVAL_AMOUNT = 2 ** 256 - 1;

    // keccak256('transfer(address,uint256)').slice(0, 4)
    bytes4 constant TRANSFER_FUNC_SIG = 0xa9059cbb;
    bytes4 constant ZEROX_TRADE_FUNC_SIG = 0x089042f7;

    // keccak256('joinBurn(address,uint256)').slice(0, 4)
    bytes4 constant BURN_FUNC_SIG = 0xf11f299e; 

    // keccak256('Burn(address,uint256)').slice(0, 4)
    bytes32 constant BURN_EVENT_SIG = 0xcc16f5dbb4873280815c1ee09dbd06736cffcc184412cf7a71a0fdb75d397ca5;

    // keccak256('Withdraw(address,address,uint256,uint256,uint256)')
    bytes32 constant WITHDRAW_EVENT_SIG = 0xebff2602b3f468259e1e99f613fed6691f3a6526effe6ef3e768ba7ae7a36c4f;

    enum ExitStatus { Invalid, Initialized, InFlightExecuted, InProgress, Finalized }
    struct ExitData {
        IShareToken exitShareToken;
        Cash exitCash;
        uint256 exitPriority;
        uint256 startExitTime;
        int256 lastGoodNonce;
        bytes32 inFlightTxHash;
        ExitStatus status;
        IMarket[] marketsList;
        mapping(address => bool) markets;
    }

    struct TradeData {
        uint256 requestedFillAmount;
        address affiliateAddress;
        bytes32 tradeGroupId;
        IExchange.Order[] orders;
        bytes[] signatures;
        address taker;
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
        IDepositManager _depositManager,
        IErc20Predicate _erc20Predicate,
        OICash _oICash,
        address _childOICash,
        IAugur _mainAugur,
        ShareTokenPredicate _shareTokenPredicate
    ) public /* @todo make part of initialize() */ {
        predicateRegistry = _predicateRegistry;
        withdrawManager = _withdrawManager;
        depositManager = _depositManager;
        erc20Predicate = _erc20Predicate;
        oICash = _oICash;
        childOICash = _childOICash;
        
        augurCash = Cash(_mainAugur.lookup("Cash"));
        shareTokenPredicate = _shareTokenPredicate;
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
        // require(
        //     oICash.approve(address(depositManager), amount),
        //     "OICash approval to Matic depositManager failed"
        // );
        // depositManager.depositERC20ForUser(address(oICash), msg.sender, amount);
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
        _exitCash.initializeFromPredicate(augur);

        lookupExit[exitId] = ExitData({
            exitShareToken: _exitShareToken,
            exitCash: _exitCash,
            exitPriority: 0,
            startExitTime: 0,
            lastGoodNonce: -1,
            inFlightTxHash: bytes32(0),
            status: ExitStatus.Initialized,
            marketsList: new IMarket[](0)
        });
    }

    /**
     * @notice Proof receipt and index of the log (ShareTokenBalanceChanged) in the receipt to claim balance from Matic
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
        (address account, address market, uint256 outcome, uint256 balance, uint256 age) = shareTokenPredicate.parseData(data);
        address rootMarket = _checkAndAddMaticMarket(exitId, market);
        setIsExecuting(exitId, true);
        lookupExit[exitId].exitPriority = lookupExit[exitId].exitPriority.max(age);
        lookupExit[exitId].exitShareToken.mint(account, rootMarket, outcome, balance);
        setIsExecuting(exitId, false);
    }

    /**
     * @notice Proof receipt and index of the log (Deposit, Withdraw, LogTransfer) in the receipt to claim balance from Matic
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
        bytes memory _preState = erc20Predicate.interpretStateUpdate(
            abi.encode(data, participant, true /* verifyInclusionInCheckpoint */, false /* isChallenge */)
        );

        (uint256 closingBalance, uint256 age,,) = abi.decode(_preState, (uint256, uint256, address, address));
        (,,,address maticCashAddress) = abi.decode(_preState, (uint256, uint256, address, address));

        require(maticCashAddress == predicateRegistry.maticCash(), "not matic cash");

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

    function claimLastGoodNonce(bytes calldata lastCheckpointedTx) external {
        uint256 age = withdrawManager.verifyInclusion(lastCheckpointedTx, 0 /* offset */, true /* verifyTxInclusion */);
        uint256 exitId = getExitId(msg.sender);

        lookupExit[exitId].exitPriority = lookupExit[exitId].exitPriority.max(age);

        lookupExit[exitId].lastGoodNonce = int256(ProofReader.getTxNonce(
            ProofReader.convertToExitPayload(lastCheckpointedTx)
        ));
    }

    function executeInFlightTransaction(bytes memory data) public payable {
        uint256 exitId = getExitId(msg.sender);
        require(
            lookupExit[exitId].status == ExitStatus.Initialized,
            "executeInFlightTransaction: Exit should be in Initialized state"
        );
        lookupExit[exitId].status = ExitStatus.InFlightExecuted; // this ensures only 1 in-flight tx can be replayed on-chain

        RLPReader.RLPItem[] memory targetTx = ProofReader.convertToTx(data);
        require(targetTx.length == 9, "incorrect transaction data");

        address to = ProofReader.getTxTo(targetTx);
        address signer;
        (signer, lookupExit[exitId].inFlightTxHash) = erc20Predicate.getAddressFromTx(data);

        setIsExecuting(exitId, true);

        if (to == predicateRegistry.maticShareToken()) {
            require(signer == msg.sender, "executeInFlightTransaction: signer != msg.sender");
            lookupExit[exitId].lastGoodNonce = int256(ProofReader.getTxNonce(targetTx)) - 1;
            shareTokenPredicate.executeInFlightTransaction(data, signer, lookupExit[exitId].exitShareToken);
        } 
        else if (to == predicateRegistry.maticCash()) {
            require(signer == msg.sender, "executeInFlightTransaction: signer != msg.sender");
            lookupExit[exitId].lastGoodNonce = int256(ProofReader.getTxNonce(targetTx)) - 1;
            executeCashInFlight(data, exitId);
        } 
        else if (to == predicateRegistry.zeroXTrade()) {
            this.executeTrade.value(msg.value)(data, exitId, signer);
        }

        setIsExecuting(exitId, false);
    }

    struct ExecuteTradeVars {
        RLPReader.RLPItem[] txList;
        bytes txData;
    }

    function executeTrade(bytes memory data, uint256 exitId, address signer) public payable {
        ExecuteTradeVars memory vars;

        vars.txList = ProofReader.convertToTx(data);

        TradeData memory trade;
        trade.taker = signer; // signer of the tx is the taker; akin to taker being msg.sender in the main contract

        if (trade.taker == msg.sender) {
            lookupExit[exitId].lastGoodNonce = int256(ProofReader.getTxNonce(vars.txList)) - 1;
        }

        vars.txData = ProofReader.getTxData(vars.txList);
        require(
            ProofReader.getFunctionSignature(vars.txData) == ZEROX_TRADE_FUNC_SIG,
            "not ZEROX_TRADE_FUNC_SIG"
        );

        (trade.requestedFillAmount, trade.affiliateAddress, trade.tradeGroupId, trade.orders, trade.signatures) = abi.decode(
            BytesLib.slice(vars.txData, 4, vars.txData.length - 4),
            (uint256, address, bytes32, IExchange.Order[], bytes[])
        );

        setIsExecuting(exitId, true);

        zeroXTrade.trade.value(msg.value)(
            trade.requestedFillAmount,
            trade.affiliateAddress,
            trade.tradeGroupId, trade.orders, trade.signatures,
            trade.taker,
            abi.encode(lookupExit[exitId].exitShareToken, lookupExit[exitId].exitCash)
        );

        setIsExecuting(exitId, false);
    }

    function executeCashInFlight(bytes memory txData, uint256 exitId) public {
        RLPReader.RLPItem[] memory txList = txData.toRlpItem().toList();

        lookupExit[exitId].lastGoodNonce = int256(txList[0].toUint()) - 1;
        txData = RLPReader.toBytes(txList[5]);
        bytes4 funcSig = BytesLib.toBytes4(BytesLib.slice(txData, 0, 4));
        setIsExecuting(exitId, true);
        if (funcSig == TRANSFER_FUNC_SIG) {
            lookupExit[exitId].exitCash.transferFrom(
                msg.sender, // from
                BytesLib.toAddress(txData, 4), // to
                BytesLib.toUint(txData, 36) // amount
            );
        } else if (funcSig != BURN_FUNC_SIG) {
            // if burning happened no need to do anything
            revert("not supported");
        }
        setIsExecuting(exitId, false);
    }

    function startExitWithBurntTokens(bytes calldata data) external {
        // RLPReader.RLPItem[] memory exitPayload = ProofReader.convertToExitPayload(data);
        // RLPReader.RLPItem[] memory log = ProofReader.getLog(exitPayload);
        // require(ProofReader.getLogEmitterAddress(log) == predicateRegistry.maticCash(), "not cash");
        
        // RLPReader.RLPItem[] memory topics = ProofReader.getLogTopics(log);
        // require(
        //     bytes32(topics[0].toUint()) == BURN_EVENT_SIG,
        //     "not BURN_EVENT_SIG"
        // );

        // event Withdraw(address indexed token, address indexed from, uint256 amount, uint256 input1, uint256 output1)
        // require(
        //     msg.sender == address(topics[2].toUint()), // from
        //     "not a burn owner"
        // );

        bytes memory _preState = erc20Predicate.interpretStateUpdate(
            abi.encode(data, msg.sender, true /* verifyInclusionInCheckpoint */, false /* isChallenge */)
        );
        // Originally, in Withdraw even address of the token is an address of the corresponding
        // root token. In case of Augur it is an address of the token itself. 
        // Predicate knows root Cash contract
        (
            uint256 exitAmount, 
            uint256 age,
            , 
            address maticCash 
        ) = abi.decode(_preState, (uint256, uint256, address, address));
        
        withdrawManager.addExitToQueue(
            msg.sender,
            maticCash,
            address(augurCash), 
            exitAmount,
            bytes32(0x0),
            true, /* isRegularExit */
            age << 1
        );
    }

    function startExit() external {
        address exitor = msg.sender;
        uint256 exitId = getExitId(exitor);
        require(
            lookupExit[exitId].status == ExitStatus.Initialized || lookupExit[exitId].status == ExitStatus.InFlightExecuted,
            "incorrect status"
        );
        lookupExit[exitId].status = ExitStatus.InProgress;
        lookupExit[exitId].startExitTime = now;
        withdrawManager.addExitToQueue(
            exitor,
            childOICash,
            address(oICash), // rootToken
            exitId, // exitAmountOrTokenId - think of exitId like a token Id
            bytes32(0), // txHash - field not required for now
            false, // isRegularExit
            lookupExit[exitId].exitPriority << 1
        );
        withdrawManager.addInput(lookupExit[exitId].exitPriority << 1, 0, exitor, address(oICash));
    }

    function onFinalizeExit(bytes calldata data) external {
        require(
            msg.sender == address(withdrawManager),
            "ONLY_WITHDRAW_MANAGER"
        );
        // this encoded data is compatible with rest of the matic predicates
        (uint256 regularExitId,,address exitor,uint256 exitIdOrAmount, bool isRegularExit) = abi.decode(data, (uint256, address, address, uint256, bool));

        uint256 exitId;
        uint256 payout;

        if (isRegularExit) {
            exitId = regularExitId;
            payout = exitIdOrAmount;
        } else {
            // exit id for MoreVP exits is token amount
            exitId = exitIdOrAmount;

            for (uint256 i = 0; i < lookupExit[exitId].marketsList.length; i++) {
                IMarket market = IMarket(lookupExit[exitId].marketsList[i]);
                if (market.isFinalized()) {
                    payout = payout.add(processExitForFinalizedMarket(market, exitor, exitId));
                } else {
                    processExitForMarket(market, exitor, exitId); 
                }
            }
            payout = payout.add(lookupExit[exitId].exitCash.balanceOf(exitor));    
            lookupExit[exitId].status = ExitStatus.Finalized;
        }

        (bool oiCashWithdrawSuccess, uint256 feesOwed) = oICash.withdraw(payout);
        require(oiCashWithdrawSuccess, "transfer failed");
        if (payout > feesOwed) {
            require(
                augurCash.transfer(exitor, payout - feesOwed),
                "cash transfer failed"
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
                "buying complete sets failed"
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

    function verifyDeprecation(bytes calldata exit, bytes calldata /* inputUtxo */, bytes calldata challengeData)
        external
        view
        returns (bool)
    {
        uint256 age = withdrawManager.verifyInclusion(challengeData, 0 /* offset */, true /* verifyTxInclusion */);
        // this encoded data is compatible with rest of the matic predicates
        (address exitor,,uint256 exitId,,) = abi.decode(exit, (address, address, uint256, bytes32, bool));
        require(
            lookupExit[exitId].exitPriority < age,
            "provide more recent transaction"
        );

        RLPReader.RLPItem[] memory _challengeData = challengeData.toRlpItem().toList();
        RLPReader.RLPItem[] memory challengeTx = ProofReader.getChallengeTx(_challengeData);

        require(challengeTx.length == 9, "MALFORMED_WITHDRAW_TX");

        (address signer, bytes32 txHash) = erc20Predicate.getAddressFromTx(ProofReader.getChallengeTxBytes(_challengeData));

        require(
            lookupExit[exitId].inFlightTxHash != txHash,
            "Cannot challenge with the exit tx itself"
        );

        bytes memory txData = ProofReader.getTxData(challengeTx);
        address to = ProofReader.getTxTo(challengeTx);

        if (signer == exitor) {
            if (int256(ProofReader.getTxNonce(challengeTx)) <= lookupExit[exitId].lastGoodNonce) {
                return false;
            }
            
            // TODO perform 1 call to registry and return some enum instead
            if (predicateRegistry.belongsToStateDeprecationContractSet(to)) {
                return true;
            } else if (to == predicateRegistry.maticShareToken()) {
                return shareTokenPredicate.isValidDeprecation(txData);
            } else if (to == predicateRegistry.maticCash()) {
                bytes4 funcSig = ProofReader.getFunctionSignature(txData);
                if (funcSig == TRANSFER_FUNC_SIG || funcSig == BURN_FUNC_SIG) {
                    return true;
                }
            }
        }

        return isValidDeprecation(
            txData, 
            to, 
            ProofReader.getLogIndex(_challengeData), // log index is order index 
            exitor,
            exitId
        );
    }

    function isValidDeprecation(bytes memory txData, address to, uint256 orderIndex, address exitor, uint256 exitId) internal view returns(bool) {
        require(
            to == predicateRegistry.zeroXTrade(),
            "not zeroXTrade"
        );

        require(
            ProofReader.getFunctionSignature(txData) == ZEROX_TRADE_FUNC_SIG,
            "not ZEROX_TRADE_FUNC_SIG"
        );

        (,,, IExchange.Order[] memory _orders, bytes[] memory _signatures) = abi.decode(
            BytesLib.slice(txData, 4, txData.length - 4),
            (uint256, address, bytes32, IExchange.Order[], bytes[])
        );

        IExchange.Order memory order = _orders[orderIndex];
        require(
            order.makerAddress == exitor,
            "Order not signed by the exitor"
        );

        require(
            lookupExit[exitId].startExitTime <= order.expirationTimeSeconds,
            "expired order"
        );

        IExchange _maticExchange = zeroXTrade.getExchangeFromAssetData(order.makerAssetData);
        ZeroXExchange exchange = ZeroXExchange(predicateRegistry.zeroXExchange(address(_maticExchange)));
        IExchange.OrderInfo memory orderInfo = exchange.getOrderInfo(order);

        require(
            exchange.isValidSignature(orderInfo.orderHash, order.makerAddress, _signatures[orderIndex]),
            "invalid signature"
        );

        return true;
    }
}
