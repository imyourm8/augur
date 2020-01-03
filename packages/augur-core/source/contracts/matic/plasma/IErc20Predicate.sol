pragma solidity 0.5.10;

contract IErc20Predicate {
  function interpretStateUpdate(bytes calldata state) external view returns (bytes memory);
}
