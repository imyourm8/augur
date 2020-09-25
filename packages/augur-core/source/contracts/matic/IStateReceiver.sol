pragma solidity 0.5.10;

interface IStateReceiver {
  function onStateReceive(uint256 id, bytes calldata data) external;
}
