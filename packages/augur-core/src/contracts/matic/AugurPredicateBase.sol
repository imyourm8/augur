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
    using RLPReader for bytes;
    using RLPReader for RLPReader.RLPItem;
    using SafeMathUint256 for uint256;

    uint256 internal constant MATIC_NETWORK_ID = 15001;
    uint256 internal constant MAX_APPROVAL_AMOUNT = 2**256 - 1;

    bytes4 internal constant TRANSFER_FUNC_SIG = 0xa9059cbb;
    // trade(uint256,bytes32,bytes32,uint256,uint256,(address,address,address,address,uint256,uint256,uint256,uint256,uint256,uint256,bytes,bytes,bytes,bytes)[],bytes[])
    bytes4 internal constant ZEROX_TRADE_FUNC_SIG = 0x2f562016;
    bytes4 internal constant BURN_FUNC_SIG = 0xf11f299e;

    bytes32
        internal constant BURN_EVENT_SIG = 0xcc16f5dbb4873280815c1ee09dbd06736cffcc184412cf7a71a0fdb75d397ca5;
    bytes32
        internal constant WITHDRAW_EVENT_SIG = 0xebff2602b3f468259e1e99f613fed6691f3a6526effe6ef3e768ba7ae7a36c4f;

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

    mapping(bytes32 => bool) claimedTxs;
    mapping(uint256 => ExitData) public lookupExit;

    address public codeExtension;

    function getExitId(address exitor) public pure returns (uint256 exitId) {
        exitId = uint256(keccak256(abi.encodePacked(exitor)));
    }

    function getExit(uint256 exitId) internal view returns (ExitData storage) {
        return lookupExit[exitId];
    }

    function setIsExecuting(bool isExecuting) internal {
        exitCash.setIsExecuting(isExecuting);
        exitShareToken.setIsExecuting(isExecuting);
    }

    function getTxHash(RLPReader.RLPItem[] memory txList)
        internal
        pure
        returns (bytes32 txHash)
    {
        bytes[] memory rawTx = new bytes[](9);
        for (uint8 i = 0; i <= 5; i++) {
            rawTx[i] = txList[i].toBytes();
        }
        rawTx[6] = BytesLib.fromUint(MATIC_NETWORK_ID);
        rawTx[7] = hex''; // [7] and [8] have something to do with v, r, s values
        rawTx[8] = hex'';

        txHash = keccak256(RLPEncode.encodeList(rawTx));
    }

    /**
     * @notice Proof receipt and index of the log (ShareTokenBalanceChanged) in the receipt to claim balance from Matic
     * @param data RLP encoded data of the reference tx (proof-of-funds) that encodes the following fields
     * headerNumber Header block number of which the reference tx was a part of
     * blockProof Proof that the block header (in the child chain) is a leaf in the submitted merkle root
     * blockNumber Block number of which the reference tx is a part of
     * blockTime Reference tx block time
     * blocktxRoot Transactions root of block
     * blockReceiptsRoot Receipts root of block
     * receipt Receipt of the reference transaction
     * receiptProof Merkle proof of the reference receipt
     * branchMask Merkle proof branchMask for the receipt
     * logIndex Log Index to read from the receipt
     */
    function claimShareBalances(bytes memory data) internal returns(address) {
        (
            address[] memory accounts,
            address[] memory markets,
            uint256[] memory outcomes,
            uint256[] memory balances,
            uint256[] memory ages
        ) = shareTokenPredicate.parseData(data);

        address account = accounts[0];
        address market = markets[0];
        uint256 age = 0;

        uint256 exitId = getExitId(account);
        ExitData storage exit = getExit(exitId);

        for (uint256 i = 0; i < accounts.length; i++) {
            require(account == accounts[i]);
            require(market == markets[i]);

            account = accounts[i];
            market = markets[i];

            age = age.max(ages[i]);
            exitShareToken.mint(account, IMarket(market), outcomes[i], balances[i]);
        }

        exit.exitPriority = age;

        _addMarketToExit(exitId, market);

        return account;
    }

    /**
     * @notice Proof receipt and index of the log (Deposit, Withdraw, LogTransfer) in the receipt to claim balance from Matic
     * @param data RLP encoded data of the reference tx (proof-of-funds) that encodes the following fields
     * headerNumber Header block number of which the reference tx was a part of
     * blockProof Proof that the block header (in the child chain) is a leaf in the submitted merkle root
     * blockNumber Block number of which the reference tx is a part of
     * blockTime Reference tx block time
     * blocktxRoot Transactions root of block
     * blockReceiptsRoot Receipts root of block
     * receipt Receipt of the reference transaction
     * receiptProof Merkle proof of the reference receipt
     * branchMask Merkle proof branchMask for the receipt
     * logIndex Log Index to read from the receipt
     * @param participant Account for which the proof-of-funds is being provided
     */
    function claimCashBalance(bytes memory data, address participant)
        internal
    {
        uint256 exitId = getExitId(participant);
        ExitData storage exit = getExit(exitId);

        bytes memory _preState = erc20Predicate.interpretStateUpdate(
            abi.encode(
                data,
                participant,
                true, /* verifyInclusionInCheckpoint */
                false /* isChallenge */
            )
        );

        (uint256 closingBalance, uint256 age, , address tokenAddress) = abi
            .decode(_preState, (uint256, uint256, address, address));

        require(tokenAddress == predicateRegistry.cash(), '17'); // "not matic cash"

        exit.exitPriority = exit.exitPriority.max(age);

        exitCash.faucet(participant, closingBalance);
    }

    function _addMarketToExit(uint256 exitId, address market) internal {
        IMarket _market = IMarket(market);

        require(augur.isKnownMarket(_market), '15'); // "AugurPredicate:_addMarketToExit: Market does not exist"

        uint256 numOutcomes = _market.getNumberOfOutcomes();
        uint256 numTicks = _market.getNumTicks();

        ExitData storage exit = getExit(exitId);

        if (exit.market != IMarket(0)) {
            exit.market = _market;
            exitShareToken.initializeMarket(_market, numOutcomes, numTicks);
        }
    }
}
