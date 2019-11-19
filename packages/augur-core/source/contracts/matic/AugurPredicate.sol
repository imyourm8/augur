pragma solidity 0.5.10;
pragma experimental ABIEncoderV2;

import { Registry } from "ROOT/matic/Registry.sol";
import { BytesLib } from "ROOT/matic/libraries/BytesLib.sol";
import { RLPReader } from "ROOT/matic/libraries/RLPReader.sol";

import { IShareToken } from "ROOT/reporting/IShareToken.sol";
import { IMarket } from "ROOT/reporting/IMarket.sol";
import { IExchange } from "ROOT/external/IExchange.sol";
import { ZeroXTrade } from "ROOT/trading/ZeroXTrade.sol";
import { IAugurTrading } from "ROOT/trading/IAugurTrading.sol";
import { IAugur } from "ROOT/IAugur.sol";

contract AugurPredicate {
    using RLPReader for bytes;
    using RLPReader for RLPReader.RLPItem;

    Registry public registry;
    IShareToken public shareToken;

    ZeroXTrade public zeroXTrade;

    function initialize(IAugur _augur, IAugurTrading _augurTrading) public /* @todo beforeInitialized */ {
        // endInitialization();
        shareToken = IShareToken(_augur.lookup("ShareToken"));
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
        shareToken.setExitId(_augurOrderData.marketAddress, msg.sender);
        zeroXTrade.trade.value(msg.value)(_requestedFillAmount, _affiliateAddress, _tradeGroupId, _orders, _signatures, _taker);
        // The trade is valid, @todo start an exit
        shareToken.unsetExitId();
    }
}
