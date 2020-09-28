pragma solidity 0.5.10;

import { ShareToken } from "ROOT/reporting/ShareToken.sol";

contract ExitShareTokenFactory {
  function deploy() public returns(address shareToken) {
    shareToken = address(new ShareToken());
  }
}
