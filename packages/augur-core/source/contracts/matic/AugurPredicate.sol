pragma solidity 0.5.10;
pragma experimental ABIEncoderV2;

import { Registry } from "ROOT/matic/Registry.sol";
import { BytesLib } from "ROOT/matic/libraries/BytesLib.sol";
import { RLPReader } from "ROOT/matic/libraries/RLPReader.sol";

import { IShareToken } from "ROOT/reporting/IShareToken.sol";
import { ShareToken } from "ROOT/reporting/ShareToken.sol";
import { IMarket } from "ROOT/reporting/IMarket.sol";
import { IExchange } from "ROOT/external/IExchange.sol";
import { ZeroXTrade } from "ROOT/trading/ZeroXTrade.sol";
import { IAugurTrading } from "ROOT/trading/IAugurTrading.sol";
import { IAugur } from "ROOT/IAugur.sol";

contract AugurPredicate {
    using RLPReader for bytes;
    using RLPReader for RLPReader.RLPItem;

    Registry public registry;

    IAugur public augur;
    ShareToken public shareToken;
    ZeroXTrade public zeroXTrade;

    struct ExitData {
        address shareToken;
        address cash;
    }

    mapping(uint256 => ExitData) public lookupExit;

    function initialize(IAugur _augur, IAugurTrading _augurTrading) public /* @todo beforeInitialized */ {
        // endInitialization();
        augur = _augur;
        // This ShareToken is the real slim shady
        shareToken = ShareToken(_augur.lookup("ShareToken"));
        zeroXTrade = ZeroXTrade(_augurTrading.lookup("ZeroXTrade"));
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
        ZeroXTrade.AugurOrderData memory _augurOrderData = zeroXTrade.parseOrderData(_orders[0]);
        uint256 exitId = getExitId(_augurOrderData.marketAddress, msg.sender);
        if (lookupExit[exitId].shareToken == address(0x0)) {
            initializeForExit(exitId, _augurOrderData.marketAddress);
        }
        zeroXTrade.trade.value(msg.value)(
            _requestedFillAmount,
            _affiliateAddress,
            _tradeGroupId, _orders, _signatures,
            _taker,
            abi.encode(lookupExit[exitId].shareToken, lookupExit[exitId].cash)
        );
        // The trade is valid, @todo start an exit
    }

    function getExitId(address _market, address _exitor) public pure returns(uint256 _exitId) {
        _exitId = uint256(keccak256(abi.encodePacked(_market, _exitor)));
    }

    function initializeForExit(uint256 exitId, address market) internal {
        // initialize with the normal cash for now, but intention is to deploy a new cash contract
        address cash = augur.lookup("Cash");
        // ask the actual mainnet augur ShareToken for the market details
        (uint256 _numOutcomes, uint256 _numTicks) = shareToken.markets(market);

        IShareToken _shareToken = new ShareToken();
        _shareToken.initializeFromPredicate(augur, cash);
        _shareToken.initializeMarket(IMarket(market), _numOutcomes, _numTicks);

        lookupExit[exitId] = ExitData({
            shareToken: address(_shareToken),
            cash: cash
        });
    }
}
