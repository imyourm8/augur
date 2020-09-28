pragma solidity 0.5.10;

import { Cash } from "ROOT/Cash.sol";

contract ExitCashFactory {
  function deploy() public returns(address cash) {
    cash = address(new Cash());
  }
}
