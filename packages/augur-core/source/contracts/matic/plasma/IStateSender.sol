pragma solidity 0.5.10;

interface IStateSender {
  function syncState(address receiver, bytes calldata data) external;
}
