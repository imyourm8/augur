pragma solidity 0.5.15;

import "ROOT/matic/ExitShareToken.sol";
import "ROOT/matic/ITokenFactory.sol";

contract ExitShareTokenFactory is ITokenFactory {
  function deploy() public returns(address) {
    return address(new ExitShareToken());
  }
}
