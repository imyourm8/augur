pragma solidity 0.5.10;

contract IWithdrawManager {
  function verifyInclusion(bytes calldata data, uint8 offset, bool verifyTxInclusion) external view returns (uint256 age);
  function addExitToQueue(uint256 priority, address exitor, address rootToken) external;
}
