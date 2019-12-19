pragma solidity 0.5.10;

contract IWithdrawManager {
  function verifyInclusion(bytes calldata data, uint8 offset, bool verifyTxInclusion) external view returns (uint256 age);
  function addExitToQueue(
      address exitor,
      address childToken,
      address rootToken,
      uint256 exitAmountOrTokenId,
      bytes32 txHash,
      bool isRegularExit,
      uint256 priority)
    external;
}