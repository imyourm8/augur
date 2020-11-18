pragma solidity 0.5.15;
pragma experimental ABIEncoderV2;

import 'ROOT/trading/Order.sol';
import "ROOT/ICash.sol";
import "ROOT/reporting/IShareToken.sol";

contract IExitFillOrder {
    struct FillZeroXOrderArguments {
        IMarket _market;
        uint256 _outcome;
        uint256 _price;
        Order.Types _orderType;
        address _creator;
        uint256 _amount;
        bytes32 _fingerprint;
        bytes32 _tradeGroupId;
        address _filler;
    }

    function fillZeroXOrder(
        FillZeroXOrderArguments calldata args
    ) external returns (uint256, uint256);
}
