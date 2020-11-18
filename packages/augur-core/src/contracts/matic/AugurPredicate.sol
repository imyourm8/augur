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

contract AugurPredicate is AugurPredicateBase, Initializable, IAugurPredicate {
    using RLPReader for bytes;
    using RLPReader for RLPReader.RLPItem;
    using SafeMathUint256 for uint256;

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

    // function startInFlightTradeExit(
    //     bytes calldata counterPartyShares,
    //     bytes calldata counterPartyCash,
    //     bytes calldata tradeData
    // ) external {
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

    function executeInFlightTransaction(bytes memory data) public payable {
        uint256 exitId = getExitId(msg.sender);
        ExitData storage exit = getExit(exitId);
        // require(
        //     exit.status == ExitStatus.Initialized,
        //     '14' // "executeInFlightTransaction: Exit should be in Initialized state"
        // );
        exit.status = ExitStatus.InFlightExecuted; // this ensures only 1 in-flight tx can be replayed on-chain

        RLPReader.RLPItem[] memory targetTx = ProofReader.convertToTx(data);
        require(targetTx.length == 9, '13'); // "incorrect transaction data"

        address to = ProofReader.getTxTo(targetTx);
        address signer;
        (signer, exit.inFlightTxHash) = erc20Predicate
            .getAddressFromTx(data);

        setIsExecuting(true);

        PredicateRegistry.ContractType _type = predicateRegistry
            .getContractType(to);

        if (_type == PredicateRegistry.ContractType.ShareToken) {
            require(signer == msg.sender, '12'); // "executeInFlightTransaction: signer != msg.sender"
            exit.lastGoodNonce =
                int256(ProofReader.getTxNonce(targetTx)) -
                1;
            shareTokenPredicate.executeInFlightTransaction(
                data,
                signer,
                exitShareToken
            );
        } else if (_type == PredicateRegistry.ContractType.Cash) {
            require(signer == msg.sender, '12'); // "executeInFlightTransaction: signer != msg.sender"
            exit.lastGoodNonce =
                int256(ProofReader.getTxNonce(targetTx)) -
                1;
            executeCashInFlight(data, exitId);
        } else if (_type == PredicateRegistry.ContractType.ZeroXTrade) {
            this.executeTrade.value(msg.value)(data, exitId, signer);
        }

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

        setIsExecuting(true);

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

        setIsExecuting(false);
    }

    function executeCashInFlight(bytes memory data, uint256 exitId) public {
        RLPReader.RLPItem[] memory txList = data.toRlpItem().toList();

        getExit(exitId).lastGoodNonce =
            int256(ProofReader.getTxNonce(txList)) -
            1;

        bytes memory txData = ProofReader.getTxData(txList);
        bytes4 funcSig = ProofReader.getFunctionSignature(txData);

        setIsExecuting(true);

        if (funcSig == TRANSFER_FUNC_SIG) {
            exitCash.transferFrom(
                msg.sender, // from
                BytesLib.toAddress(txData, 4), // to
                BytesLib.toUint(txData, 36) // amount
            );
        } else if (funcSig != BURN_FUNC_SIG) {
            // if burning happened no need to do anything
            revert('10'); // "not supported"
        }

        setIsExecuting(false);
    }

    struct ExitPayouts {
        uint256 oiCashPayout;
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

        if (isRegularExit) {
            exitId = regularExitId;
            payout.oiCashPayout = exitIdOrAmount;
        } else {
            // exit id for MoreVP exits is token amount
            exitId = exitIdOrAmount;

            IMarket market = IMarket(getExit(exitId).market);
            if (market.isFinalized()) {
                withdrawOICash(calculateProceeds(market, exitId));

                uint256 _cashBalanceBefore = augurCash.balanceOf(
                    address(this)
                );

                augurShareToken.claimTradingProceeds(
                    market,
                    address(this),
                    bytes32(0)
                );

                payout.cashPayout = payout.cashPayout.add(
                    augurCash.balanceOf(address(this)).sub(
                        _cashBalanceBefore
                    )
                );
            } else {
                processExitForMarket(market, exitor, exitId);
            }

            payout.oiCashPayout = payout.oiCashPayout.add(exitCash.balanceOf(exitor));
            getExit(exitId).status = ExitStatus.Finalized;
        }

        if (payout.oiCashPayout > 0) {
            payout.cashPayout = payout.cashPayout.add(withdrawOICash(payout.oiCashPayout));
        }
        
        if (payout.cashPayout > 0) {
            require(
                augurCash.transfer(exitor, payout.cashPayout),
                '6' //"cash transfer failed"
            );
        }

        emit ExitFinalized(exitId, exitor);
    }

    function withdrawOICash(uint256 amount) private returns (uint256) {
        (bool oiCashWithdrawSuccess, uint256 payout) = oiCash.withdraw(amount);
        require(oiCashWithdrawSuccess, '7'); // "oiCash withdraw has failed"

        return payout;
    }

    function calculateProceeds(
        IMarket market,
        uint256 exitId
    ) private returns(uint256) {
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

    function processExitForMarket(
        IMarket market,
        address exitor,
        uint256 exitId
    ) internal {
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
