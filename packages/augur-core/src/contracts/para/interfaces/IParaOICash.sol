pragma solidity 0.5.15;

import 'ROOT/para/interfaces/IParaAugur.sol';
import 'ROOT/para/interfaces/IParaUniverse.sol';
import 'ROOT/libraries/token/IERC20.sol';


contract IParaOICash is IERC20 {
    function initialize(IParaAugur _augur, IParaUniverse _universe) external;
    function approveFeePot() external;
    function deposit(uint256 _amount) external returns (bool);
    function withdraw(uint256 _amount) external returns (bool, uint256);
    function buyCompleteSets(IMarket _market, uint256 _amount) external returns (bool);
}