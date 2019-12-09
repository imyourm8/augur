pragma solidity 0.5.10;
pragma experimental ABIEncoderV2;

import { Registry } from "ROOT/matic/Registry.sol";
import { BytesLib } from "ROOT/matic/libraries/BytesLib.sol";
import { RLPReader } from "ROOT/matic/libraries/RLPReader.sol";

import { IShareToken } from "ROOT/reporting/IShareToken.sol";
import { ShareToken } from "ROOT/reporting/ShareToken.sol";
import { IMarket } from "ROOT/reporting/IMarket.sol";
import { IExchange } from "ROOT/external/IExchange.sol";
import { IZeroXTrade } from "ROOT/trading/IZeroXTrade.sol";
import { IAugurTrading } from "ROOT/trading/IAugurTrading.sol";
import { IAugur } from "ROOT/IAugur.sol";
import { Cash } from "ROOT/Cash.sol";
import { Initializable } from "ROOT/libraries/Initializable.sol";

contract AugurPredicate is Initializable {
    using RLPReader for bytes;
    using RLPReader for RLPReader.RLPItem;

    bytes32 constant SHARE_TOKEN_BALANCE_CHANGED_EVENT_SIG = 0x350ea32dc29530b9557420816d743c436f8397086f98c96292138edd69e01cb3;
    uint256 MAX_LOGS = 10;

    Registry public registry;

    IAugur public augur;
    ShareToken public shareToken;
    IZeroXTrade public zeroXTrade;

    struct ExitData {
        address shareToken;
        address cash;
    }

    mapping(uint256 => ExitData) public lookupExit;

    function initialize(IAugur _augur, IAugurTrading _augurTrading) public beforeInitialized {
        endInitialization();
        augur = _augur;
        // This ShareToken is the real slim shady (from mainnet augur)
        shareToken = ShareToken(_augur.lookup("ShareToken"));
        zeroXTrade = IZeroXTrade(_augurTrading.lookup("ZeroXTrade"));
    }

    function setRegistry(address _registry) public /* @todo make part of initialize() */ {
        registry = Registry(_registry);
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
        exitId = getExitId(market, msg.sender);

        // IShareToken _shareToken = new ShareToken();
        // Cash cash = new Cash();
        // cash.initialize(augur);

        IShareToken _shareToken = IShareToken(shareToken_);
        _shareToken.initializeFromPredicate(augur, cash_);
        // ask the actual mainnet augur ShareToken for the market details
        _shareToken.initializeMarket(IMarket(_rootMarket), _numOutcomes, _numTicks);

        lookupExit[exitId] = ExitData({ shareToken: shareToken_, cash: cash_ });
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
        RLPReader.RLPItem[] memory referenceTxData = data.toRlpItem().toList();
        bytes memory receipt = referenceTxData[6].toBytes();
        RLPReader.RLPItem[] memory inputItems = receipt.toRlpItem().toList();
        uint256 logIndex = referenceTxData[9].toUint();
        require(logIndex < MAX_LOGS, "Supporting a max of 10 logs");
        // uint256 age = withdrawManager.verifyInclusion(data, 0 /* offset */, false /* verifyTxInclusion */);
        inputItems = inputItems[3].toList()[logIndex].toList(); // select log based on given logIndex
        bytes memory logData = inputItems[2].toBytes();
        inputItems = inputItems[1].toList(); // topics
        // now, inputItems[i] refers to i-th (0-based) topic in the topics array
        // event ShareTokenBalanceChanged(address indexed universe, address indexed account, address indexed market, uint256 outcome, uint256 balance);
        require(
            bytes32(inputItems[0].toUint()) == SHARE_TOKEN_BALANCE_CHANGED_EVENT_SIG,
            "ShareToken.claimBalance: Not ShareTokenBalanceChanged event signature"
        );
        // @todo is Universe relevent?
        address account = address(inputItems[2].toUint());
        address market = address(inputItems[3].toUint());
        uint256 outcome = inputItems[4].toUint();
        uint256 balance = inputItems[5].toUint();
        uint256 exitId = getExitId(market, msg.sender);
        require(
            lookupExit[exitId].shareToken != address(0x0),
            "Predicate.trade: Please call initializeForExit first"
        );
        ShareToken(lookupExit[exitId].shareToken).mint(msg.sender, market, outcome, balance);
    }

    function claimBalanceFaucet(address to, address market, uint256 outcome, uint256 balance) external {
       uint256 exitId = getExitId(market, msg.sender);
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
        IZeroXTrade.AugurOrderData memory _augurOrderData = zeroXTrade.parseOrderData(_orders[0]);
        uint256 exitId = getExitId(_augurOrderData.marketAddress, msg.sender);
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

    function getExitId(address _market, address _exitor) public pure returns(uint256 _exitId) {
        _exitId = uint256(keccak256(abi.encodePacked(_market, _exitor)));
    }

    function setIsExecuting(uint256 exitId, bool isExecuting) internal {
        Cash(lookupExit[exitId].cash).setIsExecuting(isExecuting);
        ShareToken(lookupExit[exitId].shareToken).setIsExecuting(isExecuting);
    }
}
