pragma solidity 0.5.10;

import 'ROOT/libraries/Initializable.sol';

contract ExecutorAcl is Initializable {
    bool _isExecuting;
    address _augurPredicate;

    // function initialize(address augurPredicate) public {
    //     endInitialization();
    //     _augurPredicate = augurPredicate;
    // }

    modifier onlyPredicate() {
        require(msg.sender == _augurPredicate, "ExecutorAcl.onlyPredicate is authorized");
        _;
    }

    // When _isExecuting is set, token transfer approvals etc. within the matic sandbox will be bypassed
    modifier isExecuting() {
        require(_isExecuting, 'Needs to be executing');
        _;
    }

    function setIsExecuting(bool executing) public onlyPredicate {
        _isExecuting = executing;
    }
}
