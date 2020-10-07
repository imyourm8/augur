pragma solidity 0.5.15;

import { Cash } from "ROOT/Cash.sol";

contract ExitCashFactory {
  function deploy() public returns(address) {
    return address(new Cash());
  }
}
