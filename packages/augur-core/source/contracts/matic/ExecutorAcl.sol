pragma solidity 0.5.10;

contract ExecutorAcl {
    bool _isExecuting;
    address _augurPredicate;

    // constructor(address augurPredicate) public {
    //     _augurPredicate = augurPredicate;
    // }

    modifier onlyPredicate() {
        /* todo onlyPredicate */
        _;
    }

    // When _isExecuting is set, token transfer approvals etc. within the matic sandbox will be bypassed
    modifier isExecuting() {
        require(_isExecuting, 'Needs to be executing');
        _;
    }

    function setIsExecuting(bool _executing) public onlyPredicate {
        _isExecuting = _executing;
    }
}

