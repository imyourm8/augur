pragma solidity 0.5.15;
pragma experimental ABIEncoderV2;

import 'ROOT/matic/PredicateRegistry.sol';
import 'ROOT/matic/libraries/BytesLib.sol';
import 'ROOT/matic/libraries/RLPEncode.sol';
import 'ROOT/matic/libraries/RLPReader.sol';
import 'ROOT/matic/libraries/ProofReader.sol';
import 'ROOT/matic/plasma/IWithdrawManager.sol';
import 'ROOT/matic/plasma/IErc20Predicate.sol';
import 'ROOT/matic/ShareTokenPredicate.sol';
import 'ROOT/matic/plasma/IRegistry.sol';
import 'ROOT/matic/plasma/IDepositManager.sol';
import 'ROOT/matic/IExitShareToken.sol';
import 'ROOT/matic/IExitCash.sol';
import 'ROOT/matic/IExitZeroXTrade.sol';
import 'ROOT/matic/IAugurPredicate.sol';
import 'ROOT/matic/AugurPredicateBase.sol';

import 'ROOT/reporting/ShareToken.sol';
import 'ROOT/reporting/IMarket.sol';

import 'ROOT/para/interfaces/IParaOICash.sol';
import 'ROOT/para/ParaShareToken.sol';
import 'ROOT/para/interfaces/IFeePot.sol';

import 'ROOT/external/IExchange.sol';
import 'ROOT/trading/IAugurTrading.sol';
import 'ROOT/Cash.sol';
import 'ROOT/libraries/Initializable.sol';
import 'ROOT/libraries/math/SafeMathUint256.sol';

contract AugurPredicateExtension is AugurPredicateBase {
    using RLPReader for bytes;
    using RLPReader for RLPReader.RLPItem;
    using SafeMathUint256 for uint256;

    function deposit(uint256 amount) public {
        require(
            augurCash.transferFrom(msg.sender, address(this), amount),
            '6' // "Cash transfer failed"
        );
        require(
            oiCash.deposit(amount),
            '19' // "OICash deposit failed"
        );

        // use deposit bulk to ignore deposit limit
        address[] memory tokens = new address[](1);
        tokens[0] = address(oiCash);

        uint256[] memory amounts = new uint256[](1);
        amounts[0] = amount;

        oiCash.approve(address(depositManager), amount);

        depositManager.depositBulk(tokens, amounts, msg.sender);
        depositManager.transferAssets(address(oiCash), address(this), amount);
    }

    function startExit() external {
        // address exitor = msg.sender;
        // ExitData storage exit = getExit(exitId);
        // require(
        //     exit.status == ExitStatus.Initialized ||
        //         exit.status == ExitStatus.InFlightExecuted,
        //     '9' // "incorrect status"
        // );
        // exit.status = ExitStatus.InProgress;
        // exit.startExitTime = now;

        // uint256 withdrawExitId = exit.exitPriority << 1;
        // address rootToken = address(oiCash);
        // withdrawManager.addExitToQueue(
        //     exitor,
        //     predicateRegistry.cash(), // OICash maps to TradingCash on matic
        //     rootToken,
        //     exitId, // exitAmountOrTokenId - think of exitId like a token Id
        //     bytes32(0), // txHash - field not required for now
        //     false, // isRegularExit
        //     withdrawExitId
        // );
        // withdrawManager.addInput(withdrawExitId, 0, exitor, rootToken);
    }

    /**
     * @notice Call initializeForExit to instantiate new shareToken and Cash contracts to replay history from Matic
     * @dev new ShareToken() / new Cash() causes the bytecode of this contract to be too large, working around that limitation for now,
        however, the intention is to deploy a new ShareToken and Cash contract per exit - todo: use proxies for that
     */
    function initializeForExit() external returns (uint256 exitId) {
        // lookupExit[exitId] = ExitData({
        //     exitShareToken: exitShareToken,
        //     exitCash: exitCash,
        //     exitPriority: 0,
        //     startExitTime: 0,
        //     lastGoodNonce: -1,
        //     inFlightTxHash: bytes32(0),
        //     status: ExitStatus.Initialized,
        //     marketsList: new IMarket[](0)
        // });
    }

    // function claimLastGoodNonce(bytes calldata lastCheckpointedTx, uint256 ) external {
    //     uint256 age = withdrawManager.verifyInclusion(
    //         lastCheckpointedTx,
    //         0, /* offset */
    //         true /* verifyTxInclusion */
    //     );
    //     ExitData storage exit = getExit(msg.sender);

    //     exit.exitPriority = exit.exitPriority.max(
    //         age
    //     );

    //     exit.lastGoodNonce = int256(
    //         ProofReader.getTxNonce(
    //             ProofReader.convertToExitPayload(lastCheckpointedTx)
    //         )
    //     );
    // }

    
    // function claimShareBalance(bytes calldata data) external {
    //     uint256 exitId = getExitId(msg.sender);
    //     ExitData storage exit = getExit(exitId);
    //     // require(
    //     //     exit.status == ExitStatus.Initialized,
    //     //     '16' // "Predicate.claimShareBalance: Please call initializeForExit first"
    //     // );
    //     (
    //         address account,
    //         address market,
    //         uint256 outcome,
    //         uint256 balance,
    //         uint256 age
    //     ) = shareTokenPredicate.parseData(data);

    //     require(exitShareToken.balanceOfMarketOutcome(IMarket(market), outcome, account) == 0, '16'); // shares were claimed

    //     _addMarketToExit(exitId, market);

    //     setIsExecuting(true);
    //     exit.exitPriority = exit.exitPriority.max(
    //         age
    //     );
    //     exitShareToken.mint(
    //         account,
    //         IMarket(market),
    //         outcome,
    //         balance
    //     );
    //     setIsExecuting(false);
    // }

    function prepareInFlightTradeExit(bytes calldata shares, bytes calldata cash) external {
        setIsExecuting(true);
        address sharesClaimedAccount = claimShareBalances(shares);
        require(sharesClaimedAccount == msg.sender, '100'); // can't start exit with claiming counterparty's shares

        if (cash.length > 0) {
            // not mandatory for in-flight trade
            claimCashBalance(cash, sharesClaimedAccount);
        }
        
        setIsExecuting(false);
    }

    
    // function claimCashBalance(bytes calldata data, address participant)
    //     external
    // {
    //     uint256 exitId = getExitId(msg.sender);
    //     ExitData storage exit = getExit(exitId);
    //     // require(
    //     //     exit.status == ExitStatus.Initialized,
    //     //     '16' // "Predicate.claimCashBalance: Please call initializeForExit first"
    //     // );
    //     bytes memory _preState = erc20Predicate.interpretStateUpdate(
    //         abi.encode(
    //             data,
    //             participant,
    //             true, /* verifyInclusionInCheckpoint */
    //             false /* isChallenge */
    //         )
    //     );

    //     require(exitCash.balanceOf(participant) == 0, '16'); // cash was claimed

    //     (uint256 closingBalance, uint256 age, , address tokenAddress) = abi
    //         .decode(_preState, (uint256, uint256, address, address));

    //     require(tokenAddress == predicateRegistry.cash(), '17'); // "not matic cash"

    //     exit.exitPriority = exit.exitPriority.max(
    //         age
    //     );

    //     setIsExecuting(true);
    //     exitCash.faucet(participant, closingBalance);
    //     setIsExecuting(false);
    // }

    function startExitWithBurntTokens(bytes calldata data) external {
        bytes memory _preState = erc20Predicate.interpretStateUpdate(
            abi.encode(
                data,
                msg.sender,
                true, /* verifyInclusionInCheckpoint */
                false /* isChallenge */
            )
        );

        (
            uint256 exitAmount,
            uint256 age,
            address childToken,
            address rootToken
        ) = abi.decode(_preState, (uint256, uint256, address, address));

        RLPReader.RLPItem[] memory log = ProofReader.getLog(
            ProofReader.convertToExitPayload(data)
        );
        exitAmount = BytesLib.toUint(log[2].toBytes(), 0);

        withdrawManager.addExitToQueue(
            msg.sender,
            childToken,
            rootToken,
            exitAmount,
            bytes32(0x0),
            true, /* isRegularExit */
            age << 1
        );
    }
}
