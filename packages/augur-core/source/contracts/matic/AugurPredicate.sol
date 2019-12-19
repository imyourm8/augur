pragma solidity 0.5.10;
pragma experimental ABIEncoderV2;

import { PredicateRegistry } from "ROOT/matic/PredicateRegistry.sol";
import { BytesLib } from "ROOT/matic/libraries/BytesLib.sol";
import { RLPReader } from "ROOT/matic/libraries/RLPReader.sol";
import { IWithdrawManager } from "ROOT/matic/plasma/IWithdrawManager.sol";

import { IShareToken } from "ROOT/reporting/IShareToken.sol";
import { OICash } from "ROOT/reporting/OICash.sol";
import { IMarket } from "ROOT/reporting/IMarket.sol";
import { IExchange } from "ROOT/external/IExchange.sol";
import { IZeroXTrade } from "ROOT/trading/IZeroXTrade.sol";
import { IAugurTrading } from "ROOT/trading/IAugurTrading.sol";
import { IAugur } from "ROOT/IAugur.sol";
import { Cash } from "ROOT/Cash.sol";
import { Initializable } from "ROOT/libraries/Initializable.sol";
import { SafeMathUint256 } from "ROOT/libraries/math/SafeMathUint256.sol";

contract AugurPredicate is Initializable {
    using RLPReader for bytes;
    using RLPReader for RLPReader.RLPItem;
    using SafeMathUint256 for uint256;

    event ExitFinalized(uint256 indexed exitId,  address indexed exitor);

    bytes32 constant SHARE_TOKEN_BALANCE_CHANGED_EVENT_SIG = 0x350ea32dc29530b9557420816d743c436f8397086f98c96292138edd69e01cb3;
    uint256 MAX_LOGS = 100;

    PredicateRegistry public predicateRegistry;
    IWithdrawManager public withdrawManager;

    IAugur public augur;
    IShareToken public augurShareToken;
    IZeroXTrade public zeroXTrade;
    Cash public augurCash;
    OICash public oICash;
    address public childOICash;

    mapping(address => bool) claimedTradingProceeds;
    uint256 private constant MAX_APPROVAL_AMOUNT = 2 ** 256 - 1;

    struct ExitData {
        IShareToken exitShareToken;
        Cash exitCash;
        uint256 exitPriority;
        bool exitInitiated;
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
        OICash _oICash,
        address _childOICash,
        IAugur _mainAugur
    ) public /* @todo make part of initialize() */ {
        predicateRegistry = _predicateRegistry;
        withdrawManager = _withdrawManager;
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

        // IShareToken _exitShareToken = new ShareToken();
        // Cash cash = new Cash();
        // cash.initialize(augur);

        _exitShareToken.initializeFromPredicate(augur, address(_exitCash));

        lookupExit[exitId] = ExitData({
            exitShareToken: _exitShareToken,
            exitCash: _exitCash,
            exitPriority: 0,
            exitInitiated: false,
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
            address(lookupExit[exitId].exitShareToken) != address(0x0),
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
        lookupExit[exitId].exitShareToken.mint(account, _rootMarket, outcome, balance);
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
            address(lookupExit[exitId].exitShareToken) != address(0x0),
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
            address(lookupExit[exitId].exitShareToken) != address(0x0),
            "Predicate.startExit: Please call initializeForExit first"
        );
        require(
            lookupExit[exitId].exitInitiated == false,
            "Predicate.startExit: Exit is already initiated"
        );
        lookupExit[exitId].exitInitiated = true;
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
        for(uint256 i = 0; i < lookupExit[exitId].marketsList.length; i++) {
            IMarket market = IMarket(lookupExit[exitId].marketsList[i]);
            if (market.isFinalized()) {
                processExitForFinalizedMarket(market, exitor, exitId);
            } else {
                processExitForMarket(market, exitor, exitId);
            }
        }
        emit ExitFinalized(exitId, exitor);
    }

    function processExitForFinalizedMarket(IMarket market, address exitor, uint256 exitId) internal {
        claimTradingProceeds(market);

        // since trading proceeds have been called, predicate has 0 shares for all outcomes;
        // so the exitor will get the payout for the shares

        uint256 payout = calculateProceeds(market, exitor, exitId);
        if (payout == 0) return;

        (bool _success, uint256 _feesOwed) = oICash.withdraw(payout);
        require(_success, "OICash.Withdraw failed");
        if (payout <= _feesOwed) return;
        require(
            augurCash.transfer(exitor, payout - _feesOwed),
            "Cash transfer failed"
        );
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
}