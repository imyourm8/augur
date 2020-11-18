pragma solidity 0.5.15;

import 'ROOT/libraries/Initializable.sol';

contract ExecutorAcl is Initializable {
    bool allowExecution;
    address internal augurPredicate;

    modifier onlyPredicate() {
        _assertOnlyPredicate();
        _;
    }

    // When _isExecuting is set, token transfer approvals etc. within the matic sandbox will be bypassed
    modifier isExecuting() {
        _assertIsExecuting();
        _;
    }

    function _assertOnlyPredicate() private view {
        require(msg.sender == augurPredicate, "ExecutorAcl.onlyPredicate is authorized");
    }

    function _assertIsExecuting() private view {
        require(allowExecution, 'Needs to be executing');
    }

    function setIsExecuting(bool executing) public onlyPredicate {
        allowExecution = executing;
    }
}
