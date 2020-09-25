pragma solidity 0.5.10;

contract IRegistry {
  function getChildChainAndStateSender() public view returns(address, address);
}
