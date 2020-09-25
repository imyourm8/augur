pragma solidity 0.5.10;

interface IDepositManager {
    function depositERC20ForUser(address _token, address _user, uint256 _amount) external;
    function transferAssets(address _token, address _user, uint256 _amountOrNFTId) external;
}
