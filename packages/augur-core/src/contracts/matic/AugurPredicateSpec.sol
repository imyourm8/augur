pragma solidity 0.5.15;

contract AugurPredicateSpec {
    function executeInFlightTransaction(bytes memory data) public payable {}

    function startExit(uint256 exitId) external {}

    function startExitWithBurntTokens(bytes calldata data) external {}

    function deposit(uint256 amount) public {}

    function startExit() external {}

    function prepareInFlightTradeExit(bytes calldata shares, bytes calldata cash) external {}
}
