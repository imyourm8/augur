pragma solidity 0.5.15;
pragma experimental ABIEncoderV2;

import {PredicateRegistry} from 'ROOT/matic/PredicateRegistry.sol';
import {BytesLib} from 'ROOT/matic/libraries/BytesLib.sol';
import {RLPEncode} from 'ROOT/matic/libraries/RLPEncode.sol';
import {RLPReader} from 'ROOT/matic/libraries/RLPReader.sol';
import {ProofReader} from 'ROOT/matic/libraries/ProofReader.sol';
import {IWithdrawManager} from 'ROOT/matic/plasma/IWithdrawManager.sol';
import {IErc20Predicate} from 'ROOT/matic/plasma/IErc20Predicate.sol';
import {ShareTokenPredicate} from 'ROOT/matic/ShareTokenPredicate.sol';
import {IRegistry} from 'ROOT/matic/plasma/IRegistry.sol';
import {IDepositManager} from 'ROOT/matic/plasma/IDepositManager.sol';
import {ExitCashFactory} from 'ROOT/matic/ExitCashFactory.sol';
import {ExitShareTokenFactory} from 'ROOT/matic/ExitShareTokenFactory.sol';

import {IShareToken} from 'ROOT/reporting/IShareToken.sol';
import {OICash} from 'ROOT/reporting/OICash.sol';
import {IMarket} from 'ROOT/reporting/IMarket.sol';
import {IExchange} from 'ROOT/external/IExchange.sol';
import {IZeroXTrade} from 'ROOT/trading/IZeroXTrade.sol';
import {IAugurTrading} from 'ROOT/trading/IAugurTrading.sol';
import {IAugur} from 'ROOT/IAugur.sol';
import {Cash} from 'ROOT/Cash.sol';
import {ZeroXExchange} from 'ROOT/ZeroXExchange.sol';
import {Initializable} from 'ROOT/libraries/Initializable.sol';
import {SafeMathUint256} from 'ROOT/libraries/math/SafeMathUint256.sol';

contract AugurPredicate is Initializable {
    using RLPReader for bytes;
    using RLPReader for RLPReader.RLPItem;
    using SafeMathUint256 for uint256;

    event ExitFinalized(uint256 indexed exitId, address indexed exitor);

    PredicateRegistry public predicateRegistry;
    IWithdrawManager public withdrawManager;
    IErc20Predicate public erc20Predicate;
    ShareTokenPredicate public shareTokenPredicate;

    IAugur public augur;
    IShareToken public augurShareToken;
    IZeroXTrade public zeroXTrade;
    Cash public augurCash;
    OICash public oiCash;
    IRegistry public registry;
    ExitShareTokenFactory public exitShareTokenFactory;
    ExitCashFactory public exitCashFactory;
    IDepositManager public depositManager;

    mapping(address => bool) claimedTradingProceeds;
    uint256 private constant MAX_APPROVAL_AMOUNT = 2**256 - 1;

    bytes4 constant TRANSFER_FUNC_SIG = 0xa9059cbb;
    bytes4 constant ZEROX_TRADE_FUNC_SIG = 0x089042f7;
    bytes4 constant BURN_FUNC_SIG = 0xf11f299e;

    bytes32 constant BURN_EVENT_SIG = 0xcc16f5dbb4873280815c1ee09dbd06736cffcc184412cf7a71a0fdb75d397ca5;
    bytes32 constant WITHDRAW_EVENT_SIG = 0xebff2602b3f468259e1e99f613fed6691f3a6526effe6ef3e768ba7ae7a36c4f;

    enum ExitStatus {
        Invalid,
        Initialized,
        InFlightExecuted,
        InProgress,
        Finalized
    }

    struct ExitData {
        IShareToken exitShareToken;
        Cash exitCash;
        uint256 exitPriority;
        uint256 startExitTime;
        int256 lastGoodNonce;
        bytes32 inFlightTxHash;
        ExitStatus status;
        IMarket[] marketsList;
        mapping(address => bool) markets;
    }

    struct TradeData {
        uint256 requestedFillAmount;
        address affiliateAddress;
        bytes32 tradeGroupId;
        IExchange.Order[] orders;
        bytes[] signatures;
        address taker;
    }

    mapping(uint256 => ExitData) public lookupExit;

    function initialize(IAugur _augur, IAugurTrading _augurTrading)
        public
        beforeInitialized
    {
        endInitialization();
        augur = _augur;
        zeroXTrade = IZeroXTrade(_augurTrading.lookup('ZeroXTrade'));
    }

    function initializeForMatic(
        PredicateRegistry _predicateRegistry,
        IWithdrawManager _withdrawManager,
        IErc20Predicate _erc20Predicate,
        OICash _oICash,
        IAugur _mainAugur,
        ShareTokenPredicate _shareTokenPredicate,
        IRegistry _registry,
        ExitShareTokenFactory _exitShareTokenFactory,
        ExitCashFactory _exitCashFactory,
        IDepositManager _depositManager
    ) public {
        depositManager = _depositManager;
        exitCashFactory = _exitCashFactory;
        exitShareTokenFactory = _exitShareTokenFactory;
        registry = _registry;
        predicateRegistry = _predicateRegistry;
        withdrawManager = _withdrawManager;
        erc20Predicate = _erc20Predicate;
        oiCash = _oICash;

        augurCash = Cash(_mainAugur.lookup('Cash'));
        shareTokenPredicate = _shareTokenPredicate;
        augurShareToken = IShareToken(_mainAugur.lookup('ShareToken'));
        // The allowance may eventually run out, @todo provide a mechanism to refresh this allowance
        require(
            augurCash.approve(address(_mainAugur), MAX_APPROVAL_AMOUNT),
            '21' // "Cash approval to Augur failed"
        );
    }

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

        depositManager.depositBulk(tokens, amounts, address(this));
    }

    /**
     * @notice Call initializeForExit to instantiate new shareToken and Cash contracts to replay history from Matic
     * @dev new ShareToken() / new Cash() causes the bytecode of this contract to be too large, working around that limitation for now,
        however, the intention is to deploy a new ShareToken and Cash contract per exit - todo: use proxies for that
     */
    function initializeForExit() external returns (uint256 exitId) {
        exitId = getExitId(msg.sender);
        require(
            lookupExit[exitId].status == ExitStatus.Invalid,
            '18' // "Predicate.initializeForExit: Exit is already initialized"
        );

        address exitCashAddr = exitCashFactory.deploy();
        address exitShareTokenAddr = exitShareTokenFactory.deploy();

        Cash exitCash = Cash(exitCashAddr);
        IShareToken exitShareToken = IShareToken(exitShareTokenAddr);

        exitShareToken.initializeFromPredicate(augur, exitCashAddr);
        exitCash.initializeFromPredicate(augur);

        lookupExit[exitId] = ExitData({
            exitShareToken: exitShareToken,
            exitCash: exitCash,
            exitPriority: 0,
            startExitTime: 0,
            lastGoodNonce: -1,
            inFlightTxHash: bytes32(0),
            status: ExitStatus.Initialized,
            marketsList: new IMarket[](0)
        });
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
    function claimShareBalance(bytes calldata data) external {
        uint256 exitId = getExitId(msg.sender);
        require(
            lookupExit[exitId].status == ExitStatus.Initialized,
            '16' // "Predicate.claimShareBalance: Please call initializeForExit first"
        );
        (
            address account,
            address market,
            uint256 outcome,
            uint256 balance,
            uint256 age
        ) = shareTokenPredicate.parseData(data);
        address rootMarket = _checkAndAddMaticMarket(exitId, market);

        setIsExecuting(exitId, true);
        lookupExit[exitId].exitPriority = lookupExit[exitId].exitPriority.max(
            age
        );
        lookupExit[exitId].exitShareToken.mint(
            account,
            rootMarket,
            outcome,
            balance
        );
        setIsExecuting(exitId, false);
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
    function claimCashBalance(bytes calldata data, address participant)
        external
    {
        uint256 exitId = getExitId(msg.sender);
        require(
            lookupExit[exitId].status == ExitStatus.Initialized,
            '16' // "Predicate.claimCashBalance: Please call initializeForExit first"
        );
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

        lookupExit[exitId].exitPriority = lookupExit[exitId].exitPriority.max(
            age
        );
        setIsExecuting(exitId, true);
        lookupExit[exitId].exitCash.joinMint(participant, closingBalance);
        setIsExecuting(exitId, false);
    }

    function _checkAndAddMaticMarket(uint256 exitId, address market)
        internal
        returns (address)
    {
        // ask the actual mainnet augur ShareToken for the market details
        (
            address _rootMarket,
            uint256 _numOutcomes,
            uint256 _numTicks
        ) = predicateRegistry.childToRootMarket(market);

        require(
            _rootMarket != address(0x0),
            '15' // "AugurPredicate:_addMarketToExit: Market does not exist"
        );

        if (!lookupExit[exitId].markets[_rootMarket]) {
            lookupExit[exitId].markets[_rootMarket] = true;
            lookupExit[exitId].marketsList.push(IMarket(_rootMarket));
            lookupExit[exitId].exitShareToken.initializeMarket(
                IMarket(_rootMarket),
                _numOutcomes,
                _numTicks
            );
        }
        return _rootMarket;
    }

    function claimLastGoodNonce(bytes calldata lastCheckpointedTx) external {
        uint256 age = withdrawManager.verifyInclusion(
            lastCheckpointedTx,
            0, /* offset */
            true /* verifyTxInclusion */
        );
        uint256 exitId = getExitId(msg.sender);

        lookupExit[exitId].exitPriority = lookupExit[exitId].exitPriority.max(
            age
        );

        lookupExit[exitId].lastGoodNonce = int256(
            ProofReader.getTxNonce(
                ProofReader.convertToExitPayload(lastCheckpointedTx)
            )
        );
    }

    function executeInFlightTransaction(bytes memory data) public payable {
        uint256 exitId = getExitId(msg.sender);
        require(
            lookupExit[exitId].status == ExitStatus.Initialized,
            '14' // "executeInFlightTransaction: Exit should be in Initialized state"
        );
        lookupExit[exitId].status = ExitStatus.InFlightExecuted; // this ensures only 1 in-flight tx can be replayed on-chain

        RLPReader.RLPItem[] memory targetTx = ProofReader.convertToTx(data);
        require(targetTx.length == 9, '13'); // "incorrect transaction data"

        address to = ProofReader.getTxTo(targetTx);
        address signer;
        (signer, lookupExit[exitId].inFlightTxHash) = erc20Predicate
            .getAddressFromTx(data);

        setIsExecuting(exitId, true);

        PredicateRegistry.ContractType _type = predicateRegistry
            .getContractType(to);

        if (_type == PredicateRegistry.ContractType.ShareToken) {
            require(signer == msg.sender, '12'); // "executeInFlightTransaction: signer != msg.sender"
            lookupExit[exitId].lastGoodNonce =
                int256(ProofReader.getTxNonce(targetTx)) -
                1;
            shareTokenPredicate.executeInFlightTransaction(
                data,
                signer,
                lookupExit[exitId].exitShareToken
            );
        } else if (_type == PredicateRegistry.ContractType.Cash) {
            require(signer == msg.sender, '12'); // "executeInFlightTransaction: signer != msg.sender"
            lookupExit[exitId].lastGoodNonce =
                int256(ProofReader.getTxNonce(targetTx)) -
                1;
            executeCashInFlight(data, exitId);
        } else if (_type == PredicateRegistry.ContractType.ZeroXTrade) {
            this.executeTrade.value(msg.value)(data, exitId, signer);
        }

        setIsExecuting(exitId, false);
    }

    struct ExecuteTradeVars {
        RLPReader.RLPItem[] txList;
        bytes txData;
    }

    function executeTrade(
        bytes memory data,
        uint256 exitId,
        address signer
    ) public payable {
        ExecuteTradeVars memory vars;

        vars.txList = ProofReader.convertToTx(data);

        TradeData memory trade;
        trade.taker = signer; // signer of the tx is the taker; akin to taker being msg.sender in the main contract

        if (trade.taker == msg.sender) {
            lookupExit[exitId].lastGoodNonce =
                int256(ProofReader.getTxNonce(vars.txList)) -
                1;
        }

        vars.txData = ProofReader.getTxData(vars.txList);
        require(
            ProofReader.getFunctionSignature(vars.txData) ==
                ZEROX_TRADE_FUNC_SIG,
            '1' // "not ZEROX_TRADE_FUNC_SIG"
        );

        (
            trade.requestedFillAmount,
            trade.affiliateAddress,
            trade.tradeGroupId,
            trade.orders,
            trade.signatures
        ) = abi.decode(
            BytesLib.slice(vars.txData, 4, vars.txData.length - 4),
            (uint256, address, bytes32, IExchange.Order[], bytes[])
        );

        setIsExecuting(exitId, true);

        zeroXTrade.trade.value(msg.value)(
            trade.requestedFillAmount,
            trade.affiliateAddress,
            trade.tradeGroupId,
            trade.orders,
            trade.signatures,
            trade.taker,
            abi.encode(
                lookupExit[exitId].exitShareToken,
                lookupExit[exitId].exitCash
            )
        );

        setIsExecuting(exitId, false);
    }

    function executeCashInFlight(bytes memory data, uint256 exitId) public {
        RLPReader.RLPItem[] memory txList = data.toRlpItem().toList();

        lookupExit[exitId].lastGoodNonce =
            int256(ProofReader.getTxNonce(txList)) -
            1;

        bytes memory txData = ProofReader.getTxData(txList);
        bytes4 funcSig = ProofReader.getFunctionSignature(txData);

        setIsExecuting(exitId, true);

        if (funcSig == TRANSFER_FUNC_SIG) {
            lookupExit[exitId].exitCash.transferFrom(
                msg.sender, // from
                BytesLib.toAddress(txData, 4), // to
                BytesLib.toUint(txData, 36) // amount
            );
        } else if (funcSig != BURN_FUNC_SIG) {
            // if burning happened no need to do anything
            revert('10'); // "not supported"
        }

        setIsExecuting(exitId, false);
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
        // Originally, in Withdraw even address of the token is an address of the corresponding
        // root token. In case of Augur it is an address of the token itself.
        // Predicate knows root Cash contract
        (uint256 exitAmount, uint256 age, , address maticCash) = abi.decode(
            _preState,
            (uint256, uint256, address, address)
        );

        RLPReader.RLPItem[] memory log = ProofReader.getLog(
            ProofReader.convertToExitPayload(data)
        );
        exitAmount = BytesLib.toUint(log[2].toBytes(), 0);

        withdrawManager.addExitToQueue(
            msg.sender,
            maticCash,
            address(augurCash),
            exitAmount,
            bytes32(0x0),
            true, /* isRegularExit */
            age << 1
        );
    }

    function startExit() external {
        address exitor = msg.sender;
        uint256 exitId = getExitId(exitor);
        require(
            lookupExit[exitId].status == ExitStatus.Initialized ||
                lookupExit[exitId].status == ExitStatus.InFlightExecuted,
            '9' // "incorrect status"
        );
        lookupExit[exitId].status = ExitStatus.InProgress;
        lookupExit[exitId].startExitTime = now;

        uint256 withdrawExitId = lookupExit[exitId].exitPriority << 1;
        address rootToken = address(oiCash);
        withdrawManager.addExitToQueue(
            exitor,
            predicateRegistry.cash(), // OICash maps to TradingCash on matic
            rootToken,
            exitId, // exitAmountOrTokenId - think of exitId like a token Id
            bytes32(0), // txHash - field not required for now
            false, // isRegularExit
            withdrawExitId
        );
        withdrawManager.addInput(withdrawExitId, 0, exitor, rootToken);
    }

    function onFinalizeExit(bytes calldata data) external {
        require(
            msg.sender == address(withdrawManager),
            '8' // "ONLY_WITHDRAW_MANAGER"
        );
        // this encoded data is compatible with rest of the matic predicates
        (
            uint256 regularExitId,
            ,
            address exitor,
            uint256 exitIdOrAmount,
            bool isRegularExit
        ) = abi.decode(data, (uint256, address, address, uint256, bool));

        uint256 exitId;
        uint256 payout;

        if (isRegularExit) {
            exitId = regularExitId;
            payout = exitIdOrAmount;
        } else {
            // exit id for MoreVP exits is token amount
            exitId = exitIdOrAmount;

            // TODO this loop may run out of gas! There is no limit on how many markets can be exited
            IMarket[] memory marketsList = lookupExit[exitId].marketsList;
            for (uint256 i = 0; i < marketsList.length; i++) {
                IMarket market = IMarket(marketsList[i]);
                if (market.isFinalized()) {
                    payout = payout.add(
                        processExitForFinalizedMarket(market, exitor, exitId)
                    );
                } else {
                    processExitForMarket(market, exitor, exitId);
                }
            }

            payout = payout.add(lookupExit[exitId].exitCash.balanceOf(exitor));
            lookupExit[exitId].status = ExitStatus.Finalized;
        }

        depositManager.transferAssets(address(oiCash), address(this), payout);

        (bool oiCashWithdrawSuccess, uint256 feesOwed) = oiCash.withdraw(
            payout
        );

        require(oiCashWithdrawSuccess, '7'); // "oiCash withdraw has failed"

        if (payout > feesOwed) {
            require(
                augurCash.transfer(exitor, payout - feesOwed),
                '6' //"cash transfer failed"
            );
        }

        emit ExitFinalized(exitId, exitor);
    }

    function processExitForFinalizedMarket(
        IMarket market,
        address exitor,
        uint256 exitId
    ) internal returns (uint256) {
        claimTradingProceeds(market);

        // since trading proceeds have been called, predicate has 0 shares for all outcomes;
        // so the exitor will get the payout for the shares

        return calculateProceeds(market, exitor, exitId);
    }

    function claimTradingProceeds(IMarket market) public {
        if (!claimedTradingProceeds[address(market)]) {
            claimedTradingProceeds[address(market)] = true;
            augurShareToken.claimTradingProceedsToOICash(
                market,
                address(0) /* _affiliateAddress */
            );
        }
    }

    function calculateProceeds(
        IMarket market,
        address exitor,
        uint256 exitId
    ) public view returns (uint256) {
        uint256 numOutcomes = market.getNumberOfOutcomes();
        uint256 payout;
        IShareToken shareToken = lookupExit[exitId].exitShareToken;
        for (uint256 outcome = 0; outcome < numOutcomes; outcome++) {
            uint256 sharesOwned = shareToken.balanceOfMarketOutcome(
                market,
                outcome,
                exitor
            );
            payout = payout.add(
                augurShareToken.calculateProceeds(market, outcome, sharesOwned)
            );
        }
        return payout;
    }

    function processExitForMarket(
        IMarket market,
        address exitor,
        uint256 exitId
    ) internal {
        IShareToken shareToken = lookupExit[exitId].exitShareToken;
        uint256 numOutcomes = market.getNumberOfOutcomes();
        uint256 completeSetsToBuy;
        uint256[] memory outcomes = new uint256[](numOutcomes);
        uint256[] memory sharesPerOutcome = new uint256[](numOutcomes);
        // try to give as many shares from escrow as possible
        for (uint256 outcome = 0; outcome < numOutcomes; outcome++) {
            uint256 sharesToGive = shareToken.balanceOfMarketOutcome(
                market,
                outcome,
                exitor
            );
            uint256 sharesInEscrow = augurShareToken.balanceOfMarketOutcome(
                market,
                outcome,
                address(this)
            );

            if (sharesInEscrow < sharesToGive) {
                completeSetsToBuy = completeSetsToBuy.max(
                    sharesToGive - sharesInEscrow
                );
            }

            outcomes[outcome] = outcome;
            sharesPerOutcome[outcome] = sharesToGive;
        }

        if (completeSetsToBuy > 0) {
            require(
                oiCash.buyCompleteSets(market, completeSetsToBuy),
                '5' // "buying complete sets failed"
            );
        }

        uint256[] memory tokenIds = augurShareToken.getTokenIds(
            market,
            outcomes
        );
        augurShareToken.unsafeBatchTransferFrom(
            address(this),
            exitor,
            tokenIds,
            sharesPerOutcome
        );
    }

    function getExitId(address exitor) public pure returns (uint256 exitId) {
        exitId = uint256(keccak256(abi.encodePacked(exitor)));
    }

    function setIsExecuting(uint256 exitId, bool isExecuting) internal {
        lookupExit[exitId].exitCash.setIsExecuting(isExecuting);
        lookupExit[exitId].exitShareToken.setIsExecuting(isExecuting);
    }

    function verifyDeprecation(
        bytes calldata exit,
        bytes calldata, /* inputUtxo */
        bytes calldata challengeData
    ) external view returns (bool) {
        uint256 age = withdrawManager.verifyInclusion(
            challengeData,
            0, /* offset */
            true /* verifyTxInclusion */
        );
        // this encoded data is compatible with rest of the matic predicates
        (address exitor, , uint256 exitId, , ) = abi.decode(
            exit,
            (address, address, uint256, bytes32, bool)
        );
        require(
            lookupExit[exitId].exitPriority < age,
            '11' // "provide more recent tx"
        );

        RLPReader.RLPItem[] memory challengeList = challengeData
            .toRlpItem()
            .toList();
        RLPReader.RLPItem[] memory challengeTx = ProofReader.getChallengeTx(
            challengeList
        );

        require(challengeTx.length == 9, '4'); // "MALFORMED_WITHDRAW_TX"

        (address signer, bytes32 txHash) = erc20Predicate.getAddressFromTx(
            ProofReader.getChallengeTxBytes(challengeList)
        );

        require(
            lookupExit[exitId].inFlightTxHash != txHash,
            '3' // "can't challenge with the exit tx itself"
        );

        bytes memory txData = ProofReader.getTxData(challengeTx);
        address to = ProofReader.getTxTo(challengeTx);

        if (signer == exitor) {
            if (
                int256(ProofReader.getTxNonce(challengeTx)) <=
                lookupExit[exitId].lastGoodNonce
            ) {
                return false;
            }

            PredicateRegistry.DeprecationType _type = predicateRegistry
                .getDeprecationType(to);

            if (_type == PredicateRegistry.DeprecationType.Default) {
                return true;
            } else if (_type == PredicateRegistry.DeprecationType.ShareToken) {
                return shareTokenPredicate.isValidDeprecation(txData);
            } else if (_type == PredicateRegistry.DeprecationType.Cash) {
                bytes4 funcSig = ProofReader.getFunctionSignature(txData);

                if (funcSig == TRANSFER_FUNC_SIG || funcSig == BURN_FUNC_SIG) {
                    return true;
                }
            }
        }

        return
            isValidDeprecation(
                txData,
                to,
                ProofReader.getLogIndex(challengeList), // log index is order index
                exitor,
                exitId
            );
    }

    function isValidDeprecation(
        bytes memory txData,
        address to,
        uint256 orderIndex,
        address exitor,
        uint256 exitId
    ) internal view returns (bool) {
        require(
            to == predicateRegistry.zeroXTrade(),
            '2' // "not zeroXTrade"
        );

        require(
            ProofReader.getFunctionSignature(txData) == ZEROX_TRADE_FUNC_SIG,
            '1' // "not ZEROX_TRADE_FUNC_SIG"
        );

        (
            ,
            ,
            ,
            IExchange.Order[] memory _orders,
            bytes[] memory _signatures
        ) = abi.decode(
            BytesLib.slice(txData, 4, txData.length - 4),
            (uint256, address, bytes32, IExchange.Order[], bytes[])
        );

        IExchange.Order memory order = _orders[orderIndex];
        require(
            order.makerAddress == exitor,
            '20' // Order not signed by the exitor
        );

        require(
            lookupExit[exitId].startExitTime <= order.expirationTimeSeconds,
            '22' // expired order
        );

        IExchange _maticExchange = zeroXTrade.getExchangeFromAssetData(
            order.makerAssetData
        );
        ZeroXExchange exchange = ZeroXExchange(
            predicateRegistry.zeroXExchange(address(_maticExchange))
        );
        IExchange.OrderInfo memory orderInfo = exchange.getOrderInfo(order);

        require(
            exchange.isValidSignature(
                orderInfo.orderHash,
                order.makerAddress,
                _signatures[orderIndex]
            ),
            '23' // invalid signature
        );

        return true;
    }
}
