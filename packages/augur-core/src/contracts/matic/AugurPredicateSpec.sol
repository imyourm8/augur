pragma solidity 0.5.15;

contract AugurPredicateSpec {
    function startExitWithBurntTokens(bytes calldata data) external {}

    function deposit(uint256 amount) public {}

    function prepareInFlightTradeExit(bytes calldata shares, bytes calldata cash) external {}
    
    function startInFlightTradeExit(
        bytes calldata counterPartyShares,
        bytes calldata counterPartyCash,
        bytes calldata tradeData,
        address counterParty
    ) external payable {}

    function startInFlightSharesAndCashExit(
        bytes calldata shares,
        bytes calldata sharesInFlightTx,
        bytes calldata cash,
        bytes calldata cashInFlightTx
    ) external {}

    function getExitId(address exitor) public pure returns (uint256 exitId) {}
}
