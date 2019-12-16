pragma solidity 0.5.10;
pragma experimental ABIEncoderV2;

import { IMarket } from "ROOT/reporting/IMarket.sol";
import { AugurPredicate } from "ROOT/matic/AugurPredicate.sol";

contract AugurPredicateTest is AugurPredicate {
    function claimShareBalanceFaucet(address to, address market, uint256 outcome, uint256 balance) external {
       uint256 exitId = getExitId(msg.sender);
        require(
            address(lookupExit[exitId].exitShareToken) != address(0x0),
            "Predicate.claimBalanceFaucet: Please call initializeForExit first"
        );
        address _rootMarket = _checkAndAddMaticMarket(exitId, market);
        lookupExit[exitId].exitShareToken.mint(to, _rootMarket, outcome, balance);
    }

    // we could consider actually giving this option to the user
    function clearExit(address _exitor) public {
        delete lookupExit[getExitId(_exitor)];
    }

    function processExitForMarketTest(IMarket market, address exitor, uint256 exitId) public {
        processExitForMarket(market, exitor, exitId);
    }
}
