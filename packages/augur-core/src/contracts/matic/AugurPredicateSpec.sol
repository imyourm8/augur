pragma solidity 0.5.15;

contract AugurPredicateSpec {
    function executeInFlightTransaction(bytes memory data) public payable {}

    function startExit(uint256 exitId) external {}

    function claimShareBalance(bytes calldata data) external {}

    function claimCashBalance(
        bytes calldata data,
        address participant,
        uint256 exitId
    ) external {}

    function startExitWithBurntTokens(bytes calldata data) external {}
}
