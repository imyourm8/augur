pragma solidity 0.5.15;
pragma experimental ABIEncoderV2;

import "ROOT/external/IExchange.sol";

contract IExitZeroXTrade {
    function trade(
        bytes calldata data,
        uint256 taker
    ) external payable returns (uint256);

    function getExchange() external view returns(IExchange);
}
