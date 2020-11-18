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

contract AugurPredicateBase {
    uint256 internal constant MAX_APPROVAL_AMOUNT = 2**256 - 1;

    bytes4 internal constant TRANSFER_FUNC_SIG = 0xa9059cbb;
    // trade(uint256,bytes32,bytes32,uint256,uint256,(address,address,address,address,uint256,uint256,uint256,uint256,uint256,uint256,bytes,bytes,bytes,bytes)[],bytes[])
    bytes4 internal constant ZEROX_TRADE_FUNC_SIG = 0x2f562016;
    bytes4 internal constant BURN_FUNC_SIG = 0xf11f299e;

    bytes32 internal constant BURN_EVENT_SIG = 0xcc16f5dbb4873280815c1ee09dbd06736cffcc184412cf7a71a0fdb75d397ca5;
    bytes32 internal constant WITHDRAW_EVENT_SIG = 0xebff2602b3f468259e1e99f613fed6691f3a6526effe6ef3e768ba7ae7a36c4f;

    event ExitFinalized(uint256 indexed exitId, address indexed exitor);

    enum ExitStatus {
        Invalid,
        Initialized,
        InFlightExecuted,
        InProgress,
        Finalized
    }

    struct ExitData {
        uint256 exitPriority;
        uint256 startExitTime;
        int256 lastGoodNonce;
        bytes32 inFlightTxHash;
        ExitStatus status;
        IMarket market;
    }

    struct TradeData {
        uint256 requestedFillAmount;
        bytes32 fingerprint;
        bytes32 tradeGroupId;
        uint256 maxProtocolFeeDai;
        uint256 maxTrades;
        IExchange.Order[] orders;
        bytes[] signatures;
        address taker;
    }

    PredicateRegistry public predicateRegistry;
    IWithdrawManager public withdrawManager;
    IErc20Predicate public erc20Predicate;
    ShareTokenPredicate public shareTokenPredicate;

    IAugur public augur;
    ParaShareToken public augurShareToken;
    IExitZeroXTrade public zeroXTrade;
    Cash public augurCash;
    IParaOICash public oiCash;
    IRegistry public registry;
    IDepositManager public depositManager;
    IFeePot public rootFeePot;
    IExitCash exitCash;
    IExitShareToken exitShareToken;

    mapping(uint256 => ExitData) public lookupExit;

    address public codeExtension;

    function getExitId(address exitor) public pure returns (uint256 exitId) {
        exitId = uint256(keccak256(abi.encodePacked(exitor)));
    }

    function getExit(uint256 exitId) internal view returns(ExitData storage) {
      return lookupExit[exitId];
    }

    function setIsExecuting(bool isExecuting) internal {
        exitCash.setIsExecuting(isExecuting);
        exitShareToken.setIsExecuting(isExecuting);
    }
}
