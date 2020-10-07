pragma solidity 0.5.15;

import { ShareToken } from "ROOT/reporting/ShareToken.sol";

contract ExitShareTokenFactory {
  function deploy() public returns(address) {
    return address(new ShareToken());
  }
}
