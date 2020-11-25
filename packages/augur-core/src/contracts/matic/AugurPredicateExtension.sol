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

    function prepareInFlightTradeExit(bytes calldata shares, bytes calldata cash) external {
        setIsExecuting(true); 

        claimSharesAndCash(shares, cash, msg.sender);
        
        setIsExecuting(false);
    }

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
