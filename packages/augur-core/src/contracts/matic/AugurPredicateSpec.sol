pragma solidity 0.5.15;

contract AugurPredicateSpec {
    function startExitWithBurntTokens(bytes calldata data) external {}

    function deposit(uint256 amount) public {}

    function prepareInFlightTradeExit(bytes calldata shares, bytes calldata cash) external {}
    
    function startInFlightTradeExit() public {}

    function executeInFlightTransaction(bytes memory data) public payable {}
}
