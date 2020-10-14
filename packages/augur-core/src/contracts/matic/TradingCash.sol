pragma solidity 0.5.15;

import 'ROOT/libraries/token/ERC20.sol';
import 'ROOT/matic/plasma/BaseStateSyncVerifier.sol';
import 'ROOT/matic/plasma/IStateReceiver.sol';

contract TradingCash is IStateReceiver, BaseStateSyncVerifier, ERC20 {
    address public childChain;
    address public rootToken;

    event Deposit(
        address indexed token,
        address indexed from,
        uint256 amount,
        uint256 input1,
        uint256 output1
    );

    event Withdraw(
        address indexed token,
        address indexed from,
        uint256 amount,
        uint256 input1,
        uint256 output1
    );

    event LogTransfer(
        address indexed token,
        address indexed from,
        address indexed to,
        uint256 amount,
        uint256 input1,
        uint256 input2,
        uint256 output1,
        uint256 output2
    );

    event ChildChainChanged(
        address indexed previousAddress,
        address indexed newAddress
    );

    constructor(
      address _rootToken
    ) public {
      rootToken = _rootToken;
    }

    modifier onlyChildChain() {
        require(
            msg.sender == childChain,
            "Child token: caller is not the child chain contract"
        );
        _;
    }

    function changeChildChain(address newAddress) public onlyOwner {
        require(
            newAddress != address(0),
            "Child token: new child address is the zero address"
        );

        emit ChildChainChanged(childChain, newAddress);
        childChain = newAddress;
    }

    function deposit(address user, uint256 amount) public onlyChildChain {
        require(amount > 0, "incorrect deposit amount");
        require(user != address(0x0), "incorrect deposit user");

        uint256 input1 = balanceOf(user);
        _mint(user, amount);

        emit Deposit(rootToken, user, amount, input1, balanceOf(user));
    }

    function withdraw(uint256 amount) public payable {
        _withdraw(msg.sender, amount);
    }

    function _withdraw(address user, uint256 amount) private {
      uint256 input = balanceOf(user);
      _burn(user, amount);

      emit Withdraw(rootToken, user, amount, input, balanceOf(user));
    }

    function onStateReceive(
        uint256, /* id */
        bytes calldata data
    ) external onlyStateSyncer {
        (address user, uint256 burnAmount) = abi.decode(
            data,
            (address, uint256)
        );

        uint256 balance = balanceOf(user);
        if (balance < burnAmount) {
            burnAmount = balance;
        }

        _withdraw(user, burnAmount);
    }

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) public returns (bool) {
        require(from != address(0), "from == 0");
        require(to != address(0), "to == 0");

        uint256 input1 = balanceOf(from);
        uint256 input2 = balanceOf(to);

        require(input1 >= value, "not enough funds");

        _transfer(from, to, value);

        emit LogTransfer(
            rootToken,
            from,
            to,
            value,
            input1,
            input2,
            balanceOf(from),
            balanceOf(to)
        );

        return true;
    }

    function onTokenTransfer(address _from, address _to, uint256 _value) internal {}

    // function allowance(address, address) public view returns (uint256) {
    //     revert("Disabled feature");
    // }

    // function approve(address, uint256) public returns (bool) {
    //     revert("Disabled feature");
    // }

    // function transferFrom(address, address, uint256) public returns (bool) {
    //     revert("Disabled feature");
    // }
}
