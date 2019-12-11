pragma solidity 0.5.10;
pragma experimental ABIEncoderV2;

import { Registry } from "ROOT/matic/Registry.sol";
import { BytesLib } from "ROOT/matic/libraries/BytesLib.sol";
import { RLPReader } from "ROOT/matic/libraries/RLPReader.sol";
import { IWithdrawManager } from "ROOT/matic/IWithdrawManager.sol";

import { IShareToken } from "ROOT/reporting/IShareToken.sol";
import { ShareToken } from "ROOT/reporting/ShareToken.sol";
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

    bytes32 constant SHARE_TOKEN_BALANCE_CHANGED_EVENT_SIG = 0x350ea32dc29530b9557420816d743c436f8397086f98c96292138edd69e01cb3;
    uint256 MAX_LOGS = 100;

    Registry public registry;
    IWithdrawManager public withdrawManager;

    IAugur public augur;
    ShareToken public shareToken;
    IZeroXTrade public zeroXTrade;

    struct ExitData {
        address shareToken;
        address cash;
        uint256 exitPriority;
        bool exitInitiated;
        address[] marketsList;
        mapping(address => bool) markets;
    }

    mapping(uint256 => ExitData) public lookupExit;

    function initialize(IAugur _augur, IAugurTrading _augurTrading) public beforeInitialized {
        endInitialization();
        augur = _augur;
        // This ShareToken is the real slim shady (from mainnet augur)
        shareToken = ShareToken(_augur.lookup("ShareToken"));
        zeroXTrade = IZeroXTrade(_augurTrading.lookup("ZeroXTrade"));
    }

    function initialize2(address _registry, address _withdrawManager) public /* @todo make part of initialize() */ {
        registry = Registry(_registry);
        withdrawManager = IWithdrawManager(_withdrawManager);
    }

    /**
     * @notice Call initializeForExit to instantiate new shareToken and Cash contracts to replay history from Matic
     * @dev new ShareToken() / new Cash() causes the bytecode of this contract to be too large, working around that limitation for now,
        however, the intention is to deploy a new ShareToken and Cash contract per exit
     * @param market Market address to start the exit for
     */
    // function initializeForExit(address market) external returns(uint256 exitId) {
    function initializeForExit(address market, address shareToken_, address cash_) external returns(uint256 exitId) {
        (address _rootMarket, uint256 _numOutcomes, uint256 _numTicks) = registry.childToRootMarket(market);
        require(
            _rootMarket != address(0x0),
            "AugurPredicate:initializeForExit: Market is not mapped"
        );
        exitId = getExitId(msg.sender);

        // IShareToken _shareToken = new ShareToken();
        // Cash cash = new Cash();
        // cash.initialize(augur);

        IShareToken _shareToken = IShareToken(shareToken_);
        _shareToken.initializeFromPredicate(augur, cash_);
        // ask the actual mainnet augur ShareToken for the market details
        _shareToken.initializeMarket(IMarket(_rootMarket), _numOutcomes, _numTicks);

        lookupExit[exitId] = ExitData({
            shareToken: shareToken_,
            cash: cash_,
            exitPriority: 0,
            exitInitiated: false,
            marketsList: new address[](0)
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
    function claimBalance(bytes calldata data) external {
        uint256 exitId = getExitId(msg.sender);
        require(
            lookupExit[exitId].shareToken != address(0x0),
            "Predicate.claimBalance: Please call initializeForExit first"
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
            "ShareToken.claimBalance: Not ShareTokenBalanceChanged event signature"
        );
        // inputItems[1] is the universe address
        address account = address(inputItems[2].toUint());
        address market = address(inputItems[3].toUint());
        uint256 outcome = BytesLib.toUint(logData, 0);
        uint256 balance = BytesLib.toUint(logData, 32);
        (address _rootMarket,,) = registry.childToRootMarket(market);
        _addMarketToExit(exitId, _rootMarket);
        ShareToken(lookupExit[exitId].shareToken).mint(account, _rootMarket, outcome, balance);
    }

    function _addMarketToExit(uint256 exitId, address market) internal {
        if (!lookupExit[exitId].markets[market]) {
            lookupExit[exitId].markets[market] = true;
            lookupExit[exitId].marketsList.push(market);
        }
    }

    // @todo move to TestAugurPredicate
    function claimBalanceFaucet(address to, address market, uint256 outcome, uint256 balance) external {
       uint256 exitId = getExitId(msg.sender);
        require(
            lookupExit[exitId].shareToken != address(0x0),
            "Predicate.trade: Please call initializeForExit first"
        );
        (address _rootMarket,,) = registry.childToRootMarket(market);
        IShareToken(lookupExit[exitId].shareToken).mint(to, _rootMarket, outcome, balance);
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
            lookupExit[exitId].shareToken != address(0x0),
            "Predicate.trade: Please call initializeForExit first"
        );

        setIsExecuting(exitId, true);
        zeroXTrade.trade.value(msg.value)(
            _requestedFillAmount,
            _affiliateAddress,
            _tradeGroupId, _orders, _signatures,
            _taker,
            abi.encode(lookupExit[exitId].shareToken, lookupExit[exitId].cash)
        );
        setIsExecuting(exitId, false);
        // The trade is valid, @todo start an exit
    }

    function startExit() public {
        uint256 exitId = getExitId(msg.sender);
        require(
            lookupExit[exitId].shareToken != address(0x0),
            "Predicate.startExit: Please call initializeForExit first"
        );
        require(
            lookupExit[exitId].exitInitiated == false,
            "Predicate.startExit: Exit is already initiated"
        );
        lookupExit[exitId].exitInitiated = true;
        withdrawManager.addExitToQueue(lookupExit[exitId].exitPriority, msg.sender /* exitor */);
    }

    event ExitFinalized(uint256 indexed exitId);
    function onFinalizeExit(bytes calldata data)
        external
    {
        require(
            msg.sender == address(withdrawManager),
            "ONLY_WITHDRAW_MANAGER"
        );
        // this encoded data is compatible with rest of the matic predicates
        (uint256 exitId,,,) = abi.decode(data, (uint256, address, address, uint256));
        // uint256 _numberOfOutcomes = IMarket(_market).getNumberOfOutcomes();
        // ShareToken(lookupExit[exitId].shareToken).mint(account, _rootMarket, outcome, balance);
        emit ExitFinalized(exitId);
    }

    function getExitId(address _exitor) public pure returns(uint256 _exitId) {
        _exitId = uint256(keccak256(abi.encodePacked(_exitor)));
    }

    function setIsExecuting(uint256 exitId, bool isExecuting) internal {
        Cash(lookupExit[exitId].cash).setIsExecuting(isExecuting);
        ShareToken(lookupExit[exitId].shareToken).setIsExecuting(isExecuting);
    }
}
