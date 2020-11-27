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
import 'ROOT/libraries/math/SafeMathInt256.sol';

contract AugurPredicate is AugurPredicateBase, Initializable, IAugurPredicate {
    using RLPReader for bytes;
    using RLPReader for RLPReader.RLPItem;
    using SafeMathUint256 for uint256;
    using SafeMathInt256 for int256;

    uint256 internal constant CASH_FACTOR_PRECISION = 10**25;

    function initialize(
        IAugur _augur,
        IAugurTrading _augurTrading,
        IExitZeroXTrade _zeroXTrade,
        address _codeExtension
    ) public beforeInitialized {
        endInitialization();
        augur = _augur;
        zeroXTrade = _zeroXTrade;
        codeExtension = _codeExtension;
    }

    function initializeForMatic(
        PredicateRegistry _predicateRegistry,
        IWithdrawManager _withdrawManager,
        IErc20Predicate _erc20Predicate,
        IParaOICash _oICash,
        Cash _cash,
        IParaAugur _mainAugur,
        ShareTokenPredicate _shareTokenPredicate,
        IRegistry _registry,
        IExitCash _exitCash,
        IExitShareToken _exitShareToken,
        IDepositManager _depositManager,
        IFeePot _rootFeePot
    ) public {
        require(address(_oICash) != address(0x0));
        require(address(_rootFeePot) != address(0x0));
        require(address(_erc20Predicate) != address(0x0));
        require(address(_withdrawManager) != address(0x0));
        require(address(_predicateRegistry) != address(0x0));
        require(address(_registry) != address(0x0));
        require(address(_exitShareToken) != address(0x0));
        require(address(_exitCash) != address(0x0));
        require(address(_depositManager) != address(0x0));

        depositManager = _depositManager;
        registry = _registry;
        predicateRegistry = _predicateRegistry;
        withdrawManager = _withdrawManager;
        erc20Predicate = _erc20Predicate;
        oiCash = _oICash;
        rootFeePot = _rootFeePot;

        augurCash = _cash;
        shareTokenPredicate = _shareTokenPredicate;
        augurShareToken = ParaShareToken(_mainAugur.lookup('ShareToken'));
        // The allowance may eventually run out, @todo provide a mechanism to refresh this allowance
        require(
            augurCash.approve(address(_mainAugur), MAX_APPROVAL_AMOUNT),
            '21' // "Cash approval to Augur failed"
        );

        exitShareToken = _exitShareToken;
        exitCash = _exitCash;
    }

    function getCodeExtension() external view returns (address) {
        return codeExtension;
    }

    function() external payable {
        bytes memory data = msg.data;
        address _codeExtension = codeExtension;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            let result := delegatecall(
                sub(gas, 10000),
                _codeExtension,
                add(data, 0x20),
                mload(data),
                0,
                0
            )
            let size := returndatasize

            let ptr := mload(0x40)
            returndatacopy(ptr, 0, size)

            // revert instead of invalid() bc if the underlying call failed with invalid() it already wasted gas.
            // if the call returned error data, forward it
            switch result
                case 0 {
                    revert(ptr, size)
                }
                default {
                    return(ptr, size)
                }
        }
    }

    function trustedTransfer(address recipient, uint256 amount) external {
        uint256 payout = withdrawOICash(amount);
        // TODO, only fee predicate
        require(augurCash.transfer(recipient, payout));
    }

    function depositToFeePot(uint256 amount) external {
        uint256 payout = withdrawOICash(amount);
        augurCash.approve(address(rootFeePot), payout);
        require(rootFeePot.depositFees(payout));
    }

    function startInFlightTradeExit(
        bytes calldata counterpartyShares,
        bytes calldata counterpartyCash,
        bytes calldata inFlightTx,
        address counterparty
    ) external payable {
        require(counterparty != msg.sender);

        uint256 exitId = getExitId(msg.sender);
        ExitData storage exit = getExit(exitId);

        require(exit.counterparty == address(0));
        exit.counterparty = counterparty;

        setIsExecuting(true);

        claimSharesAndCash(counterpartyShares, counterpartyCash, counterparty);

        address signer;

        (signer, exit.inFlightTxHash) = erc20Predicate.getAddressFromTx(
            inFlightTx
        );

        require(signer == msg.sender, "not signer"); // only signer allowed to exit with his trade

        this.executeTrade.value(msg.value)(inFlightTx, exitId, signer);

        startExit();

        setIsExecuting(false);
    }

    function startInFlightSharesAndCashExit(
        bytes calldata shares,
        bytes calldata sharesInFlightTx,
        bytes calldata cash,
        bytes calldata cashInFlightTx
    ) external {
        setIsExecuting(true);
        claimSharesAndCash(shares, cash, msg.sender);

        if (sharesInFlightTx.length > 0) {
            executeSharesInFlight(sharesInFlightTx);
        }

        if (cashInFlightTx.length > 0) {
            executeCashInFlight(cashInFlightTx);
        }

        startExit();
        setIsExecuting(false);
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
            getExit(exitId).lastGoodNonce =
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
            trade.fingerprint,
            trade.tradeGroupId,
            trade.maxProtocolFeeDai,
            trade.maxTrades,
            trade.orders,
            trade.signatures
        ) = abi.decode(
            BytesLib.slice(vars.txData, 4, vars.txData.length - 4),
            (
                uint256,
                bytes32,
                bytes32,
                uint256,
                uint256,
                IExchange.Order[],
                bytes[]
            )
        );

        zeroXTrade.trade.value(msg.value)(
            trade.requestedFillAmount,
            trade.fingerprint,
            trade.tradeGroupId,
            trade.maxProtocolFeeDai,
            trade.maxTrades,
            trade.orders,
            trade.signatures,
            trade.taker
        );
    }

    function executeSharesInFlight(bytes memory inFlightTx) private {
        RLPReader.RLPItem[] memory txList = ProofReader.convertToTx(inFlightTx);

        uint256 exitId = getExitId(msg.sender);
        ExitData storage exit = getExit(exitId);

        address signer;
        (signer, exit.inFlightTxHash) = erc20Predicate.getAddressFromTx(inFlightTx);
        require(signer == msg.sender, '12');

        exit.lastGoodNonce = exit.lastGoodNonce.max(
            int256(ProofReader.getTxNonce(txList)) - 1
        );

        shareTokenPredicate.executeInFlightTransaction(
            inFlightTx,
            signer,
            exitShareToken
        );
    }

    function executeCashInFlight(bytes memory inFlightTx) private {
        RLPReader.RLPItem[] memory txList = ProofReader.convertToTx(inFlightTx);

        uint256 exitId = getExitId(msg.sender);
        ExitData storage exit = getExit(exitId);

        address signer;
        (signer, exit.inFlightTxHash) = erc20Predicate.getAddressFromTx(inFlightTx);
        require(signer == msg.sender, '12');

        exit.lastGoodNonce = exit.lastGoodNonce.max(
            int256(ProofReader.getTxNonce(txList)) - 1
        );

        bytes memory txData = ProofReader.getTxData(txList);
        bytes4 funcSig = ProofReader.getFunctionSignature(txData);

        if (funcSig == TRANSFER_FUNC_SIG) {
            address counterparty = BytesLib.toAddress(txData, 4);
            exitCash.transferFrom(
                msg.sender, // from
                BytesLib.toAddress(txData, 4), // to
                BytesLib.toUint(txData, 36) // amount
            );
            exit.counterparty = counterparty;
        } else if (funcSig != BURN_FUNC_SIG) {
            // if burning happened no need to do anything
            revert('10'); // "not supported"
        }
    }

    struct Payout {
        address addr;
        uint256 cash;
    }

    struct ExitPayouts {
        Payout counterparty;
        Payout exitor;
        uint256 cashPayout;
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
        ExitPayouts memory payout;

        payout.exitor.addr = exitor;

        if (isRegularExit) {
            exitId = regularExitId;
            payout.exitor.cash = exitIdOrAmount;
        } else {
            // exit id for MoreVP exits is token amount
            exitId = exitIdOrAmount;

            ExitData storage exit = getExit(exitId);

            payout.counterparty.addr = exit.counterparty;

            IMarket market = IMarket(exit.market);
            
            if (market != IMarket(0)) {
                if (market.isFinalized()) {
                    withdrawOICash(calculateProceeds(market, exitId));

                    uint256 _cashBalanceBefore = augurCash.balanceOf(address(this));

                    augurShareToken.claimTradingProceeds(
                        market,
                        address(this),
                        bytes32(0)
                    );

                    payout.cashPayout = augurCash.balanceOf(address(this)).sub(
                        _cashBalanceBefore
                    );
                } else {
                    processExitForMarket(market, exitor);

                    if (payout.counterparty.addr != address(0)) {
                        processExitForMarket(market, payout.counterparty.addr);
                    }
                }
            }

            payout.exitor.cash = exitCash.balanceOf(exitor);

            if (payout.counterparty.addr != address(0)) {
                payout.counterparty.cash = exitCash.balanceOf(
                    payout.counterparty.addr
                );
            }
        }

        uint256 cashOrFactor = payout.exitor.cash.add(payout.counterparty.cash);

        if (cashOrFactor > 0) {
            cashOrFactor = withdrawOICash(cashOrFactor)
                .mul(CASH_FACTOR_PRECISION)
                .div(cashOrFactor);

            processPayout(payout.exitor, cashOrFactor);
            processPayout(payout.counterparty, cashOrFactor);
        }

        emit ExitFinalized(1, address(0));
    }

    function processPayout(Payout memory payout, uint256 cashFactor) private {
        if (payout.cash > 0 && payout.addr != address(0)) {
            require(
                augurCash.transfer(
                    payout.addr,
                    payout.cash.mul(cashFactor).div(CASH_FACTOR_PRECISION)
                ),
                '6' //"cash transfer failed"
            );
        }
    }

    function withdrawOICash(uint256 amount) private returns (uint256) {
        (bool oiCashWithdrawSuccess, uint256 payout) = oiCash.withdraw(amount);
        require(oiCashWithdrawSuccess, '7'); // "oiCash withdraw has failed"

        return payout;
    }

    function calculateProceeds(IMarket market, uint256 exitId)
        private
        returns (uint256)
    {
        uint256 numOutcomes = market.getNumberOfOutcomes();
        uint256 payout;
        for (uint256 outcome = 0; outcome < numOutcomes; outcome++) {
            uint256 sharesOwned = exitShareToken.balanceOfMarketOutcome(
                market,
                outcome,
                address(this)
            );
            payout = payout.add(
                augurShareToken.calculateProceeds(market, outcome, sharesOwned)
            );
        }

        return payout;
    }

    function processExitForMarket(IMarket market, address exitor) internal {
        uint256 numOutcomes = market.getNumberOfOutcomes();
        uint256 completeSetsToBuy;
        uint256[] memory outcomes = new uint256[](numOutcomes);
        uint256[] memory sharesPerOutcome = new uint256[](numOutcomes);
        // try to give as many shares from escrow as possible
        for (uint256 outcome = 0; outcome < numOutcomes; outcome++) {
            uint256 sharesToGive = exitShareToken.balanceOfMarketOutcome(
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
            getExit(exitId).exitPriority < age,
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
            getExit(exitId).inFlightTxHash != txHash,
            '3' // "can't challenge with the exit tx itself"
        );

        bytes memory txData = ProofReader.getTxData(challengeTx);
        address to = ProofReader.getTxTo(challengeTx);

        if (signer == exitor) {
            if (
                int256(ProofReader.getTxNonce(challengeTx)) <=
                getExit(exitId).lastGoodNonce
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
            getExit(exitId).startExitTime <= order.expirationTimeSeconds,
            '22' // expired order
        );

        IExchange exchange = zeroXTrade.getExchange();
        IExchange.OrderInfo memory orderInfo = exchange.getOrderInfo(order);

        require(
            exchange.isValidSignature(
                order,
                orderInfo.orderHash,
                _signatures[orderIndex]
            ),
            '23' // invalid signature
        );

        return true;
    }
}
