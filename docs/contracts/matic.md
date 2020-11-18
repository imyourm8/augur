---
title: Matic
---

<div class="contracts">

## Contracts

### `AugurPredicate`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#AugurPredicate.initialize(contract IAugur,contract IAugurTrading,contract IExitZeroXTrade,address)"><code class="function-signature">initialize(contract IAugur _augur, contract IAugurTrading _augurTrading, contract IExitZeroXTrade _zeroXTrade, address _codeExtension)</code></a></li><li><a href="#AugurPredicate.initializeForMatic(contract PredicateRegistry,contract IWithdrawManager,contract IErc20Predicate,contract IParaOICash,contract Cash,contract IParaAugur,contract ShareTokenPredicate,contract IRegistry,contract IExitCash,contract IExitShareToken,contract IDepositManager,contract IFeePot)"><code class="function-signature">initializeForMatic(contract PredicateRegistry _predicateRegistry, contract IWithdrawManager _withdrawManager, contract IErc20Predicate _erc20Predicate, contract IParaOICash _oICash, contract Cash _cash, contract IParaAugur _mainAugur, contract ShareTokenPredicate _shareTokenPredicate, contract IRegistry _registry, contract IExitCash _exitCash, contract IExitShareToken _exitShareToken, contract IDepositManager _depositManager, contract IFeePot _rootFeePot)</code></a></li><li><a href="#AugurPredicate.fallback()"><code class="function-signature">fallback()</code></a></li><li><a href="#AugurPredicate.trustedTransfer(address,uint256)"><code class="function-signature">trustedTransfer(address recipient, uint256 amount)</code></a></li><li><a href="#AugurPredicate.depositToFeePot(uint256)"><code class="function-signature">depositToFeePot(uint256 amount)</code></a></li><li><a href="#AugurPredicate.deposit(uint256)"><code class="function-signature">deposit(uint256 amount)</code></a></li><li><a href="#AugurPredicate.executeInFlightTransaction(bytes)"><code class="function-signature">executeInFlightTransaction(bytes data)</code></a></li><li><a href="#AugurPredicate.executeTrade(bytes,uint256,address)"><code class="function-signature">executeTrade(bytes data, uint256 exitId, address signer)</code></a></li><li><a href="#AugurPredicate.executeCashInFlight(bytes,uint256)"><code class="function-signature">executeCashInFlight(bytes data, uint256 exitId)</code></a></li><li><a href="#AugurPredicate.onFinalizeExit(bytes)"><code class="function-signature">onFinalizeExit(bytes data)</code></a></li><li><a href="#AugurPredicate.processExitForMarket(contract IMarket,address,uint256)"><code class="function-signature">processExitForMarket(contract IMarket market, address exitor, uint256 exitId)</code></a></li><li><a href="#AugurPredicate.verifyDeprecation(bytes,bytes,bytes)"><code class="function-signature">verifyDeprecation(bytes exit, bytes, bytes challengeData)</code></a></li><li><a href="#AugurPredicate.isValidDeprecation(bytes,address,uint256,address,uint256)"><code class="function-signature">isValidDeprecation(bytes txData, address to, uint256 orderIndex, address exitor, uint256 exitId)</code></a></li><li class="inherited"><a href="#Initializable.endInitialization()"><code class="function-signature">endInitialization()</code></a></li><li class="inherited"><a href="#Initializable.getInitialized()"><code class="function-signature">getInitialized()</code></a></li><li class="inherited"><a href="#AugurPredicateBase.getExitId(address)"><code class="function-signature">getExitId(address exitor)</code></a></li><li class="inherited"><a href="#AugurPredicateBase.getExit(uint256)"><code class="function-signature">getExit(uint256 exitId)</code></a></li><li class="inherited"><a href="#AugurPredicateBase.setIsExecuting(uint256,bool)"><code class="function-signature">setIsExecuting(uint256 exitId, bool isExecuting)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#AugurPredicateBase.ExitFinalized(uint256,address)"><code class="function-signature">ExitFinalized(uint256 exitId, address exitor)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="AugurPredicate.initialize(contract IAugur,contract IAugurTrading,contract IExitZeroXTrade,address)"></a><code class="function-signature">initialize(contract IAugur _augur, contract IAugurTrading _augurTrading, contract IExitZeroXTrade _zeroXTrade, address _codeExtension)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicate.initializeForMatic(contract PredicateRegistry,contract IWithdrawManager,contract IErc20Predicate,contract IParaOICash,contract Cash,contract IParaAugur,contract ShareTokenPredicate,contract IRegistry,contract IExitCash,contract IExitShareToken,contract IDepositManager,contract IFeePot)"></a><code class="function-signature">initializeForMatic(contract PredicateRegistry _predicateRegistry, contract IWithdrawManager _withdrawManager, contract IErc20Predicate _erc20Predicate, contract IParaOICash _oICash, contract Cash _cash, contract IParaAugur _mainAugur, contract ShareTokenPredicate _shareTokenPredicate, contract IRegistry _registry, contract IExitCash _exitCash, contract IExitShareToken _exitShareToken, contract IDepositManager _depositManager, contract IFeePot _rootFeePot)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicate.fallback()"></a><code class="function-signature">fallback()</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicate.trustedTransfer(address,uint256)"></a><code class="function-signature">trustedTransfer(address recipient, uint256 amount)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicate.depositToFeePot(uint256)"></a><code class="function-signature">depositToFeePot(uint256 amount)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicate.deposit(uint256)"></a><code class="function-signature">deposit(uint256 amount)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicate.executeInFlightTransaction(bytes)"></a><code class="function-signature">executeInFlightTransaction(bytes data)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicate.executeTrade(bytes,uint256,address)"></a><code class="function-signature">executeTrade(bytes data, uint256 exitId, address signer)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicate.executeCashInFlight(bytes,uint256)"></a><code class="function-signature">executeCashInFlight(bytes data, uint256 exitId)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicate.onFinalizeExit(bytes)"></a><code class="function-signature">onFinalizeExit(bytes data)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicate.processExitForMarket(contract IMarket,address,uint256)"></a><code class="function-signature">processExitForMarket(contract IMarket market, address exitor, uint256 exitId)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicate.verifyDeprecation(bytes,bytes,bytes)"></a><code class="function-signature">verifyDeprecation(bytes exit, bytes, bytes challengeData) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicate.isValidDeprecation(bytes,address,uint256,address,uint256)"></a><code class="function-signature">isValidDeprecation(bytes txData, address to, uint256 orderIndex, address exitor, uint256 exitId) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>







### `AugurPredicateBase`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#AugurPredicateBase.getExitId(address)"><code class="function-signature">getExitId(address exitor)</code></a></li><li><a href="#AugurPredicateBase.getExit(uint256)"><code class="function-signature">getExit(uint256 exitId)</code></a></li><li><a href="#AugurPredicateBase.setIsExecuting(uint256,bool)"><code class="function-signature">setIsExecuting(uint256 exitId, bool isExecuting)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li><a href="#AugurPredicateBase.ExitFinalized(uint256,address)"><code class="function-signature">ExitFinalized(uint256 exitId, address exitor)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="AugurPredicateBase.getExitId(address)"></a><code class="function-signature">getExitId(address exitor) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicateBase.getExit(uint256)"></a><code class="function-signature">getExit(uint256 exitId) <span class="return-arrow">→</span> <span class="return-type">struct AugurPredicateBase.ExitData</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicateBase.setIsExecuting(uint256,bool)"></a><code class="function-signature">setIsExecuting(uint256 exitId, bool isExecuting)</code><span class="function-visibility">internal</span></h4>







<h4><a class="anchor" aria-hidden="true" id="AugurPredicateBase.ExitFinalized(uint256,address)"></a><code class="function-signature">ExitFinalized(uint256 exitId, address exitor)</code><span class="function-visibility"></span></h4>





### `AugurTrading`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#AugurTrading.constructor(contract IAugur)"><code class="function-signature">constructor(contract IAugur _augur)</code></a></li><li><a href="#AugurTrading.registerContract(bytes32,address)"><code class="function-signature">registerContract(bytes32 _key, address _address)</code></a></li><li><a href="#AugurTrading.doApprovals()"><code class="function-signature">doApprovals()</code></a></li><li><a href="#AugurTrading.lookup(bytes32)"><code class="function-signature">lookup(bytes32 _key)</code></a></li><li><a href="#AugurTrading.finishDeployment()"><code class="function-signature">finishDeployment()</code></a></li><li><a href="#AugurTrading.claimMarketsProceeds(contract IMarket[],address,bytes32)"><code class="function-signature">claimMarketsProceeds(contract IMarket[] _markets, address _shareHolder, bytes32 _fingerprint)</code></a></li><li><a href="#AugurTrading.claimTradingProceeds(contract IMarket,address,bytes32)"><code class="function-signature">claimTradingProceeds(contract IMarket _market, address _shareHolder, bytes32 _fingerprint)</code></a></li><li><a href="#AugurTrading.logProfitLossChanged(contract IMarket,address,uint256,int256,uint256,int256,int256,int256)"><code class="function-signature">logProfitLossChanged(contract IMarket _market, address _account, uint256 _outcome, int256 _netPosition, uint256 _avgPrice, int256 _realizedProfit, int256 _frozenFunds, int256 _realizedCost)</code></a></li><li><a href="#AugurTrading.logOrderCanceled(contract IUniverse,contract IMarket,address,uint256,uint256,bytes32)"><code class="function-signature">logOrderCanceled(contract IUniverse _universe, contract IMarket _market, address _creator, uint256 _tokenRefund, uint256 _sharesRefund, bytes32 _orderId)</code></a></li><li><a href="#AugurTrading.logOrderCreated(contract IUniverse,bytes32,bytes32)"><code class="function-signature">logOrderCreated(contract IUniverse _universe, bytes32 _orderId, bytes32 _tradeGroupId)</code></a></li><li><a href="#AugurTrading.logOrderFilled(contract IUniverse,address,address,uint256,uint256,uint256,bytes32,bytes32)"><code class="function-signature">logOrderFilled(contract IUniverse _universe, address _creator, address _filler, uint256 _price, uint256 _fees, uint256 _amountFilled, bytes32 _orderId, bytes32 _tradeGroupId)</code></a></li><li><a href="#AugurTrading.logMarketVolumeChanged(contract IUniverse,address,uint256,uint256[],uint256)"><code class="function-signature">logMarketVolumeChanged(contract IUniverse _universe, address _market, uint256 _volume, uint256[] _outcomeVolumes, uint256 _totalTrades)</code></a></li><li><a href="#AugurTrading.logZeroXOrderFilled(contract IUniverse,contract IMarket,bytes32,bytes32,uint8,address[],uint256[])"><code class="function-signature">logZeroXOrderFilled(contract IUniverse _universe, contract IMarket _market, bytes32 _orderHash, bytes32 _tradeGroupId, uint8 _orderType, address[] _addressData, uint256[] _uint256Data)</code></a></li><li><a href="#AugurTrading.logZeroXOrderCanceled(address,address,address,uint256,uint256,uint256,uint8,bytes32)"><code class="function-signature">logZeroXOrderCanceled(address _universe, address _market, address _account, uint256 _outcome, uint256 _price, uint256 _amount, uint8 _type, bytes32 _orderHash)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li><a href="#AugurTrading.OrderEvent(address,address,enum AugurTrading.OrderEventType,uint8,bytes32,bytes32,address[],uint256[])"><code class="function-signature">OrderEvent(address universe, address market, enum AugurTrading.OrderEventType eventType, uint8 orderType, bytes32 orderId, bytes32 tradeGroupId, address[] addressData, uint256[] uint256Data)</code></a></li><li><a href="#AugurTrading.ProfitLossChanged(address,address,address,uint256,int256,uint256,int256,int256,int256,uint256)"><code class="function-signature">ProfitLossChanged(address universe, address market, address account, uint256 outcome, int256 netPosition, uint256 avgPrice, int256 realizedProfit, int256 frozenFunds, int256 realizedCost, uint256 timestamp)</code></a></li><li><a href="#AugurTrading.MarketVolumeChanged(address,address,uint256,uint256[],uint256,uint256)"><code class="function-signature">MarketVolumeChanged(address universe, address market, uint256 volume, uint256[] outcomeVolumes, uint256 totalTrades, uint256 timestamp)</code></a></li><li><a href="#AugurTrading.CancelZeroXOrder(address,address,address,uint256,uint256,uint256,uint8,bytes32)"><code class="function-signature">CancelZeroXOrder(address universe, address market, address account, uint256 outcome, uint256 price, uint256 amount, uint8 orderType, bytes32 orderHash)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="AugurTrading.constructor(contract IAugur)"></a><code class="function-signature">constructor(contract IAugur _augur)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.registerContract(bytes32,address)"></a><code class="function-signature">registerContract(bytes32 _key, address _address) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.doApprovals()"></a><code class="function-signature">doApprovals() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.lookup(bytes32)"></a><code class="function-signature">lookup(bytes32 _key) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.finishDeployment()"></a><code class="function-signature">finishDeployment() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.claimMarketsProceeds(contract IMarket[],address,bytes32)"></a><code class="function-signature">claimMarketsProceeds(contract IMarket[] _markets, address _shareHolder, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.claimTradingProceeds(contract IMarket,address,bytes32)"></a><code class="function-signature">claimTradingProceeds(contract IMarket _market, address _shareHolder, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.logProfitLossChanged(contract IMarket,address,uint256,int256,uint256,int256,int256,int256)"></a><code class="function-signature">logProfitLossChanged(contract IMarket _market, address _account, uint256 _outcome, int256 _netPosition, uint256 _avgPrice, int256 _realizedProfit, int256 _frozenFunds, int256 _realizedCost) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.logOrderCanceled(contract IUniverse,contract IMarket,address,uint256,uint256,bytes32)"></a><code class="function-signature">logOrderCanceled(contract IUniverse _universe, contract IMarket _market, address _creator, uint256 _tokenRefund, uint256 _sharesRefund, bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.logOrderCreated(contract IUniverse,bytes32,bytes32)"></a><code class="function-signature">logOrderCreated(contract IUniverse _universe, bytes32 _orderId, bytes32 _tradeGroupId) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.logOrderFilled(contract IUniverse,address,address,uint256,uint256,uint256,bytes32,bytes32)"></a><code class="function-signature">logOrderFilled(contract IUniverse _universe, address _creator, address _filler, uint256 _price, uint256 _fees, uint256 _amountFilled, bytes32 _orderId, bytes32 _tradeGroupId) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.logMarketVolumeChanged(contract IUniverse,address,uint256,uint256[],uint256)"></a><code class="function-signature">logMarketVolumeChanged(contract IUniverse _universe, address _market, uint256 _volume, uint256[] _outcomeVolumes, uint256 _totalTrades) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.logZeroXOrderFilled(contract IUniverse,contract IMarket,bytes32,bytes32,uint8,address[],uint256[])"></a><code class="function-signature">logZeroXOrderFilled(contract IUniverse _universe, contract IMarket _market, bytes32 _orderHash, bytes32 _tradeGroupId, uint8 _orderType, address[] _addressData, uint256[] _uint256Data) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.logZeroXOrderCanceled(address,address,address,uint256,uint256,uint256,uint8,bytes32)"></a><code class="function-signature">logZeroXOrderCanceled(address _universe, address _market, address _account, uint256 _outcome, uint256 _price, uint256 _amount, uint8 _type, bytes32 _orderHash)</code><span class="function-visibility">public</span></h4>







<h4><a class="anchor" aria-hidden="true" id="AugurTrading.OrderEvent(address,address,enum AugurTrading.OrderEventType,uint8,bytes32,bytes32,address[],uint256[])"></a><code class="function-signature">OrderEvent(address universe, address market, enum AugurTrading.OrderEventType eventType, uint8 orderType, bytes32 orderId, bytes32 tradeGroupId, address[] addressData, uint256[] uint256Data)</code><span class="function-visibility"></span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.ProfitLossChanged(address,address,address,uint256,int256,uint256,int256,int256,int256,uint256)"></a><code class="function-signature">ProfitLossChanged(address universe, address market, address account, uint256 outcome, int256 netPosition, uint256 avgPrice, int256 realizedProfit, int256 frozenFunds, int256 realizedCost, uint256 timestamp)</code><span class="function-visibility"></span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.MarketVolumeChanged(address,address,uint256,uint256[],uint256,uint256)"></a><code class="function-signature">MarketVolumeChanged(address universe, address market, uint256 volume, uint256[] outcomeVolumes, uint256 totalTrades, uint256 timestamp)</code><span class="function-visibility"></span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurTrading.CancelZeroXOrder(address,address,address,uint256,uint256,uint256,uint8,bytes32)"></a><code class="function-signature">CancelZeroXOrder(address universe, address market, address account, uint256 outcome, uint256 price, uint256 amount, uint8 orderType, bytes32 orderHash)</code><span class="function-visibility"></span></h4>





### `BytesLib`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#BytesLib.concat(bytes,bytes)"><code class="function-signature">concat(bytes _preBytes, bytes _postBytes)</code></a></li><li><a href="#BytesLib.slice(bytes,uint256,uint256)"><code class="function-signature">slice(bytes _bytes, uint256 _start, uint256 _length)</code></a></li><li><a href="#BytesLib.leftPad(bytes)"><code class="function-signature">leftPad(bytes _bytes)</code></a></li><li><a href="#BytesLib.toBytes32(bytes)"><code class="function-signature">toBytes32(bytes b)</code></a></li><li><a href="#BytesLib.toBytes4(bytes)"><code class="function-signature">toBytes4(bytes b)</code></a></li><li><a href="#BytesLib.fromBytes32(bytes32)"><code class="function-signature">fromBytes32(bytes32 x)</code></a></li><li><a href="#BytesLib.fromUint(uint256)"><code class="function-signature">fromUint(uint256 _num)</code></a></li><li><a href="#BytesLib.toUint(bytes,uint256)"><code class="function-signature">toUint(bytes _bytes, uint256 _start)</code></a></li><li><a href="#BytesLib.toAddress(bytes,uint256)"><code class="function-signature">toAddress(bytes _bytes, uint256 _start)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="BytesLib.concat(bytes,bytes)"></a><code class="function-signature">concat(bytes _preBytes, bytes _postBytes) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="BytesLib.slice(bytes,uint256,uint256)"></a><code class="function-signature">slice(bytes _bytes, uint256 _start, uint256 _length) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="BytesLib.leftPad(bytes)"></a><code class="function-signature">leftPad(bytes _bytes) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="BytesLib.toBytes32(bytes)"></a><code class="function-signature">toBytes32(bytes b) <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="BytesLib.toBytes4(bytes)"></a><code class="function-signature">toBytes4(bytes b) <span class="return-arrow">→</span> <span class="return-type">bytes4</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="BytesLib.fromBytes32(bytes32)"></a><code class="function-signature">fromBytes32(bytes32 x) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="BytesLib.fromUint(uint256)"></a><code class="function-signature">fromUint(uint256 _num) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="BytesLib.toUint(bytes,uint256)"></a><code class="function-signature">toUint(bytes _bytes, uint256 _start) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="BytesLib.toAddress(bytes,uint256)"></a><code class="function-signature">toAddress(bytes _bytes, uint256 _start) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">internal</span></h4>







### `Cash`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#Cash.faucet(uint256)"><code class="function-signature">faucet(uint256 _amount)</code></a></li><li><a href="#Cash.setDecimals(uint8)"><code class="function-signature">setDecimals(uint8 _decimals)</code></a></li><li><a href="#Cash.getTypeName()"><code class="function-signature">getTypeName()</code></a></li><li><a href="#Cash.onTokenTransfer(address,address,uint256)"><code class="function-signature">onTokenTransfer(address _from, address _to, uint256 _value)</code></a></li><li class="inherited"><a href="#VariableSupplyToken.mint(address,uint256)"><code class="function-signature">mint(address _target, uint256 _amount)</code></a></li><li class="inherited"><a href="#VariableSupplyToken.burn(address,uint256)"><code class="function-signature">burn(address _target, uint256 _amount)</code></a></li><li class="inherited"><a href="#VariableSupplyToken.onMint(address,uint256)"><code class="function-signature">onMint(address, uint256)</code></a></li><li class="inherited"><a href="#VariableSupplyToken.onBurn(address,uint256)"><code class="function-signature">onBurn(address, uint256)</code></a></li><li class="inherited"><a href="#ERC20.balanceOf(address)"><code class="function-signature">balanceOf(address _account)</code></a></li><li class="inherited"><a href="#ERC20.transfer(address,uint256)"><code class="function-signature">transfer(address _recipient, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20.allowance(address,address)"><code class="function-signature">allowance(address _owner, address _spender)</code></a></li><li class="inherited"><a href="#ERC20.approve(address,uint256)"><code class="function-signature">approve(address _spender, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address _sender, address _recipient, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20.increaseAllowance(address,uint256)"><code class="function-signature">increaseAllowance(address _spender, uint256 _addedValue)</code></a></li><li class="inherited"><a href="#ERC20.decreaseAllowance(address,uint256)"><code class="function-signature">decreaseAllowance(address _spender, uint256 _subtractedValue)</code></a></li><li class="inherited"><a href="#ERC20._transfer(address,address,uint256)"><code class="function-signature">_transfer(address _sender, address _recipient, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20._mint(address,uint256)"><code class="function-signature">_mint(address _account, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20._burn(address,uint256)"><code class="function-signature">_burn(address _account, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20._approve(address,address,uint256)"><code class="function-signature">_approve(address _owner, address _spender, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20._burnFrom(address,uint256)"><code class="function-signature">_burnFrom(address _account, uint256 _amount)</code></a></li><li class="inherited"><a href="#IERC20.totalSupply()"><code class="function-signature">totalSupply()</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC20.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li class="inherited"><a href="#IERC20.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="Cash.faucet(uint256)"></a><code class="function-signature">faucet(uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Cash.setDecimals(uint8)"></a><code class="function-signature">setDecimals(uint8 _decimals) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Cash.getTypeName()"></a><code class="function-signature">getTypeName() <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Cash.onTokenTransfer(address,address,uint256)"></a><code class="function-signature">onTokenTransfer(address _from, address _to, uint256 _value)</code><span class="function-visibility">internal</span></h4>







### `ContractExists`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#ContractExists.exists(address)"><code class="function-signature">exists(address _address)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="ContractExists.exists(address)"></a><code class="function-signature">exists(address _address) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>







### `ERC1155`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#ERC1155.constructor()"><code class="function-signature">constructor()</code></a></li><li><a href="#ERC1155.balanceOf(address,uint256)"><code class="function-signature">balanceOf(address account, uint256 id)</code></a></li><li><a href="#ERC1155.totalSupply(uint256)"><code class="function-signature">totalSupply(uint256 id)</code></a></li><li><a href="#ERC1155.balanceOfBatch(address[],uint256[])"><code class="function-signature">balanceOfBatch(address[] accounts, uint256[] ids)</code></a></li><li><a href="#ERC1155.setApprovalForAll(address,bool)"><code class="function-signature">setApprovalForAll(address operator, bool approved)</code></a></li><li><a href="#ERC1155.isApprovedForAll(address,address)"><code class="function-signature">isApprovedForAll(address account, address operator)</code></a></li><li><a href="#ERC1155.safeTransferFrom(address,address,uint256,uint256,bytes)"><code class="function-signature">safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes data)</code></a></li><li><a href="#ERC1155._transferFrom(address,address,uint256,uint256,bytes,bool)"><code class="function-signature">_transferFrom(address from, address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li><a href="#ERC1155._internalTransferFrom(address,address,uint256,uint256,bytes,bool)"><code class="function-signature">_internalTransferFrom(address from, address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li><a href="#ERC1155.safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)"><code class="function-signature">safeBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data)</code></a></li><li><a href="#ERC1155._batchTransferFrom(address,address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_batchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li><a href="#ERC1155._internalBatchTransferFrom(address,address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_internalBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li><a href="#ERC1155._mint(address,uint256,uint256,bytes,bool)"><code class="function-signature">_mint(address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li><a href="#ERC1155._mintBatch(address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_mintBatch(address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li><a href="#ERC1155._burn(address,uint256,uint256,bytes,bool)"><code class="function-signature">_burn(address account, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li><a href="#ERC1155._burnBatch(address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_burnBatch(address account, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li><a href="#ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes)"><code class="function-signature">_doSafeTransferAcceptanceCheck(address operator, address from, address to, uint256 id, uint256 value, bytes data)</code></a></li><li><a href="#ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes)"><code class="function-signature">_doSafeBatchTransferAcceptanceCheck(address operator, address from, address to, uint256[] ids, uint256[] values, bytes data)</code></a></li><li><a href="#ERC1155.onTokenTransfer(uint256,address,address,uint256)"><code class="function-signature">onTokenTransfer(uint256 _tokenId, address _from, address _to, uint256 _value)</code></a></li><li><a href="#ERC1155.onMint(uint256,address,uint256)"><code class="function-signature">onMint(uint256 _tokenId, address _target, uint256 _amount)</code></a></li><li><a href="#ERC1155.onBurn(uint256,address,uint256)"><code class="function-signature">onBurn(uint256 _tokenId, address _target, uint256 _amount)</code></a></li><li class="inherited"><a href="matic#ERC165.supportsInterface(bytes4)"><code class="function-signature">supportsInterface(bytes4 interfaceId)</code></a></li><li class="inherited"><a href="matic#ERC165._registerInterface(bytes4)"><code class="function-signature">_registerInterface(bytes4 interfaceId)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC1155.TransferSingle(address,address,address,uint256,uint256)"><code class="function-signature">TransferSingle(address operator, address from, address to, uint256 id, uint256 value)</code></a></li><li class="inherited"><a href="#IERC1155.TransferBatch(address,address,address,uint256[],uint256[])"><code class="function-signature">TransferBatch(address operator, address from, address to, uint256[] ids, uint256[] values)</code></a></li><li class="inherited"><a href="#IERC1155.ApprovalForAll(address,address,bool)"><code class="function-signature">ApprovalForAll(address owner, address operator, bool approved)</code></a></li><li class="inherited"><a href="#IERC1155.URI(string,uint256)"><code class="function-signature">URI(string value, uint256 id)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="ERC1155.constructor()"></a><code class="function-signature">constructor()</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ERC1155.balanceOf(address,uint256)"></a><code class="function-signature">balanceOf(address account, uint256 id) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>

Get the specified address&#x27; balance for token with specified ID.
Attempting to query the zero account for a balance will result in a revert.




<h4><a class="anchor" aria-hidden="true" id="ERC1155.totalSupply(uint256)"></a><code class="function-signature">totalSupply(uint256 id) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ERC1155.balanceOfBatch(address[],uint256[])"></a><code class="function-signature">balanceOfBatch(address[] accounts, uint256[] ids) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">public</span></h4>

Get the balance of multiple account/token pairs.
If any of the query accounts is the zero account, this query will revert.




<h4><a class="anchor" aria-hidden="true" id="ERC1155.setApprovalForAll(address,bool)"></a><code class="function-signature">setApprovalForAll(address operator, bool approved)</code><span class="function-visibility">external</span></h4>

Sets or unsets the approval of a given operator.

An operator is allowed to transfer all tokens of the sender on their behalf.

Because an account already has operator privileges for itself, this function will revert
if the account attempts to set the approval status for itself.





<h4><a class="anchor" aria-hidden="true" id="ERC1155.isApprovedForAll(address,address)"></a><code class="function-signature">isApprovedForAll(address account, address operator) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ERC1155.safeTransferFrom(address,address,uint256,uint256,bytes)"></a><code class="function-signature">safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes data)</code><span class="function-visibility">external</span></h4>

Transfers `value` amount of an `id` from the `from` address to the `to` address specified.
Caller must be approved to manage the tokens being transferred out of the `from` account.
If `to` is a smart contract, will call `onERC1155Received` on `to` and act appropriately.




<h4><a class="anchor" aria-hidden="true" id="ERC1155._transferFrom(address,address,uint256,uint256,bytes,bool)"></a><code class="function-signature">_transferFrom(address from, address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ERC1155._internalTransferFrom(address,address,uint256,uint256,bytes,bool)"></a><code class="function-signature">_internalTransferFrom(address from, address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ERC1155.safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)"></a><code class="function-signature">safeBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data)</code><span class="function-visibility">external</span></h4>

Transfers `values` amount(s) of `ids` from the `from` address to the
`to` address specified. Caller must be approved to manage the tokens being
transferred out of the `from` account. If `to` is a smart contract, will
call `onERC1155BatchReceived` on `to` and act appropriately.




<h4><a class="anchor" aria-hidden="true" id="ERC1155._batchTransferFrom(address,address,uint256[],uint256[],bytes,bool)"></a><code class="function-signature">_batchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ERC1155._internalBatchTransferFrom(address,address,uint256[],uint256[],bytes,bool)"></a><code class="function-signature">_internalBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ERC1155._mint(address,uint256,uint256,bytes,bool)"></a><code class="function-signature">_mint(address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code><span class="function-visibility">internal</span></h4>

Internal function to mint an amount of a token with the given ID




<h4><a class="anchor" aria-hidden="true" id="ERC1155._mintBatch(address,uint256[],uint256[],bytes,bool)"></a><code class="function-signature">_mintBatch(address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code><span class="function-visibility">internal</span></h4>

Internal function to batch mint amounts of tokens with the given IDs




<h4><a class="anchor" aria-hidden="true" id="ERC1155._burn(address,uint256,uint256,bytes,bool)"></a><code class="function-signature">_burn(address account, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code><span class="function-visibility">internal</span></h4>

Internal function to burn an amount of a token with the given ID




<h4><a class="anchor" aria-hidden="true" id="ERC1155._burnBatch(address,uint256[],uint256[],bytes,bool)"></a><code class="function-signature">_burnBatch(address account, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code><span class="function-visibility">internal</span></h4>

Internal function to batch burn an amounts of tokens with the given IDs




<h4><a class="anchor" aria-hidden="true" id="ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes)"></a><code class="function-signature">_doSafeTransferAcceptanceCheck(address operator, address from, address to, uint256 id, uint256 value, bytes data)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes)"></a><code class="function-signature">_doSafeBatchTransferAcceptanceCheck(address operator, address from, address to, uint256[] ids, uint256[] values, bytes data)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ERC1155.onTokenTransfer(uint256,address,address,uint256)"></a><code class="function-signature">onTokenTransfer(uint256 _tokenId, address _from, address _to, uint256 _value)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ERC1155.onMint(uint256,address,uint256)"></a><code class="function-signature">onMint(uint256 _tokenId, address _target, uint256 _amount)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ERC1155.onBurn(uint256,address,uint256)"></a><code class="function-signature">onBurn(uint256 _tokenId, address _target, uint256 _amount)</code><span class="function-visibility">internal</span></h4>







### `ERC165`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#ERC165.constructor()"><code class="function-signature">constructor()</code></a></li><li><a href="#ERC165.supportsInterface(bytes4)"><code class="function-signature">supportsInterface(bytes4 interfaceId)</code></a></li><li><a href="#ERC165._registerInterface(bytes4)"><code class="function-signature">_registerInterface(bytes4 interfaceId)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="ERC165.constructor()"></a><code class="function-signature">constructor()</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ERC165.supportsInterface(bytes4)"></a><code class="function-signature">supportsInterface(bytes4 interfaceId) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>

See {IERC165-supportsInterface}.

Time complexity O(1), guaranteed to always use less than 30 000 gas.



<h4><a class="anchor" aria-hidden="true" id="ERC165._registerInterface(bytes4)"></a><code class="function-signature">_registerInterface(bytes4 interfaceId)</code><span class="function-visibility">internal</span></h4>

Registers the contract as an implementer of the interface defined by
`interfaceId`. Support of the actual ERC165 interface is automatic and
registering its interface id is not required.

See {IERC165-supportsInterface}.

Requirements:

- `interfaceId` cannot be the ERC165 invalid interface (`0xffffffff`).





### `ERC20`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#ERC20.balanceOf(address)"><code class="function-signature">balanceOf(address _account)</code></a></li><li><a href="#ERC20.transfer(address,uint256)"><code class="function-signature">transfer(address _recipient, uint256 _amount)</code></a></li><li><a href="#ERC20.allowance(address,address)"><code class="function-signature">allowance(address _owner, address _spender)</code></a></li><li><a href="#ERC20.approve(address,uint256)"><code class="function-signature">approve(address _spender, uint256 _amount)</code></a></li><li><a href="#ERC20.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address _sender, address _recipient, uint256 _amount)</code></a></li><li><a href="#ERC20.increaseAllowance(address,uint256)"><code class="function-signature">increaseAllowance(address _spender, uint256 _addedValue)</code></a></li><li><a href="#ERC20.decreaseAllowance(address,uint256)"><code class="function-signature">decreaseAllowance(address _spender, uint256 _subtractedValue)</code></a></li><li><a href="#ERC20._transfer(address,address,uint256)"><code class="function-signature">_transfer(address _sender, address _recipient, uint256 _amount)</code></a></li><li><a href="#ERC20._mint(address,uint256)"><code class="function-signature">_mint(address _account, uint256 _amount)</code></a></li><li><a href="#ERC20._burn(address,uint256)"><code class="function-signature">_burn(address _account, uint256 _amount)</code></a></li><li><a href="#ERC20._approve(address,address,uint256)"><code class="function-signature">_approve(address _owner, address _spender, uint256 _amount)</code></a></li><li><a href="#ERC20._burnFrom(address,uint256)"><code class="function-signature">_burnFrom(address _account, uint256 _amount)</code></a></li><li><a href="#ERC20.onTokenTransfer(address,address,uint256)"><code class="function-signature">onTokenTransfer(address _from, address _to, uint256 _value)</code></a></li><li class="inherited"><a href="matic#IERC20.totalSupply()"><code class="function-signature">totalSupply()</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="matic#IERC20.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li class="inherited"><a href="matic#IERC20.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="ERC20.balanceOf(address)"></a><code class="function-signature">balanceOf(address _account) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>

See {IERC20-balanceOf}.



<h4><a class="anchor" aria-hidden="true" id="ERC20.transfer(address,uint256)"></a><code class="function-signature">transfer(address _recipient, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>

See {IERC20-transfer}.

Requirements:

- `recipient` cannot be the zero address.
- the caller must have a balance of at least `amount`.



<h4><a class="anchor" aria-hidden="true" id="ERC20.allowance(address,address)"></a><code class="function-signature">allowance(address _owner, address _spender) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>

See {IERC20-allowance}.



<h4><a class="anchor" aria-hidden="true" id="ERC20.approve(address,uint256)"></a><code class="function-signature">approve(address _spender, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>

See {IERC20-approve}.

Requirements:

- `spender` cannot be the zero address.



<h4><a class="anchor" aria-hidden="true" id="ERC20.transferFrom(address,address,uint256)"></a><code class="function-signature">transferFrom(address _sender, address _recipient, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>

See {IERC20-transferFrom}.

Emits an {Approval} event indicating the updated allowance. This is not
required by the EIP. See the note at the beginning of {ERC20};

Requirements:
- `sender` and `recipient` cannot be the zero address.
- `sender` must have a balance of at least `amount`.
- the caller must have allowance for `sender`&#x27;s tokens of at least
`amount`.



<h4><a class="anchor" aria-hidden="true" id="ERC20.increaseAllowance(address,uint256)"></a><code class="function-signature">increaseAllowance(address _spender, uint256 _addedValue) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>

Atomically increases the allowance granted to `spender` by the caller.

This is an alternative to {approve} that can be used as a mitigation for
problems described in {IERC20-approve}.

Emits an {Approval} event indicating the updated allowance.

Requirements:

- `spender` cannot be the zero address.



<h4><a class="anchor" aria-hidden="true" id="ERC20.decreaseAllowance(address,uint256)"></a><code class="function-signature">decreaseAllowance(address _spender, uint256 _subtractedValue) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>

Atomically decreases the allowance granted to `spender` by the caller.

This is an alternative to {approve} that can be used as a mitigation for
problems described in {IERC20-approve}.

Emits an {Approval} event indicating the updated allowance.

Requirements:

- `spender` cannot be the zero address.
- `spender` must have allowance for the caller of at least
`subtractedValue`.



<h4><a class="anchor" aria-hidden="true" id="ERC20._transfer(address,address,uint256)"></a><code class="function-signature">_transfer(address _sender, address _recipient, uint256 _amount)</code><span class="function-visibility">internal</span></h4>

Moves tokens `amount` from `sender` to `recipient`.

This is internal function is equivalent to {transfer}, and can be used to
e.g. implement automatic token fees, slashing mechanisms, etc.

Emits a {Transfer} event.

Requirements:

- `sender` cannot be the zero address.
- `recipient` cannot be the zero address.
- `sender` must have a balance of at least `amount`.



<h4><a class="anchor" aria-hidden="true" id="ERC20._mint(address,uint256)"></a><code class="function-signature">_mint(address _account, uint256 _amount)</code><span class="function-visibility">internal</span></h4>

Creates `amount` tokens and assigns them to `account`, increasing
the total supply.

Emits a {Transfer} event with `from` set to the zero address.

Requirements

- `to` cannot be the zero address.



<h4><a class="anchor" aria-hidden="true" id="ERC20._burn(address,uint256)"></a><code class="function-signature">_burn(address _account, uint256 _amount)</code><span class="function-visibility">internal</span></h4>

Destroys `amount` tokens from `account`, reducing the
total supply.

Emits a {Transfer} event with `to` set to the zero address.

Requirements

- `account` cannot be the zero address.
- `account` must have at least `amount` tokens.



<h4><a class="anchor" aria-hidden="true" id="ERC20._approve(address,address,uint256)"></a><code class="function-signature">_approve(address _owner, address _spender, uint256 _amount)</code><span class="function-visibility">internal</span></h4>

Sets `amount` as the allowance of `spender` over the `owner`s tokens.

This is internal function is equivalent to [`approve`](reporting#ERC20.approve(address,uint256)), and can be used to
e.g. set automatic allowances for certain subsystems, etc.

Emits an {Approval} event.

Requirements:

- `owner` cannot be the zero address.
- `spender` cannot be the zero address.



<h4><a class="anchor" aria-hidden="true" id="ERC20._burnFrom(address,uint256)"></a><code class="function-signature">_burnFrom(address _account, uint256 _amount)</code><span class="function-visibility">internal</span></h4>

Destroys `amount` tokens from `account`.`amount` is then deducted
from the caller&#x27;s allowance.

See {_burn} and {_approve}.



<h4><a class="anchor" aria-hidden="true" id="ERC20.onTokenTransfer(address,address,uint256)"></a><code class="function-signature">onTokenTransfer(address _from, address _to, uint256 _value)</code><span class="function-visibility">internal</span></h4>







### `IAffiliateValidator`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IAffiliateValidator.validateReference(address,address)"><code class="function-signature">validateReference(address _account, address _referrer)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IAffiliateValidator.validateReference(address,address)"></a><code class="function-signature">validateReference(address _account, address _referrer) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>







### `IAugur`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IAugur.createChildUniverse(bytes32,uint256[])"><code class="function-signature">createChildUniverse(bytes32 _parentPayoutDistributionHash, uint256[] _parentPayoutNumerators)</code></a></li><li><a href="#IAugur.isKnownUniverse(contract IUniverse)"><code class="function-signature">isKnownUniverse(contract IUniverse _universe)</code></a></li><li><a href="#IAugur.trustedCashTransfer(address,address,uint256)"><code class="function-signature">trustedCashTransfer(address _from, address _to, uint256 _amount)</code></a></li><li><a href="#IAugur.isTrustedSender(address)"><code class="function-signature">isTrustedSender(address _address)</code></a></li><li><a href="#IAugur.onCategoricalMarketCreated(uint256,string,contract IMarket,address,address,uint256,bytes32[])"><code class="function-signature">onCategoricalMarketCreated(uint256 _endTime, string _extraInfo, contract IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash, bytes32[] _outcomes)</code></a></li><li><a href="#IAugur.onYesNoMarketCreated(uint256,string,contract IMarket,address,address,uint256)"><code class="function-signature">onYesNoMarketCreated(uint256 _endTime, string _extraInfo, contract IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash)</code></a></li><li><a href="#IAugur.onScalarMarketCreated(uint256,string,contract IMarket,address,address,uint256,int256[],uint256)"><code class="function-signature">onScalarMarketCreated(uint256 _endTime, string _extraInfo, contract IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash, int256[] _prices, uint256 _numTicks)</code></a></li><li><a href="#IAugur.logInitialReportSubmitted(contract IUniverse,address,address,address,uint256,bool,uint256[],string,uint256,uint256)"><code class="function-signature">logInitialReportSubmitted(contract IUniverse _universe, address _reporter, address _market, address _initialReporter, uint256 _amountStaked, bool _isDesignatedReporter, uint256[] _payoutNumerators, string _description, uint256 _nextWindowStartTime, uint256 _nextWindowEndTime)</code></a></li><li><a href="#IAugur.disputeCrowdsourcerCreated(contract IUniverse,address,address,uint256[],uint256,uint256)"><code class="function-signature">disputeCrowdsourcerCreated(contract IUniverse _universe, address _market, address _disputeCrowdsourcer, uint256[] _payoutNumerators, uint256 _size, uint256 _disputeRound)</code></a></li><li><a href="#IAugur.logDisputeCrowdsourcerContribution(contract IUniverse,address,address,address,uint256,string,uint256[],uint256,uint256,uint256)"><code class="function-signature">logDisputeCrowdsourcerContribution(contract IUniverse _universe, address _reporter, address _market, address _disputeCrowdsourcer, uint256 _amountStaked, string description, uint256[] _payoutNumerators, uint256 _currentStake, uint256 _stakeRemaining, uint256 _disputeRound)</code></a></li><li><a href="#IAugur.logDisputeCrowdsourcerCompleted(contract IUniverse,address,address,uint256[],uint256,uint256,bool,uint256,uint256,uint256)"><code class="function-signature">logDisputeCrowdsourcerCompleted(contract IUniverse _universe, address _market, address _disputeCrowdsourcer, uint256[] _payoutNumerators, uint256 _nextWindowStartTime, uint256 _nextWindowEndTime, bool _pacingOn, uint256 _totalRepStakedInPayout, uint256 _totalRepStakedInMarket, uint256 _disputeRound)</code></a></li><li><a href="#IAugur.logInitialReporterRedeemed(contract IUniverse,address,address,uint256,uint256,uint256[])"><code class="function-signature">logInitialReporterRedeemed(contract IUniverse _universe, address _reporter, address _market, uint256 _amountRedeemed, uint256 _repReceived, uint256[] _payoutNumerators)</code></a></li><li><a href="#IAugur.logDisputeCrowdsourcerRedeemed(contract IUniverse,address,address,uint256,uint256,uint256[])"><code class="function-signature">logDisputeCrowdsourcerRedeemed(contract IUniverse _universe, address _reporter, address _market, uint256 _amountRedeemed, uint256 _repReceived, uint256[] _payoutNumerators)</code></a></li><li><a href="#IAugur.logMarketFinalized(contract IUniverse,uint256[])"><code class="function-signature">logMarketFinalized(contract IUniverse _universe, uint256[] _winningPayoutNumerators)</code></a></li><li><a href="#IAugur.logMarketMigrated(contract IMarket,contract IUniverse)"><code class="function-signature">logMarketMigrated(contract IMarket _market, contract IUniverse _originalUniverse)</code></a></li><li><a href="#IAugur.logReportingParticipantDisavowed(contract IUniverse,contract IMarket)"><code class="function-signature">logReportingParticipantDisavowed(contract IUniverse _universe, contract IMarket _market)</code></a></li><li><a href="#IAugur.logMarketParticipantsDisavowed(contract IUniverse)"><code class="function-signature">logMarketParticipantsDisavowed(contract IUniverse _universe)</code></a></li><li><a href="#IAugur.logCompleteSetsPurchased(contract IUniverse,contract IMarket,address,uint256)"><code class="function-signature">logCompleteSetsPurchased(contract IUniverse _universe, contract IMarket _market, address _account, uint256 _numCompleteSets)</code></a></li><li><a href="#IAugur.logCompleteSetsSold(contract IUniverse,contract IMarket,address,uint256,uint256)"><code class="function-signature">logCompleteSetsSold(contract IUniverse _universe, contract IMarket _market, address _account, uint256 _numCompleteSets, uint256 _fees)</code></a></li><li><a href="#IAugur.logMarketOIChanged(contract IUniverse,contract IMarket)"><code class="function-signature">logMarketOIChanged(contract IUniverse _universe, contract IMarket _market)</code></a></li><li><a href="#IAugur.logTradingProceedsClaimed(contract IUniverse,address,address,uint256,uint256,uint256,uint256)"><code class="function-signature">logTradingProceedsClaimed(contract IUniverse _universe, address _sender, address _market, uint256 _outcome, uint256 _numShares, uint256 _numPayoutTokens, uint256 _fees)</code></a></li><li><a href="#IAugur.logUniverseForked(contract IMarket)"><code class="function-signature">logUniverseForked(contract IMarket _forkingMarket)</code></a></li><li><a href="#IAugur.logReputationTokensTransferred(contract IUniverse,address,address,uint256,uint256,uint256)"><code class="function-signature">logReputationTokensTransferred(contract IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance)</code></a></li><li><a href="#IAugur.logReputationTokensBurned(contract IUniverse,address,uint256,uint256,uint256)"><code class="function-signature">logReputationTokensBurned(contract IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance)</code></a></li><li><a href="#IAugur.logReputationTokensMinted(contract IUniverse,address,uint256,uint256,uint256)"><code class="function-signature">logReputationTokensMinted(contract IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance)</code></a></li><li><a href="#IAugur.logShareTokensBalanceChanged(address,contract IMarket,uint256,uint256)"><code class="function-signature">logShareTokensBalanceChanged(address _account, contract IMarket _market, uint256 _outcome, uint256 _balance)</code></a></li><li><a href="#IAugur.logDisputeCrowdsourcerTokensTransferred(contract IUniverse,address,address,uint256,uint256,uint256)"><code class="function-signature">logDisputeCrowdsourcerTokensTransferred(contract IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance)</code></a></li><li><a href="#IAugur.logDisputeCrowdsourcerTokensBurned(contract IUniverse,address,uint256,uint256,uint256)"><code class="function-signature">logDisputeCrowdsourcerTokensBurned(contract IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance)</code></a></li><li><a href="#IAugur.logDisputeCrowdsourcerTokensMinted(contract IUniverse,address,uint256,uint256,uint256)"><code class="function-signature">logDisputeCrowdsourcerTokensMinted(contract IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance)</code></a></li><li><a href="#IAugur.logDisputeWindowCreated(contract IDisputeWindow,uint256,bool)"><code class="function-signature">logDisputeWindowCreated(contract IDisputeWindow _disputeWindow, uint256 _id, bool _initial)</code></a></li><li><a href="#IAugur.logParticipationTokensRedeemed(contract IUniverse,address,uint256,uint256)"><code class="function-signature">logParticipationTokensRedeemed(contract IUniverse universe, address _sender, uint256 _attoParticipationTokens, uint256 _feePayoutShare)</code></a></li><li><a href="#IAugur.logTimestampSet(uint256)"><code class="function-signature">logTimestampSet(uint256 _newTimestamp)</code></a></li><li><a href="#IAugur.logInitialReporterTransferred(contract IUniverse,contract IMarket,address,address)"><code class="function-signature">logInitialReporterTransferred(contract IUniverse _universe, contract IMarket _market, address _from, address _to)</code></a></li><li><a href="#IAugur.logMarketTransferred(contract IUniverse,address,address)"><code class="function-signature">logMarketTransferred(contract IUniverse _universe, address _from, address _to)</code></a></li><li><a href="#IAugur.logParticipationTokensTransferred(contract IUniverse,address,address,uint256,uint256,uint256)"><code class="function-signature">logParticipationTokensTransferred(contract IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance)</code></a></li><li><a href="#IAugur.logParticipationTokensBurned(contract IUniverse,address,uint256,uint256,uint256)"><code class="function-signature">logParticipationTokensBurned(contract IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance)</code></a></li><li><a href="#IAugur.logParticipationTokensMinted(contract IUniverse,address,uint256,uint256,uint256)"><code class="function-signature">logParticipationTokensMinted(contract IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance)</code></a></li><li><a href="#IAugur.logMarketRepBondTransferred(address,address,address)"><code class="function-signature">logMarketRepBondTransferred(address _universe, address _from, address _to)</code></a></li><li><a href="#IAugur.logWarpSyncDataUpdated(address,uint256,uint256)"><code class="function-signature">logWarpSyncDataUpdated(address _universe, uint256 _warpSyncHash, uint256 _marketEndTime)</code></a></li><li><a href="#IAugur.isKnownFeeSender(address)"><code class="function-signature">isKnownFeeSender(address _feeSender)</code></a></li><li><a href="#IAugur.lookup(bytes32)"><code class="function-signature">lookup(bytes32 _key)</code></a></li><li><a href="#IAugur.getTimestamp()"><code class="function-signature">getTimestamp()</code></a></li><li><a href="#IAugur.getMaximumMarketEndDate()"><code class="function-signature">getMaximumMarketEndDate()</code></a></li><li><a href="#IAugur.isKnownMarket(contract IMarket)"><code class="function-signature">isKnownMarket(contract IMarket _market)</code></a></li><li><a href="#IAugur.derivePayoutDistributionHash(uint256[],uint256,uint256)"><code class="function-signature">derivePayoutDistributionHash(uint256[] _payoutNumerators, uint256 _numTicks, uint256 numOutcomes)</code></a></li><li><a href="#IAugur.logValidityBondChanged(uint256)"><code class="function-signature">logValidityBondChanged(uint256 _validityBond)</code></a></li><li><a href="#IAugur.logDesignatedReportStakeChanged(uint256)"><code class="function-signature">logDesignatedReportStakeChanged(uint256 _designatedReportStake)</code></a></li><li><a href="#IAugur.logNoShowBondChanged(uint256)"><code class="function-signature">logNoShowBondChanged(uint256 _noShowBond)</code></a></li><li><a href="#IAugur.logReportingFeeChanged(uint256)"><code class="function-signature">logReportingFeeChanged(uint256 _reportingFee)</code></a></li><li><a href="#IAugur.getUniverseForkIndex(contract IUniverse)"><code class="function-signature">getUniverseForkIndex(contract IUniverse _universe)</code></a></li><li><a href="#IAugur.getMarketType(contract IMarket)"><code class="function-signature">getMarketType(contract IMarket _market)</code></a></li><li><a href="#IAugur.getMarketOutcomes(contract IMarket)"><code class="function-signature">getMarketOutcomes(contract IMarket _market)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IAugur.createChildUniverse(bytes32,uint256[])"></a><code class="function-signature">createChildUniverse(bytes32 _parentPayoutDistributionHash, uint256[] _parentPayoutNumerators) <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.isKnownUniverse(contract IUniverse)"></a><code class="function-signature">isKnownUniverse(contract IUniverse _universe) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.trustedCashTransfer(address,address,uint256)"></a><code class="function-signature">trustedCashTransfer(address _from, address _to, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.isTrustedSender(address)"></a><code class="function-signature">isTrustedSender(address _address) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.onCategoricalMarketCreated(uint256,string,contract IMarket,address,address,uint256,bytes32[])"></a><code class="function-signature">onCategoricalMarketCreated(uint256 _endTime, string _extraInfo, contract IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash, bytes32[] _outcomes) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.onYesNoMarketCreated(uint256,string,contract IMarket,address,address,uint256)"></a><code class="function-signature">onYesNoMarketCreated(uint256 _endTime, string _extraInfo, contract IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.onScalarMarketCreated(uint256,string,contract IMarket,address,address,uint256,int256[],uint256)"></a><code class="function-signature">onScalarMarketCreated(uint256 _endTime, string _extraInfo, contract IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash, int256[] _prices, uint256 _numTicks) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logInitialReportSubmitted(contract IUniverse,address,address,address,uint256,bool,uint256[],string,uint256,uint256)"></a><code class="function-signature">logInitialReportSubmitted(contract IUniverse _universe, address _reporter, address _market, address _initialReporter, uint256 _amountStaked, bool _isDesignatedReporter, uint256[] _payoutNumerators, string _description, uint256 _nextWindowStartTime, uint256 _nextWindowEndTime) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.disputeCrowdsourcerCreated(contract IUniverse,address,address,uint256[],uint256,uint256)"></a><code class="function-signature">disputeCrowdsourcerCreated(contract IUniverse _universe, address _market, address _disputeCrowdsourcer, uint256[] _payoutNumerators, uint256 _size, uint256 _disputeRound) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logDisputeCrowdsourcerContribution(contract IUniverse,address,address,address,uint256,string,uint256[],uint256,uint256,uint256)"></a><code class="function-signature">logDisputeCrowdsourcerContribution(contract IUniverse _universe, address _reporter, address _market, address _disputeCrowdsourcer, uint256 _amountStaked, string description, uint256[] _payoutNumerators, uint256 _currentStake, uint256 _stakeRemaining, uint256 _disputeRound) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logDisputeCrowdsourcerCompleted(contract IUniverse,address,address,uint256[],uint256,uint256,bool,uint256,uint256,uint256)"></a><code class="function-signature">logDisputeCrowdsourcerCompleted(contract IUniverse _universe, address _market, address _disputeCrowdsourcer, uint256[] _payoutNumerators, uint256 _nextWindowStartTime, uint256 _nextWindowEndTime, bool _pacingOn, uint256 _totalRepStakedInPayout, uint256 _totalRepStakedInMarket, uint256 _disputeRound) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logInitialReporterRedeemed(contract IUniverse,address,address,uint256,uint256,uint256[])"></a><code class="function-signature">logInitialReporterRedeemed(contract IUniverse _universe, address _reporter, address _market, uint256 _amountRedeemed, uint256 _repReceived, uint256[] _payoutNumerators) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logDisputeCrowdsourcerRedeemed(contract IUniverse,address,address,uint256,uint256,uint256[])"></a><code class="function-signature">logDisputeCrowdsourcerRedeemed(contract IUniverse _universe, address _reporter, address _market, uint256 _amountRedeemed, uint256 _repReceived, uint256[] _payoutNumerators) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logMarketFinalized(contract IUniverse,uint256[])"></a><code class="function-signature">logMarketFinalized(contract IUniverse _universe, uint256[] _winningPayoutNumerators) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logMarketMigrated(contract IMarket,contract IUniverse)"></a><code class="function-signature">logMarketMigrated(contract IMarket _market, contract IUniverse _originalUniverse) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logReportingParticipantDisavowed(contract IUniverse,contract IMarket)"></a><code class="function-signature">logReportingParticipantDisavowed(contract IUniverse _universe, contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logMarketParticipantsDisavowed(contract IUniverse)"></a><code class="function-signature">logMarketParticipantsDisavowed(contract IUniverse _universe) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logCompleteSetsPurchased(contract IUniverse,contract IMarket,address,uint256)"></a><code class="function-signature">logCompleteSetsPurchased(contract IUniverse _universe, contract IMarket _market, address _account, uint256 _numCompleteSets) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logCompleteSetsSold(contract IUniverse,contract IMarket,address,uint256,uint256)"></a><code class="function-signature">logCompleteSetsSold(contract IUniverse _universe, contract IMarket _market, address _account, uint256 _numCompleteSets, uint256 _fees) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logMarketOIChanged(contract IUniverse,contract IMarket)"></a><code class="function-signature">logMarketOIChanged(contract IUniverse _universe, contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logTradingProceedsClaimed(contract IUniverse,address,address,uint256,uint256,uint256,uint256)"></a><code class="function-signature">logTradingProceedsClaimed(contract IUniverse _universe, address _sender, address _market, uint256 _outcome, uint256 _numShares, uint256 _numPayoutTokens, uint256 _fees) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logUniverseForked(contract IMarket)"></a><code class="function-signature">logUniverseForked(contract IMarket _forkingMarket) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logReputationTokensTransferred(contract IUniverse,address,address,uint256,uint256,uint256)"></a><code class="function-signature">logReputationTokensTransferred(contract IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logReputationTokensBurned(contract IUniverse,address,uint256,uint256,uint256)"></a><code class="function-signature">logReputationTokensBurned(contract IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logReputationTokensMinted(contract IUniverse,address,uint256,uint256,uint256)"></a><code class="function-signature">logReputationTokensMinted(contract IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logShareTokensBalanceChanged(address,contract IMarket,uint256,uint256)"></a><code class="function-signature">logShareTokensBalanceChanged(address _account, contract IMarket _market, uint256 _outcome, uint256 _balance) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logDisputeCrowdsourcerTokensTransferred(contract IUniverse,address,address,uint256,uint256,uint256)"></a><code class="function-signature">logDisputeCrowdsourcerTokensTransferred(contract IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logDisputeCrowdsourcerTokensBurned(contract IUniverse,address,uint256,uint256,uint256)"></a><code class="function-signature">logDisputeCrowdsourcerTokensBurned(contract IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logDisputeCrowdsourcerTokensMinted(contract IUniverse,address,uint256,uint256,uint256)"></a><code class="function-signature">logDisputeCrowdsourcerTokensMinted(contract IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logDisputeWindowCreated(contract IDisputeWindow,uint256,bool)"></a><code class="function-signature">logDisputeWindowCreated(contract IDisputeWindow _disputeWindow, uint256 _id, bool _initial) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logParticipationTokensRedeemed(contract IUniverse,address,uint256,uint256)"></a><code class="function-signature">logParticipationTokensRedeemed(contract IUniverse universe, address _sender, uint256 _attoParticipationTokens, uint256 _feePayoutShare) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logTimestampSet(uint256)"></a><code class="function-signature">logTimestampSet(uint256 _newTimestamp) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logInitialReporterTransferred(contract IUniverse,contract IMarket,address,address)"></a><code class="function-signature">logInitialReporterTransferred(contract IUniverse _universe, contract IMarket _market, address _from, address _to) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logMarketTransferred(contract IUniverse,address,address)"></a><code class="function-signature">logMarketTransferred(contract IUniverse _universe, address _from, address _to) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logParticipationTokensTransferred(contract IUniverse,address,address,uint256,uint256,uint256)"></a><code class="function-signature">logParticipationTokensTransferred(contract IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logParticipationTokensBurned(contract IUniverse,address,uint256,uint256,uint256)"></a><code class="function-signature">logParticipationTokensBurned(contract IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logParticipationTokensMinted(contract IUniverse,address,uint256,uint256,uint256)"></a><code class="function-signature">logParticipationTokensMinted(contract IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logMarketRepBondTransferred(address,address,address)"></a><code class="function-signature">logMarketRepBondTransferred(address _universe, address _from, address _to) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logWarpSyncDataUpdated(address,uint256,uint256)"></a><code class="function-signature">logWarpSyncDataUpdated(address _universe, uint256 _warpSyncHash, uint256 _marketEndTime) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.isKnownFeeSender(address)"></a><code class="function-signature">isKnownFeeSender(address _feeSender) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.lookup(bytes32)"></a><code class="function-signature">lookup(bytes32 _key) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.getTimestamp()"></a><code class="function-signature">getTimestamp() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.getMaximumMarketEndDate()"></a><code class="function-signature">getMaximumMarketEndDate() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.isKnownMarket(contract IMarket)"></a><code class="function-signature">isKnownMarket(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.derivePayoutDistributionHash(uint256[],uint256,uint256)"></a><code class="function-signature">derivePayoutDistributionHash(uint256[] _payoutNumerators, uint256 _numTicks, uint256 numOutcomes) <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logValidityBondChanged(uint256)"></a><code class="function-signature">logValidityBondChanged(uint256 _validityBond) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logDesignatedReportStakeChanged(uint256)"></a><code class="function-signature">logDesignatedReportStakeChanged(uint256 _designatedReportStake) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logNoShowBondChanged(uint256)"></a><code class="function-signature">logNoShowBondChanged(uint256 _noShowBond) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.logReportingFeeChanged(uint256)"></a><code class="function-signature">logReportingFeeChanged(uint256 _reportingFee) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.getUniverseForkIndex(contract IUniverse)"></a><code class="function-signature">getUniverseForkIndex(contract IUniverse _universe) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.getMarketType(contract IMarket)"></a><code class="function-signature">getMarketType(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">enum IMarket.MarketType</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugur.getMarketOutcomes(contract IMarket)"></a><code class="function-signature">getMarketOutcomes(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">bytes32[]</span></code><span class="function-visibility">public</span></h4>







### `IAugurPredicate`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IAugurPredicate.trustedTransfer(address,uint256)"><code class="function-signature">trustedTransfer(address recipient, uint256 amount)</code></a></li><li><a href="#IAugurPredicate.depositToFeePot(uint256)"><code class="function-signature">depositToFeePot(uint256 amount)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IAugurPredicate.trustedTransfer(address,uint256)"></a><code class="function-signature">trustedTransfer(address recipient, uint256 amount)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugurPredicate.depositToFeePot(uint256)"></a><code class="function-signature">depositToFeePot(uint256 amount)</code><span class="function-visibility">external</span></h4>







### `IAugurTrading`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IAugurTrading.lookup(bytes32)"><code class="function-signature">lookup(bytes32 _key)</code></a></li><li><a href="#IAugurTrading.logProfitLossChanged(contract IMarket,address,uint256,int256,uint256,int256,int256,int256)"><code class="function-signature">logProfitLossChanged(contract IMarket _market, address _account, uint256 _outcome, int256 _netPosition, uint256 _avgPrice, int256 _realizedProfit, int256 _frozenFunds, int256 _realizedCost)</code></a></li><li><a href="#IAugurTrading.logOrderCreated(contract IUniverse,bytes32,bytes32)"><code class="function-signature">logOrderCreated(contract IUniverse _universe, bytes32 _orderId, bytes32 _tradeGroupId)</code></a></li><li><a href="#IAugurTrading.logOrderCanceled(contract IUniverse,contract IMarket,address,uint256,uint256,bytes32)"><code class="function-signature">logOrderCanceled(contract IUniverse _universe, contract IMarket _market, address _creator, uint256 _tokenRefund, uint256 _sharesRefund, bytes32 _orderId)</code></a></li><li><a href="#IAugurTrading.logOrderFilled(contract IUniverse,address,address,uint256,uint256,uint256,bytes32,bytes32)"><code class="function-signature">logOrderFilled(contract IUniverse _universe, address _creator, address _filler, uint256 _price, uint256 _fees, uint256 _amountFilled, bytes32 _orderId, bytes32 _tradeGroupId)</code></a></li><li><a href="#IAugurTrading.logMarketVolumeChanged(contract IUniverse,address,uint256,uint256[],uint256)"><code class="function-signature">logMarketVolumeChanged(contract IUniverse _universe, address _market, uint256 _volume, uint256[] _outcomeVolumes, uint256 _totalTrades)</code></a></li><li><a href="#IAugurTrading.logZeroXOrderFilled(contract IUniverse,contract IMarket,bytes32,bytes32,uint8,address[],uint256[])"><code class="function-signature">logZeroXOrderFilled(contract IUniverse _universe, contract IMarket _market, bytes32 _orderHash, bytes32 _tradeGroupId, uint8 _orderType, address[] _addressData, uint256[] _uint256Data)</code></a></li><li><a href="#IAugurTrading.logZeroXOrderCanceled(address,address,address,uint256,uint256,uint256,uint8,bytes32)"><code class="function-signature">logZeroXOrderCanceled(address _universe, address _market, address _account, uint256 _outcome, uint256 _price, uint256 _amount, uint8 _type, bytes32 _orderHash)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IAugurTrading.lookup(bytes32)"></a><code class="function-signature">lookup(bytes32 _key) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugurTrading.logProfitLossChanged(contract IMarket,address,uint256,int256,uint256,int256,int256,int256)"></a><code class="function-signature">logProfitLossChanged(contract IMarket _market, address _account, uint256 _outcome, int256 _netPosition, uint256 _avgPrice, int256 _realizedProfit, int256 _frozenFunds, int256 _realizedCost) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugurTrading.logOrderCreated(contract IUniverse,bytes32,bytes32)"></a><code class="function-signature">logOrderCreated(contract IUniverse _universe, bytes32 _orderId, bytes32 _tradeGroupId) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugurTrading.logOrderCanceled(contract IUniverse,contract IMarket,address,uint256,uint256,bytes32)"></a><code class="function-signature">logOrderCanceled(contract IUniverse _universe, contract IMarket _market, address _creator, uint256 _tokenRefund, uint256 _sharesRefund, bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugurTrading.logOrderFilled(contract IUniverse,address,address,uint256,uint256,uint256,bytes32,bytes32)"></a><code class="function-signature">logOrderFilled(contract IUniverse _universe, address _creator, address _filler, uint256 _price, uint256 _fees, uint256 _amountFilled, bytes32 _orderId, bytes32 _tradeGroupId) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugurTrading.logMarketVolumeChanged(contract IUniverse,address,uint256,uint256[],uint256)"></a><code class="function-signature">logMarketVolumeChanged(contract IUniverse _universe, address _market, uint256 _volume, uint256[] _outcomeVolumes, uint256 _totalTrades) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugurTrading.logZeroXOrderFilled(contract IUniverse,contract IMarket,bytes32,bytes32,uint8,address[],uint256[])"></a><code class="function-signature">logZeroXOrderFilled(contract IUniverse _universe, contract IMarket _market, bytes32 _orderHash, bytes32 _tradeGroupId, uint8 _orderType, address[] _addressData, uint256[] _uint256Data) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugurTrading.logZeroXOrderCanceled(address,address,address,uint256,uint256,uint256,uint8,bytes32)"></a><code class="function-signature">logZeroXOrderCanceled(address _universe, address _market, address _account, uint256 _outcome, uint256 _price, uint256 _amount, uint8 _type, bytes32 _orderHash)</code><span class="function-visibility">public</span></h4>







### `ICash`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li class="inherited"><a href="#IERC20.totalSupply()"><code class="function-signature">totalSupply()</code></a></li><li class="inherited"><a href="#IERC20.balanceOf(address)"><code class="function-signature">balanceOf(address owner)</code></a></li><li class="inherited"><a href="#IERC20.transfer(address,uint256)"><code class="function-signature">transfer(address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address from, address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.approve(address,uint256)"><code class="function-signature">approve(address spender, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.allowance(address,address)"><code class="function-signature">allowance(address owner, address spender)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC20.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li class="inherited"><a href="#IERC20.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li></ul></div>





### `IDepositManager`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IDepositManager.depositBulk(address[],uint256[],address)"><code class="function-signature">depositBulk(address[] _tokens, uint256[] _amountOrTokens, address _user)</code></a></li><li><a href="#IDepositManager.transferAssets(address,address,uint256)"><code class="function-signature">transferAssets(address _token, address _user, uint256 _amountOrNFTId)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IDepositManager.depositBulk(address[],uint256[],address)"></a><code class="function-signature">depositBulk(address[] _tokens, uint256[] _amountOrTokens, address _user)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDepositManager.transferAssets(address,address,uint256)"></a><code class="function-signature">transferAssets(address _token, address _user, uint256 _amountOrNFTId)</code><span class="function-visibility">external</span></h4>







### `IDisputeWindow`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IDisputeWindow.invalidMarketsTotal()"><code class="function-signature">invalidMarketsTotal()</code></a></li><li><a href="#IDisputeWindow.validityBondTotal()"><code class="function-signature">validityBondTotal()</code></a></li><li><a href="#IDisputeWindow.incorrectDesignatedReportTotal()"><code class="function-signature">incorrectDesignatedReportTotal()</code></a></li><li><a href="#IDisputeWindow.initialReportBondTotal()"><code class="function-signature">initialReportBondTotal()</code></a></li><li><a href="#IDisputeWindow.designatedReportNoShowsTotal()"><code class="function-signature">designatedReportNoShowsTotal()</code></a></li><li><a href="#IDisputeWindow.designatedReporterNoShowBondTotal()"><code class="function-signature">designatedReporterNoShowBondTotal()</code></a></li><li><a href="#IDisputeWindow.initialize(contract IAugur,contract IUniverse,uint256,bool,uint256,uint256)"><code class="function-signature">initialize(contract IAugur _augur, contract IUniverse _universe, uint256 _disputeWindowId, bool _participationTokensEnabled, uint256 _duration, uint256 _startTime)</code></a></li><li><a href="#IDisputeWindow.trustedBuy(address,uint256)"><code class="function-signature">trustedBuy(address _buyer, uint256 _attotokens)</code></a></li><li><a href="#IDisputeWindow.getUniverse()"><code class="function-signature">getUniverse()</code></a></li><li><a href="#IDisputeWindow.getReputationToken()"><code class="function-signature">getReputationToken()</code></a></li><li><a href="#IDisputeWindow.getStartTime()"><code class="function-signature">getStartTime()</code></a></li><li><a href="#IDisputeWindow.getEndTime()"><code class="function-signature">getEndTime()</code></a></li><li><a href="#IDisputeWindow.getWindowId()"><code class="function-signature">getWindowId()</code></a></li><li><a href="#IDisputeWindow.isActive()"><code class="function-signature">isActive()</code></a></li><li><a href="#IDisputeWindow.isOver()"><code class="function-signature">isOver()</code></a></li><li><a href="#IDisputeWindow.onMarketFinalized()"><code class="function-signature">onMarketFinalized()</code></a></li><li><a href="#IDisputeWindow.redeem(address)"><code class="function-signature">redeem(address _account)</code></a></li><li class="inherited"><a href="#IERC20.totalSupply()"><code class="function-signature">totalSupply()</code></a></li><li class="inherited"><a href="#IERC20.balanceOf(address)"><code class="function-signature">balanceOf(address owner)</code></a></li><li class="inherited"><a href="#IERC20.transfer(address,uint256)"><code class="function-signature">transfer(address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address from, address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.approve(address,uint256)"><code class="function-signature">approve(address spender, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.allowance(address,address)"><code class="function-signature">allowance(address owner, address spender)</code></a></li><li class="inherited"><a href="matic#ITyped.getTypeName()"><code class="function-signature">getTypeName()</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC20.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li class="inherited"><a href="#IERC20.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.invalidMarketsTotal()"></a><code class="function-signature">invalidMarketsTotal() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.validityBondTotal()"></a><code class="function-signature">validityBondTotal() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.incorrectDesignatedReportTotal()"></a><code class="function-signature">incorrectDesignatedReportTotal() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.initialReportBondTotal()"></a><code class="function-signature">initialReportBondTotal() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.designatedReportNoShowsTotal()"></a><code class="function-signature">designatedReportNoShowsTotal() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.designatedReporterNoShowBondTotal()"></a><code class="function-signature">designatedReporterNoShowBondTotal() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.initialize(contract IAugur,contract IUniverse,uint256,bool,uint256,uint256)"></a><code class="function-signature">initialize(contract IAugur _augur, contract IUniverse _universe, uint256 _disputeWindowId, bool _participationTokensEnabled, uint256 _duration, uint256 _startTime)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.trustedBuy(address,uint256)"></a><code class="function-signature">trustedBuy(address _buyer, uint256 _attotokens) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.getUniverse()"></a><code class="function-signature">getUniverse() <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.getReputationToken()"></a><code class="function-signature">getReputationToken() <span class="return-arrow">→</span> <span class="return-type">contract IReputationToken</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.getStartTime()"></a><code class="function-signature">getStartTime() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.getEndTime()"></a><code class="function-signature">getEndTime() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.getWindowId()"></a><code class="function-signature">getWindowId() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.isActive()"></a><code class="function-signature">isActive() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.isOver()"></a><code class="function-signature">isOver() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.onMarketFinalized()"></a><code class="function-signature">onMarketFinalized()</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeWindow.redeem(address)"></a><code class="function-signature">redeem(address _account) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>







### `IERC1155`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IERC1155.safeTransferFrom(address,address,uint256,uint256,bytes)"><code class="function-signature">safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes data)</code></a></li><li><a href="#IERC1155.safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)"><code class="function-signature">safeBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data)</code></a></li><li><a href="#IERC1155.setApprovalForAll(address,bool)"><code class="function-signature">setApprovalForAll(address operator, bool approved)</code></a></li><li><a href="#IERC1155.isApprovedForAll(address,address)"><code class="function-signature">isApprovedForAll(address owner, address operator)</code></a></li><li><a href="#IERC1155.balanceOf(address,uint256)"><code class="function-signature">balanceOf(address owner, uint256 id)</code></a></li><li><a href="#IERC1155.totalSupply(uint256)"><code class="function-signature">totalSupply(uint256 id)</code></a></li><li><a href="#IERC1155.balanceOfBatch(address[],uint256[])"><code class="function-signature">balanceOfBatch(address[] owners, uint256[] ids)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li><a href="#IERC1155.TransferSingle(address,address,address,uint256,uint256)"><code class="function-signature">TransferSingle(address operator, address from, address to, uint256 id, uint256 value)</code></a></li><li><a href="#IERC1155.TransferBatch(address,address,address,uint256[],uint256[])"><code class="function-signature">TransferBatch(address operator, address from, address to, uint256[] ids, uint256[] values)</code></a></li><li><a href="#IERC1155.ApprovalForAll(address,address,bool)"><code class="function-signature">ApprovalForAll(address owner, address operator, bool approved)</code></a></li><li><a href="#IERC1155.URI(string,uint256)"><code class="function-signature">URI(string value, uint256 id)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IERC1155.safeTransferFrom(address,address,uint256,uint256,bytes)"></a><code class="function-signature">safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes data)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IERC1155.safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)"></a><code class="function-signature">safeBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IERC1155.setApprovalForAll(address,bool)"></a><code class="function-signature">setApprovalForAll(address operator, bool approved)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IERC1155.isApprovedForAll(address,address)"></a><code class="function-signature">isApprovedForAll(address owner, address operator) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IERC1155.balanceOf(address,uint256)"></a><code class="function-signature">balanceOf(address owner, uint256 id) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IERC1155.totalSupply(uint256)"></a><code class="function-signature">totalSupply(uint256 id) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IERC1155.balanceOfBatch(address[],uint256[])"></a><code class="function-signature">balanceOfBatch(address[] owners, uint256[] ids) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">external</span></h4>







<h4><a class="anchor" aria-hidden="true" id="IERC1155.TransferSingle(address,address,address,uint256,uint256)"></a><code class="function-signature">TransferSingle(address operator, address from, address to, uint256 id, uint256 value)</code><span class="function-visibility"></span></h4>

Either TransferSingle or TransferBatch MUST emit when tokens are transferred,
      including zero value transfers as well as minting or burning.
 Operator will always be msg.sender.
 Either event from address `0x0` signifies a minting operation.
 An event to address `0x0` signifies a burning or melting operation.
 The total value transferred from address 0x0 minus the total value transferred to 0x0 may
 be used by clients and exchanges to be added to the &quot;circulating supply&quot; for a given token ID.
 To define a token ID with no initial balance, the contract SHOULD emit the TransferSingle event
 from `0x0` to `0x0`, with the token creator as `_operator`.



<h4><a class="anchor" aria-hidden="true" id="IERC1155.TransferBatch(address,address,address,uint256[],uint256[])"></a><code class="function-signature">TransferBatch(address operator, address from, address to, uint256[] ids, uint256[] values)</code><span class="function-visibility"></span></h4>

Either TransferSingle or TransferBatch MUST emit when tokens are transferred,
      including zero value transfers as well as minting or burning.
Operator will always be msg.sender.
 Either event from address `0x0` signifies a minting operation.
 An event to address `0x0` signifies a burning or melting operation.
 The total value transferred from address 0x0 minus the total value transferred to 0x0 may
 be used by clients and exchanges to be added to the &quot;circulating supply&quot; for a given token ID.
 To define multiple token IDs with no initial balance, this SHOULD emit the TransferBatch event
 from `0x0` to `0x0`, with the token creator as `_operator`.



<h4><a class="anchor" aria-hidden="true" id="IERC1155.ApprovalForAll(address,address,bool)"></a><code class="function-signature">ApprovalForAll(address owner, address operator, bool approved)</code><span class="function-visibility"></span></h4>

MUST emit when an approval is updated.



<h4><a class="anchor" aria-hidden="true" id="IERC1155.URI(string,uint256)"></a><code class="function-signature">URI(string value, uint256 id)</code><span class="function-visibility"></span></h4>

MUST emit when the URI is updated for a token ID.
 URIs are defined in RFC 3986.
 The URI MUST point a JSON file that conforms to the &quot;ERC-1155 Metadata JSON Schema&quot;.



### `IERC1155Receiver`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IERC1155Receiver.onERC1155Received(address,address,uint256,uint256,bytes)"><code class="function-signature">onERC1155Received(address operator, address from, uint256 id, uint256 value, bytes data)</code></a></li><li><a href="#IERC1155Receiver.onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"><code class="function-signature">onERC1155BatchReceived(address operator, address from, uint256[] ids, uint256[] values, bytes data)</code></a></li><li class="inherited"><a href="matic#IERC165.supportsInterface(bytes4)"><code class="function-signature">supportsInterface(bytes4 interfaceId)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IERC1155Receiver.onERC1155Received(address,address,uint256,uint256,bytes)"></a><code class="function-signature">onERC1155Received(address operator, address from, uint256 id, uint256 value, bytes data) <span class="return-arrow">→</span> <span class="return-type">bytes4</span></code><span class="function-visibility">external</span></h4>

Handles the receipt of a single ERC1155 token type. This function is
called at the end of a `safeTransferFrom` after the balance has been updated.
To accept the transfer, this must return
`bytes4(keccak256(&quot;onERC1155Received(address,address,uint256,uint256,bytes)&quot;))`
(i.e. 0xf23a6e61, or its own function selector).




<h4><a class="anchor" aria-hidden="true" id="IERC1155Receiver.onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"></a><code class="function-signature">onERC1155BatchReceived(address operator, address from, uint256[] ids, uint256[] values, bytes data) <span class="return-arrow">→</span> <span class="return-type">bytes4</span></code><span class="function-visibility">external</span></h4>

Handles the receipt of a multiple ERC1155 token types. This function
is called at the end of a `safeBatchTransferFrom` after the balances have
been updated. To accept the transfer(s), this must return
`bytes4(keccak256(&quot;onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)&quot;))`
(i.e. 0xbc197c81, or its own function selector).






### `IERC165`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IERC165.supportsInterface(bytes4)"><code class="function-signature">supportsInterface(bytes4 interfaceId)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IERC165.supportsInterface(bytes4)"></a><code class="function-signature">supportsInterface(bytes4 interfaceId) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>

Returns true if this contract implements the interface defined by
`interfaceId`. See the corresponding
https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
to learn more about how these ids are created.

This function call must use less than 30 000 gas.





### `IERC20`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IERC20.totalSupply()"><code class="function-signature">totalSupply()</code></a></li><li><a href="#IERC20.balanceOf(address)"><code class="function-signature">balanceOf(address owner)</code></a></li><li><a href="#IERC20.transfer(address,uint256)"><code class="function-signature">transfer(address to, uint256 amount)</code></a></li><li><a href="#IERC20.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address from, address to, uint256 amount)</code></a></li><li><a href="#IERC20.approve(address,uint256)"><code class="function-signature">approve(address spender, uint256 amount)</code></a></li><li><a href="#IERC20.allowance(address,address)"><code class="function-signature">allowance(address owner, address spender)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li><a href="#IERC20.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li><a href="#IERC20.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IERC20.totalSupply()"></a><code class="function-signature">totalSupply() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IERC20.balanceOf(address)"></a><code class="function-signature">balanceOf(address owner) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IERC20.transfer(address,uint256)"></a><code class="function-signature">transfer(address to, uint256 amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IERC20.transferFrom(address,address,uint256)"></a><code class="function-signature">transferFrom(address from, address to, uint256 amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IERC20.approve(address,uint256)"></a><code class="function-signature">approve(address spender, uint256 amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IERC20.allowance(address,address)"></a><code class="function-signature">allowance(address owner, address spender) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>







<h4><a class="anchor" aria-hidden="true" id="IERC20.Transfer(address,address,uint256)"></a><code class="function-signature">Transfer(address from, address to, uint256 value)</code><span class="function-visibility"></span></h4>





<h4><a class="anchor" aria-hidden="true" id="IERC20.Approval(address,address,uint256)"></a><code class="function-signature">Approval(address owner, address spender, uint256 value)</code><span class="function-visibility"></span></h4>





### `IErc20Predicate`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IErc20Predicate.interpretStateUpdate(bytes)"><code class="function-signature">interpretStateUpdate(bytes state)</code></a></li><li><a href="#IErc20Predicate.getAddressFromTx(bytes)"><code class="function-signature">getAddressFromTx(bytes txData)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IErc20Predicate.interpretStateUpdate(bytes)"></a><code class="function-signature">interpretStateUpdate(bytes state) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IErc20Predicate.getAddressFromTx(bytes)"></a><code class="function-signature">getAddressFromTx(bytes txData) <span class="return-arrow">→</span> <span class="return-type">address,bytes32</span></code><span class="function-visibility">public</span></h4>







### `IExchange`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IExchange.protocolFeeMultiplier()"><code class="function-signature">protocolFeeMultiplier()</code></a></li><li><a href="#IExchange.getOrderInfo(struct IExchange.Order)"><code class="function-signature">getOrderInfo(struct IExchange.Order order)</code></a></li><li><a href="#IExchange.fillOrder(struct IExchange.Order,uint256,bytes)"><code class="function-signature">fillOrder(struct IExchange.Order order, uint256 takerAssetFillAmount, bytes signature)</code></a></li><li><a href="#IExchange.isValidSignature(struct IExchange.Order,bytes32,bytes)"><code class="function-signature">isValidSignature(struct IExchange.Order order, bytes32 orderHash, bytes signature)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IExchange.protocolFeeMultiplier()"></a><code class="function-signature">protocolFeeMultiplier() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExchange.getOrderInfo(struct IExchange.Order)"></a><code class="function-signature">getOrderInfo(struct IExchange.Order order) <span class="return-arrow">→</span> <span class="return-type">struct IExchange.OrderInfo</span></code><span class="function-visibility">public</span></h4>

Gets information about an order: status, hash, and amount filled.
 @param order Order to gather information on.
 @return OrderInfo Information about the order and its state.
         See LibOrder.OrderInfo for a complete description.



<h4><a class="anchor" aria-hidden="true" id="IExchange.fillOrder(struct IExchange.Order,uint256,bytes)"></a><code class="function-signature">fillOrder(struct IExchange.Order order, uint256 takerAssetFillAmount, bytes signature) <span class="return-arrow">→</span> <span class="return-type">struct IExchange.FillResults</span></code><span class="function-visibility">public</span></h4>

Fills the input order.
 @param order Order struct containing order specifications.
 @param takerAssetFillAmount Desired amount of takerAsset to sell.
 @param signature Proof that order has been created by maker.
 @return Amounts filled and fees paid by maker and taker.



<h4><a class="anchor" aria-hidden="true" id="IExchange.isValidSignature(struct IExchange.Order,bytes32,bytes)"></a><code class="function-signature">isValidSignature(struct IExchange.Order order, bytes32 orderHash, bytes signature) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>







### `IExitCash`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IExitCash.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address _sender, address _recipient, uint256 _amount)</code></a></li><li><a href="#IExitCash.balanceOf(address)"><code class="function-signature">balanceOf(address _account)</code></a></li><li><a href="#IExitCash.setIsExecuting(bool)"><code class="function-signature">setIsExecuting(bool executing)</code></a></li><li><a href="#IExitCash.faucet(address,uint256)"><code class="function-signature">faucet(address _account, uint256 _amount)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IExitCash.transferFrom(address,address,uint256)"></a><code class="function-signature">transferFrom(address _sender, address _recipient, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitCash.balanceOf(address)"></a><code class="function-signature">balanceOf(address _account) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitCash.setIsExecuting(bool)"></a><code class="function-signature">setIsExecuting(bool executing)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitCash.faucet(address,uint256)"></a><code class="function-signature">faucet(address _account, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>







### `IExitShareToken`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IExitShareToken.initializeMarket(contract IMarket,uint256,uint256)"><code class="function-signature">initializeMarket(contract IMarket _market, uint256 _numOutcomes, uint256 _numTicks)</code></a></li><li><a href="#IExitShareToken.unsafeTransferFrom(address,address,uint256,uint256)"><code class="function-signature">unsafeTransferFrom(address _from, address _to, uint256 _id, uint256 _value)</code></a></li><li><a href="#IExitShareToken.unsafeBatchTransferFrom(address,address,uint256[],uint256[])"><code class="function-signature">unsafeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values)</code></a></li><li><a href="#IExitShareToken.claimTradingProceeds(contract IMarket,address,bytes32)"><code class="function-signature">claimTradingProceeds(contract IMarket _market, address _shareHolder, bytes32 _fingerprint)</code></a></li><li><a href="#IExitShareToken.getMarket(uint256)"><code class="function-signature">getMarket(uint256 _tokenId)</code></a></li><li><a href="#IExitShareToken.getOutcome(uint256)"><code class="function-signature">getOutcome(uint256 _tokenId)</code></a></li><li><a href="#IExitShareToken.getTokenId(contract IMarket,uint256)"><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#IExitShareToken.getTokenIds(contract IMarket,uint256[])"><code class="function-signature">getTokenIds(contract IMarket _market, uint256[] _outcomes)</code></a></li><li><a href="#IExitShareToken.buyCompleteSets(contract IMarket,address,uint256)"><code class="function-signature">buyCompleteSets(contract IMarket _market, address _account, uint256 _amount)</code></a></li><li><a href="#IExitShareToken.buyCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address)"><code class="function-signature">buyCompleteSetsForTrade(contract IMarket _market, uint256 _amount, uint256 _longOutcome, address _longRecipient, address _shortRecipient)</code></a></li><li><a href="#IExitShareToken.sellCompleteSets(contract IMarket,address,address,uint256,bytes32)"><code class="function-signature">sellCompleteSets(contract IMarket _market, address _holder, address _recipient, uint256 _amount, bytes32 _fingerprint)</code></a></li><li><a href="#IExitShareToken.sellCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address,address,address,uint256,address,bytes32)"><code class="function-signature">sellCompleteSetsForTrade(contract IMarket _market, uint256 _outcome, uint256 _amount, address _shortParticipant, address _longParticipant, address _shortRecipient, address _longRecipient, uint256 _price, address _sourceAccount, bytes32 _fingerprint)</code></a></li><li><a href="#IExitShareToken.totalSupplyForMarketOutcome(contract IMarket,uint256)"><code class="function-signature">totalSupplyForMarketOutcome(contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#IExitShareToken.balanceOfMarketOutcome(contract IMarket,uint256,address)"><code class="function-signature">balanceOfMarketOutcome(contract IMarket _market, uint256 _outcome, address _account)</code></a></li><li><a href="#IExitShareToken.lowestBalanceOfMarketOutcomes(contract IMarket,uint256[],address)"><code class="function-signature">lowestBalanceOfMarketOutcomes(contract IMarket _market, uint256[] _outcomes, address _account)</code></a></li><li><a href="#IExitShareToken.mint(address,contract IMarket,uint256,uint256)"><code class="function-signature">mint(address to, contract IMarket market, uint256 outcome, uint256 balance)</code></a></li><li><a href="#IExitShareToken.setIsExecuting(bool)"><code class="function-signature">setIsExecuting(bool executing)</code></a></li><li class="inherited"><a href="matic#IERC1155.safeTransferFrom(address,address,uint256,uint256,bytes)"><code class="function-signature">safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes data)</code></a></li><li class="inherited"><a href="matic#IERC1155.safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)"><code class="function-signature">safeBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data)</code></a></li><li class="inherited"><a href="matic#IERC1155.setApprovalForAll(address,bool)"><code class="function-signature">setApprovalForAll(address operator, bool approved)</code></a></li><li class="inherited"><a href="matic#IERC1155.isApprovedForAll(address,address)"><code class="function-signature">isApprovedForAll(address owner, address operator)</code></a></li><li class="inherited"><a href="matic#IERC1155.balanceOf(address,uint256)"><code class="function-signature">balanceOf(address owner, uint256 id)</code></a></li><li class="inherited"><a href="matic#IERC1155.totalSupply(uint256)"><code class="function-signature">totalSupply(uint256 id)</code></a></li><li class="inherited"><a href="matic#IERC1155.balanceOfBatch(address[],uint256[])"><code class="function-signature">balanceOfBatch(address[] owners, uint256[] ids)</code></a></li><li class="inherited"><a href="matic#ITyped.getTypeName()"><code class="function-signature">getTypeName()</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="matic#IERC1155.TransferSingle(address,address,address,uint256,uint256)"><code class="function-signature">TransferSingle(address operator, address from, address to, uint256 id, uint256 value)</code></a></li><li class="inherited"><a href="matic#IERC1155.TransferBatch(address,address,address,uint256[],uint256[])"><code class="function-signature">TransferBatch(address operator, address from, address to, uint256[] ids, uint256[] values)</code></a></li><li class="inherited"><a href="matic#IERC1155.ApprovalForAll(address,address,bool)"><code class="function-signature">ApprovalForAll(address owner, address operator, bool approved)</code></a></li><li class="inherited"><a href="matic#IERC1155.URI(string,uint256)"><code class="function-signature">URI(string value, uint256 id)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.initializeMarket(contract IMarket,uint256,uint256)"></a><code class="function-signature">initializeMarket(contract IMarket _market, uint256 _numOutcomes, uint256 _numTicks)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.unsafeTransferFrom(address,address,uint256,uint256)"></a><code class="function-signature">unsafeTransferFrom(address _from, address _to, uint256 _id, uint256 _value)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.unsafeBatchTransferFrom(address,address,uint256[],uint256[])"></a><code class="function-signature">unsafeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.claimTradingProceeds(contract IMarket,address,bytes32)"></a><code class="function-signature">claimTradingProceeds(contract IMarket _market, address _shareHolder, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.getMarket(uint256)"></a><code class="function-signature">getMarket(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.getOutcome(uint256)"></a><code class="function-signature">getOutcome(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.getTokenId(contract IMarket,uint256)"></a><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.getTokenIds(contract IMarket,uint256[])"></a><code class="function-signature">getTokenIds(contract IMarket _market, uint256[] _outcomes) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.buyCompleteSets(contract IMarket,address,uint256)"></a><code class="function-signature">buyCompleteSets(contract IMarket _market, address _account, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.buyCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address)"></a><code class="function-signature">buyCompleteSetsForTrade(contract IMarket _market, uint256 _amount, uint256 _longOutcome, address _longRecipient, address _shortRecipient) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.sellCompleteSets(contract IMarket,address,address,uint256,bytes32)"></a><code class="function-signature">sellCompleteSets(contract IMarket _market, address _holder, address _recipient, uint256 _amount, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.sellCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address,address,address,uint256,address,bytes32)"></a><code class="function-signature">sellCompleteSetsForTrade(contract IMarket _market, uint256 _outcome, uint256 _amount, address _shortParticipant, address _longParticipant, address _shortRecipient, address _longRecipient, uint256 _price, address _sourceAccount, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.totalSupplyForMarketOutcome(contract IMarket,uint256)"></a><code class="function-signature">totalSupplyForMarketOutcome(contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.balanceOfMarketOutcome(contract IMarket,uint256,address)"></a><code class="function-signature">balanceOfMarketOutcome(contract IMarket _market, uint256 _outcome, address _account) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.lowestBalanceOfMarketOutcomes(contract IMarket,uint256[],address)"></a><code class="function-signature">lowestBalanceOfMarketOutcomes(contract IMarket _market, uint256[] _outcomes, address _account) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.mint(address,contract IMarket,uint256,uint256)"></a><code class="function-signature">mint(address to, contract IMarket market, uint256 outcome, uint256 balance)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitShareToken.setIsExecuting(bool)"></a><code class="function-signature">setIsExecuting(bool executing)</code><span class="function-visibility">public</span></h4>







### `IExitZeroXTrade`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IExitZeroXTrade.trade(uint256,bytes32,bytes32,uint256,uint256,struct IExchange.Order[],bytes[],address)"><code class="function-signature">trade(uint256 _requestedFillAmount, bytes32 _fingerprint, bytes32 _tradeGroupId, uint256 _maxProtocolFeeDai, uint256 _maxTrades, struct IExchange.Order[] _orders, bytes[] _signatures, address _taker)</code></a></li><li><a href="#IExitZeroXTrade.getExchange()"><code class="function-signature">getExchange()</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IExitZeroXTrade.trade(uint256,bytes32,bytes32,uint256,uint256,struct IExchange.Order[],bytes[],address)"></a><code class="function-signature">trade(uint256 _requestedFillAmount, bytes32 _fingerprint, bytes32 _tradeGroupId, uint256 _maxProtocolFeeDai, uint256 _maxTrades, struct IExchange.Order[] _orders, bytes[] _signatures, address _taker) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IExitZeroXTrade.getExchange()"></a><code class="function-signature">getExchange() <span class="return-arrow">→</span> <span class="return-type">contract IExchange</span></code><span class="function-visibility">external</span></h4>







### `IFeePot`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IFeePot.depositFees(uint256)"><code class="function-signature">depositFees(uint256 _amount)</code></a></li><li><a href="#IFeePot.withdrawableFeesOf(address)"><code class="function-signature">withdrawableFeesOf(address _owner)</code></a></li><li><a href="#IFeePot.redeem()"><code class="function-signature">redeem()</code></a></li><li><a href="#IFeePot.cash()"><code class="function-signature">cash()</code></a></li><li class="inherited"><a href="#IERC20.totalSupply()"><code class="function-signature">totalSupply()</code></a></li><li class="inherited"><a href="#IERC20.balanceOf(address)"><code class="function-signature">balanceOf(address owner)</code></a></li><li class="inherited"><a href="#IERC20.transfer(address,uint256)"><code class="function-signature">transfer(address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address from, address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.approve(address,uint256)"><code class="function-signature">approve(address spender, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.allowance(address,address)"><code class="function-signature">allowance(address owner, address spender)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC20.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li class="inherited"><a href="#IERC20.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IFeePot.depositFees(uint256)"></a><code class="function-signature">depositFees(uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IFeePot.withdrawableFeesOf(address)"></a><code class="function-signature">withdrawableFeesOf(address _owner) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IFeePot.redeem()"></a><code class="function-signature">redeem() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IFeePot.cash()"></a><code class="function-signature">cash() <span class="return-arrow">→</span> <span class="return-type">contract ICash</span></code><span class="function-visibility">external</span></h4>







### `IInitialReporter`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IInitialReporter.initialize(contract IAugur,contract IMarket,address)"><code class="function-signature">initialize(contract IAugur _augur, contract IMarket _market, address _designatedReporter)</code></a></li><li><a href="#IInitialReporter.report(address,bytes32,uint256[],uint256)"><code class="function-signature">report(address _reporter, bytes32 _payoutDistributionHash, uint256[] _payoutNumerators, uint256 _initialReportStake)</code></a></li><li><a href="#IInitialReporter.designatedReporterShowed()"><code class="function-signature">designatedReporterShowed()</code></a></li><li><a href="#IInitialReporter.initialReporterWasCorrect()"><code class="function-signature">initialReporterWasCorrect()</code></a></li><li><a href="#IInitialReporter.getDesignatedReporter()"><code class="function-signature">getDesignatedReporter()</code></a></li><li><a href="#IInitialReporter.getReportTimestamp()"><code class="function-signature">getReportTimestamp()</code></a></li><li><a href="#IInitialReporter.migrateToNewUniverse(address)"><code class="function-signature">migrateToNewUniverse(address _designatedReporter)</code></a></li><li><a href="#IInitialReporter.returnRepFromDisavow()"><code class="function-signature">returnRepFromDisavow()</code></a></li><li class="inherited"><a href="#IOwnable.getOwner()"><code class="function-signature">getOwner()</code></a></li><li class="inherited"><a href="#IOwnable.transferOwnership(address)"><code class="function-signature">transferOwnership(address _newOwner)</code></a></li><li class="inherited"><a href="matic#IReportingParticipant.getStake()"><code class="function-signature">getStake()</code></a></li><li class="inherited"><a href="matic#IReportingParticipant.getPayoutDistributionHash()"><code class="function-signature">getPayoutDistributionHash()</code></a></li><li class="inherited"><a href="matic#IReportingParticipant.liquidateLosing()"><code class="function-signature">liquidateLosing()</code></a></li><li class="inherited"><a href="matic#IReportingParticipant.redeem(address)"><code class="function-signature">redeem(address _redeemer)</code></a></li><li class="inherited"><a href="matic#IReportingParticipant.isDisavowed()"><code class="function-signature">isDisavowed()</code></a></li><li class="inherited"><a href="matic#IReportingParticipant.getPayoutNumerator(uint256)"><code class="function-signature">getPayoutNumerator(uint256 _outcome)</code></a></li><li class="inherited"><a href="matic#IReportingParticipant.getPayoutNumerators()"><code class="function-signature">getPayoutNumerators()</code></a></li><li class="inherited"><a href="matic#IReportingParticipant.getMarket()"><code class="function-signature">getMarket()</code></a></li><li class="inherited"><a href="matic#IReportingParticipant.getSize()"><code class="function-signature">getSize()</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IInitialReporter.initialize(contract IAugur,contract IMarket,address)"></a><code class="function-signature">initialize(contract IAugur _augur, contract IMarket _market, address _designatedReporter)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IInitialReporter.report(address,bytes32,uint256[],uint256)"></a><code class="function-signature">report(address _reporter, bytes32 _payoutDistributionHash, uint256[] _payoutNumerators, uint256 _initialReportStake)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IInitialReporter.designatedReporterShowed()"></a><code class="function-signature">designatedReporterShowed() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IInitialReporter.initialReporterWasCorrect()"></a><code class="function-signature">initialReporterWasCorrect() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IInitialReporter.getDesignatedReporter()"></a><code class="function-signature">getDesignatedReporter() <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IInitialReporter.getReportTimestamp()"></a><code class="function-signature">getReportTimestamp() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IInitialReporter.migrateToNewUniverse(address)"></a><code class="function-signature">migrateToNewUniverse(address _designatedReporter)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IInitialReporter.returnRepFromDisavow()"></a><code class="function-signature">returnRepFromDisavow()</code><span class="function-visibility">public</span></h4>







### `IMarket`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IMarket.initialize(contract IAugur,contract IUniverse,uint256,uint256,contract IAffiliateValidator,uint256,address,address,uint256,uint256)"><code class="function-signature">initialize(contract IAugur _augur, contract IUniverse _universe, uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, address _creator, uint256 _numOutcomes, uint256 _numTicks)</code></a></li><li><a href="#IMarket.derivePayoutDistributionHash(uint256[])"><code class="function-signature">derivePayoutDistributionHash(uint256[] _payoutNumerators)</code></a></li><li><a href="#IMarket.doInitialReport(uint256[],string,uint256)"><code class="function-signature">doInitialReport(uint256[] _payoutNumerators, string _description, uint256 _additionalStake)</code></a></li><li><a href="#IMarket.getUniverse()"><code class="function-signature">getUniverse()</code></a></li><li><a href="#IMarket.getDisputeWindow()"><code class="function-signature">getDisputeWindow()</code></a></li><li><a href="#IMarket.getNumberOfOutcomes()"><code class="function-signature">getNumberOfOutcomes()</code></a></li><li><a href="#IMarket.getNumTicks()"><code class="function-signature">getNumTicks()</code></a></li><li><a href="#IMarket.getMarketCreatorSettlementFeeDivisor()"><code class="function-signature">getMarketCreatorSettlementFeeDivisor()</code></a></li><li><a href="#IMarket.getForkingMarket()"><code class="function-signature">getForkingMarket()</code></a></li><li><a href="#IMarket.getEndTime()"><code class="function-signature">getEndTime()</code></a></li><li><a href="#IMarket.getWinningPayoutDistributionHash()"><code class="function-signature">getWinningPayoutDistributionHash()</code></a></li><li><a href="#IMarket.getWinningPayoutNumerator(uint256)"><code class="function-signature">getWinningPayoutNumerator(uint256 _outcome)</code></a></li><li><a href="#IMarket.getWinningReportingParticipant()"><code class="function-signature">getWinningReportingParticipant()</code></a></li><li><a href="#IMarket.getReputationToken()"><code class="function-signature">getReputationToken()</code></a></li><li><a href="#IMarket.getFinalizationTime()"><code class="function-signature">getFinalizationTime()</code></a></li><li><a href="#IMarket.getInitialReporter()"><code class="function-signature">getInitialReporter()</code></a></li><li><a href="#IMarket.getDesignatedReportingEndTime()"><code class="function-signature">getDesignatedReportingEndTime()</code></a></li><li><a href="#IMarket.getValidityBondAttoCash()"><code class="function-signature">getValidityBondAttoCash()</code></a></li><li><a href="#IMarket.affiliateFeeDivisor()"><code class="function-signature">affiliateFeeDivisor()</code></a></li><li><a href="#IMarket.getNumParticipants()"><code class="function-signature">getNumParticipants()</code></a></li><li><a href="#IMarket.getDisputePacingOn()"><code class="function-signature">getDisputePacingOn()</code></a></li><li><a href="#IMarket.deriveMarketCreatorFeeAmount(uint256)"><code class="function-signature">deriveMarketCreatorFeeAmount(uint256 _amount)</code></a></li><li><a href="#IMarket.recordMarketCreatorFees(uint256,address,bytes32)"><code class="function-signature">recordMarketCreatorFees(uint256 _marketCreatorFees, address _sourceAccount, bytes32 _fingerprint)</code></a></li><li><a href="#IMarket.isContainerForReportingParticipant(contract IReportingParticipant)"><code class="function-signature">isContainerForReportingParticipant(contract IReportingParticipant _reportingParticipant)</code></a></li><li><a href="#IMarket.isFinalizedAsInvalid()"><code class="function-signature">isFinalizedAsInvalid()</code></a></li><li><a href="#IMarket.finalize()"><code class="function-signature">finalize()</code></a></li><li><a href="#IMarket.isFinalized()"><code class="function-signature">isFinalized()</code></a></li><li><a href="#IMarket.getOpenInterest()"><code class="function-signature">getOpenInterest()</code></a></li><li class="inherited"><a href="#IOwnable.getOwner()"><code class="function-signature">getOwner()</code></a></li><li class="inherited"><a href="#IOwnable.transferOwnership(address)"><code class="function-signature">transferOwnership(address _newOwner)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IMarket.initialize(contract IAugur,contract IUniverse,uint256,uint256,contract IAffiliateValidator,uint256,address,address,uint256,uint256)"></a><code class="function-signature">initialize(contract IAugur _augur, contract IUniverse _universe, uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, address _creator, uint256 _numOutcomes, uint256 _numTicks)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.derivePayoutDistributionHash(uint256[])"></a><code class="function-signature">derivePayoutDistributionHash(uint256[] _payoutNumerators) <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.doInitialReport(uint256[],string,uint256)"></a><code class="function-signature">doInitialReport(uint256[] _payoutNumerators, string _description, uint256 _additionalStake) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getUniverse()"></a><code class="function-signature">getUniverse() <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getDisputeWindow()"></a><code class="function-signature">getDisputeWindow() <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getNumberOfOutcomes()"></a><code class="function-signature">getNumberOfOutcomes() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getNumTicks()"></a><code class="function-signature">getNumTicks() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getMarketCreatorSettlementFeeDivisor()"></a><code class="function-signature">getMarketCreatorSettlementFeeDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getForkingMarket()"></a><code class="function-signature">getForkingMarket() <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getEndTime()"></a><code class="function-signature">getEndTime() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getWinningPayoutDistributionHash()"></a><code class="function-signature">getWinningPayoutDistributionHash() <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getWinningPayoutNumerator(uint256)"></a><code class="function-signature">getWinningPayoutNumerator(uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getWinningReportingParticipant()"></a><code class="function-signature">getWinningReportingParticipant() <span class="return-arrow">→</span> <span class="return-type">contract IReportingParticipant</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getReputationToken()"></a><code class="function-signature">getReputationToken() <span class="return-arrow">→</span> <span class="return-type">contract IV2ReputationToken</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getFinalizationTime()"></a><code class="function-signature">getFinalizationTime() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getInitialReporter()"></a><code class="function-signature">getInitialReporter() <span class="return-arrow">→</span> <span class="return-type">contract IInitialReporter</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getDesignatedReportingEndTime()"></a><code class="function-signature">getDesignatedReportingEndTime() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getValidityBondAttoCash()"></a><code class="function-signature">getValidityBondAttoCash() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.affiliateFeeDivisor()"></a><code class="function-signature">affiliateFeeDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getNumParticipants()"></a><code class="function-signature">getNumParticipants() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getDisputePacingOn()"></a><code class="function-signature">getDisputePacingOn() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.deriveMarketCreatorFeeAmount(uint256)"></a><code class="function-signature">deriveMarketCreatorFeeAmount(uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.recordMarketCreatorFees(uint256,address,bytes32)"></a><code class="function-signature">recordMarketCreatorFees(uint256 _marketCreatorFees, address _sourceAccount, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.isContainerForReportingParticipant(contract IReportingParticipant)"></a><code class="function-signature">isContainerForReportingParticipant(contract IReportingParticipant _reportingParticipant) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.isFinalizedAsInvalid()"></a><code class="function-signature">isFinalizedAsInvalid() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.finalize()"></a><code class="function-signature">finalize() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.isFinalized()"></a><code class="function-signature">isFinalized() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IMarket.getOpenInterest()"></a><code class="function-signature">getOpenInterest() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>







### `IOINexus`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IOINexus.getAttoCashPerRep(address,address)"><code class="function-signature">getAttoCashPerRep(address _cash, address _reputationToken)</code></a></li><li><a href="#IOINexus.universeReportingFeeDivisor(address)"><code class="function-signature">universeReportingFeeDivisor(address _universe)</code></a></li><li><a href="#IOINexus.addParaAugur(address)"><code class="function-signature">addParaAugur(address _paraAugur)</code></a></li><li><a href="#IOINexus.registerParaUniverse(contract IUniverse,contract IParaUniverse)"><code class="function-signature">registerParaUniverse(contract IUniverse _universe, contract IParaUniverse _paraUniverse)</code></a></li><li><a href="#IOINexus.recordParaUniverseValuesAndUpdateReportingFee(contract IUniverse,uint256,uint256)"><code class="function-signature">recordParaUniverseValuesAndUpdateReportingFee(contract IUniverse _universe, uint256 _targetRepMarketCapInAttoCash, uint256 _repMarketCapInAttoCash)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IOINexus.getAttoCashPerRep(address,address)"></a><code class="function-signature">getAttoCashPerRep(address _cash, address _reputationToken) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOINexus.universeReportingFeeDivisor(address)"></a><code class="function-signature">universeReportingFeeDivisor(address _universe) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOINexus.addParaAugur(address)"></a><code class="function-signature">addParaAugur(address _paraAugur) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOINexus.registerParaUniverse(contract IUniverse,contract IParaUniverse)"></a><code class="function-signature">registerParaUniverse(contract IUniverse _universe, contract IParaUniverse _paraUniverse)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOINexus.recordParaUniverseValuesAndUpdateReportingFee(contract IUniverse,uint256,uint256)"></a><code class="function-signature">recordParaUniverseValuesAndUpdateReportingFee(contract IUniverse _universe, uint256 _targetRepMarketCapInAttoCash, uint256 _repMarketCapInAttoCash) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>







### `IOrders`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IOrders.saveOrder(uint256[],bytes32[],enum Order.Types,contract IMarket,address)"><code class="function-signature">saveOrder(uint256[] _uints, bytes32[] _bytes32s, enum Order.Types _type, contract IMarket _market, address _sender)</code></a></li><li><a href="#IOrders.removeOrder(bytes32)"><code class="function-signature">removeOrder(bytes32 _orderId)</code></a></li><li><a href="#IOrders.getMarket(bytes32)"><code class="function-signature">getMarket(bytes32 _orderId)</code></a></li><li><a href="#IOrders.getOrderType(bytes32)"><code class="function-signature">getOrderType(bytes32 _orderId)</code></a></li><li><a href="#IOrders.getOutcome(bytes32)"><code class="function-signature">getOutcome(bytes32 _orderId)</code></a></li><li><a href="#IOrders.getAmount(bytes32)"><code class="function-signature">getAmount(bytes32 _orderId)</code></a></li><li><a href="#IOrders.getPrice(bytes32)"><code class="function-signature">getPrice(bytes32 _orderId)</code></a></li><li><a href="#IOrders.getOrderCreator(bytes32)"><code class="function-signature">getOrderCreator(bytes32 _orderId)</code></a></li><li><a href="#IOrders.getOrderSharesEscrowed(bytes32)"><code class="function-signature">getOrderSharesEscrowed(bytes32 _orderId)</code></a></li><li><a href="#IOrders.getOrderMoneyEscrowed(bytes32)"><code class="function-signature">getOrderMoneyEscrowed(bytes32 _orderId)</code></a></li><li><a href="#IOrders.getOrderDataForCancel(bytes32)"><code class="function-signature">getOrderDataForCancel(bytes32 _orderId)</code></a></li><li><a href="#IOrders.getOrderDataForLogs(bytes32)"><code class="function-signature">getOrderDataForLogs(bytes32 _orderId)</code></a></li><li><a href="#IOrders.getBetterOrderId(bytes32)"><code class="function-signature">getBetterOrderId(bytes32 _orderId)</code></a></li><li><a href="#IOrders.getWorseOrderId(bytes32)"><code class="function-signature">getWorseOrderId(bytes32 _orderId)</code></a></li><li><a href="#IOrders.getBestOrderId(enum Order.Types,contract IMarket,uint256)"><code class="function-signature">getBestOrderId(enum Order.Types _type, contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#IOrders.getWorstOrderId(enum Order.Types,contract IMarket,uint256)"><code class="function-signature">getWorstOrderId(enum Order.Types _type, contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#IOrders.getLastOutcomePrice(contract IMarket,uint256)"><code class="function-signature">getLastOutcomePrice(contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#IOrders.getOrderId(enum Order.Types,contract IMarket,uint256,uint256,address,uint256,uint256,uint256,uint256)"><code class="function-signature">getOrderId(enum Order.Types _type, contract IMarket _market, uint256 _amount, uint256 _price, address _sender, uint256 _blockNumber, uint256 _outcome, uint256 _moneyEscrowed, uint256 _sharesEscrowed)</code></a></li><li><a href="#IOrders.getTotalEscrowed(contract IMarket)"><code class="function-signature">getTotalEscrowed(contract IMarket _market)</code></a></li><li><a href="#IOrders.isBetterPrice(enum Order.Types,uint256,bytes32)"><code class="function-signature">isBetterPrice(enum Order.Types _type, uint256 _price, bytes32 _orderId)</code></a></li><li><a href="#IOrders.isWorsePrice(enum Order.Types,uint256,bytes32)"><code class="function-signature">isWorsePrice(enum Order.Types _type, uint256 _price, bytes32 _orderId)</code></a></li><li><a href="#IOrders.assertIsNotBetterPrice(enum Order.Types,uint256,bytes32)"><code class="function-signature">assertIsNotBetterPrice(enum Order.Types _type, uint256 _price, bytes32 _betterOrderId)</code></a></li><li><a href="#IOrders.assertIsNotWorsePrice(enum Order.Types,uint256,bytes32)"><code class="function-signature">assertIsNotWorsePrice(enum Order.Types _type, uint256 _price, bytes32 _worseOrderId)</code></a></li><li><a href="#IOrders.recordFillOrder(bytes32,uint256,uint256,uint256)"><code class="function-signature">recordFillOrder(bytes32 _orderId, uint256 _sharesFilled, uint256 _tokensFilled, uint256 _fill)</code></a></li><li><a href="#IOrders.setPrice(contract IMarket,uint256,uint256)"><code class="function-signature">setPrice(contract IMarket _market, uint256 _outcome, uint256 _price)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IOrders.saveOrder(uint256[],bytes32[],enum Order.Types,contract IMarket,address)"></a><code class="function-signature">saveOrder(uint256[] _uints, bytes32[] _bytes32s, enum Order.Types _type, contract IMarket _market, address _sender) <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.removeOrder(bytes32)"></a><code class="function-signature">removeOrder(bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getMarket(bytes32)"></a><code class="function-signature">getMarket(bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getOrderType(bytes32)"></a><code class="function-signature">getOrderType(bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">enum Order.Types</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getOutcome(bytes32)"></a><code class="function-signature">getOutcome(bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getAmount(bytes32)"></a><code class="function-signature">getAmount(bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getPrice(bytes32)"></a><code class="function-signature">getPrice(bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getOrderCreator(bytes32)"></a><code class="function-signature">getOrderCreator(bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getOrderSharesEscrowed(bytes32)"></a><code class="function-signature">getOrderSharesEscrowed(bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getOrderMoneyEscrowed(bytes32)"></a><code class="function-signature">getOrderMoneyEscrowed(bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getOrderDataForCancel(bytes32)"></a><code class="function-signature">getOrderDataForCancel(bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256,enum Order.Types,contract IMarket,uint256,address</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getOrderDataForLogs(bytes32)"></a><code class="function-signature">getOrderDataForLogs(bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">enum Order.Types,address[],uint256[]</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getBetterOrderId(bytes32)"></a><code class="function-signature">getBetterOrderId(bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getWorseOrderId(bytes32)"></a><code class="function-signature">getWorseOrderId(bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getBestOrderId(enum Order.Types,contract IMarket,uint256)"></a><code class="function-signature">getBestOrderId(enum Order.Types _type, contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getWorstOrderId(enum Order.Types,contract IMarket,uint256)"></a><code class="function-signature">getWorstOrderId(enum Order.Types _type, contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getLastOutcomePrice(contract IMarket,uint256)"></a><code class="function-signature">getLastOutcomePrice(contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getOrderId(enum Order.Types,contract IMarket,uint256,uint256,address,uint256,uint256,uint256,uint256)"></a><code class="function-signature">getOrderId(enum Order.Types _type, contract IMarket _market, uint256 _amount, uint256 _price, address _sender, uint256 _blockNumber, uint256 _outcome, uint256 _moneyEscrowed, uint256 _sharesEscrowed) <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.getTotalEscrowed(contract IMarket)"></a><code class="function-signature">getTotalEscrowed(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.isBetterPrice(enum Order.Types,uint256,bytes32)"></a><code class="function-signature">isBetterPrice(enum Order.Types _type, uint256 _price, bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.isWorsePrice(enum Order.Types,uint256,bytes32)"></a><code class="function-signature">isWorsePrice(enum Order.Types _type, uint256 _price, bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.assertIsNotBetterPrice(enum Order.Types,uint256,bytes32)"></a><code class="function-signature">assertIsNotBetterPrice(enum Order.Types _type, uint256 _price, bytes32 _betterOrderId) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.assertIsNotWorsePrice(enum Order.Types,uint256,bytes32)"></a><code class="function-signature">assertIsNotWorsePrice(enum Order.Types _type, uint256 _price, bytes32 _worseOrderId) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.recordFillOrder(bytes32,uint256,uint256,uint256)"></a><code class="function-signature">recordFillOrder(bytes32 _orderId, uint256 _sharesFilled, uint256 _tokensFilled, uint256 _fill) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOrders.setPrice(contract IMarket,uint256,uint256)"></a><code class="function-signature">setPrice(contract IMarket _market, uint256 _outcome, uint256 _price) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>







### `IOwnable`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IOwnable.getOwner()"><code class="function-signature">getOwner()</code></a></li><li><a href="#IOwnable.transferOwnership(address)"><code class="function-signature">transferOwnership(address _newOwner)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IOwnable.getOwner()"></a><code class="function-signature">getOwner() <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IOwnable.transferOwnership(address)"></a><code class="function-signature">transferOwnership(address _newOwner) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>







### `IParaAugur`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IParaAugur.generateParaUniverse(contract IUniverse)"><code class="function-signature">generateParaUniverse(contract IUniverse _universe)</code></a></li><li><a href="#IParaAugur.registerContract(bytes32,address)"><code class="function-signature">registerContract(bytes32 _key, address _address)</code></a></li><li><a href="#IParaAugur.lookup(bytes32)"><code class="function-signature">lookup(bytes32 _key)</code></a></li><li><a href="#IParaAugur.isKnownUniverse(contract IUniverse)"><code class="function-signature">isKnownUniverse(contract IUniverse _universe)</code></a></li><li><a href="#IParaAugur.trustedCashTransfer(address,address,uint256)"><code class="function-signature">trustedCashTransfer(address _from, address _to, uint256 _amount)</code></a></li><li><a href="#IParaAugur.isKnownMarket(contract IMarket)"><code class="function-signature">isKnownMarket(contract IMarket _market)</code></a></li><li><a href="#IParaAugur.logCompleteSetsPurchased(contract IUniverse,contract IMarket,address,uint256)"><code class="function-signature">logCompleteSetsPurchased(contract IUniverse _universe, contract IMarket _market, address _account, uint256 _numCompleteSets)</code></a></li><li><a href="#IParaAugur.logCompleteSetsSold(contract IUniverse,contract IMarket,address,uint256,uint256)"><code class="function-signature">logCompleteSetsSold(contract IUniverse _universe, contract IMarket _market, address _account, uint256 _numCompleteSets, uint256 _fees)</code></a></li><li><a href="#IParaAugur.logMarketOIChanged(contract IUniverse,contract IMarket)"><code class="function-signature">logMarketOIChanged(contract IUniverse _universe, contract IMarket _market)</code></a></li><li><a href="#IParaAugur.logTradingProceedsClaimed(contract IUniverse,address,address,uint256,uint256,uint256,uint256)"><code class="function-signature">logTradingProceedsClaimed(contract IUniverse _universe, address _sender, address _market, uint256 _outcome, uint256 _numShares, uint256 _numPayoutTokens, uint256 _fees)</code></a></li><li><a href="#IParaAugur.logShareTokensBalanceChanged(address,contract IMarket,uint256,uint256)"><code class="function-signature">logShareTokensBalanceChanged(address _account, contract IMarket _market, uint256 _outcome, uint256 _balance)</code></a></li><li><a href="#IParaAugur.logReportingFeeChanged(uint256)"><code class="function-signature">logReportingFeeChanged(uint256 _reportingFee)</code></a></li><li><a href="#IParaAugur.getTimestamp()"><code class="function-signature">getTimestamp()</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IParaAugur.generateParaUniverse(contract IUniverse)"></a><code class="function-signature">generateParaUniverse(contract IUniverse _universe) <span class="return-arrow">→</span> <span class="return-type">contract IParaUniverse</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaAugur.registerContract(bytes32,address)"></a><code class="function-signature">registerContract(bytes32 _key, address _address) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaAugur.lookup(bytes32)"></a><code class="function-signature">lookup(bytes32 _key) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaAugur.isKnownUniverse(contract IUniverse)"></a><code class="function-signature">isKnownUniverse(contract IUniverse _universe) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaAugur.trustedCashTransfer(address,address,uint256)"></a><code class="function-signature">trustedCashTransfer(address _from, address _to, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaAugur.isKnownMarket(contract IMarket)"></a><code class="function-signature">isKnownMarket(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaAugur.logCompleteSetsPurchased(contract IUniverse,contract IMarket,address,uint256)"></a><code class="function-signature">logCompleteSetsPurchased(contract IUniverse _universe, contract IMarket _market, address _account, uint256 _numCompleteSets) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaAugur.logCompleteSetsSold(contract IUniverse,contract IMarket,address,uint256,uint256)"></a><code class="function-signature">logCompleteSetsSold(contract IUniverse _universe, contract IMarket _market, address _account, uint256 _numCompleteSets, uint256 _fees) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaAugur.logMarketOIChanged(contract IUniverse,contract IMarket)"></a><code class="function-signature">logMarketOIChanged(contract IUniverse _universe, contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaAugur.logTradingProceedsClaimed(contract IUniverse,address,address,uint256,uint256,uint256,uint256)"></a><code class="function-signature">logTradingProceedsClaimed(contract IUniverse _universe, address _sender, address _market, uint256 _outcome, uint256 _numShares, uint256 _numPayoutTokens, uint256 _fees) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaAugur.logShareTokensBalanceChanged(address,contract IMarket,uint256,uint256)"></a><code class="function-signature">logShareTokensBalanceChanged(address _account, contract IMarket _market, uint256 _outcome, uint256 _balance) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaAugur.logReportingFeeChanged(uint256)"></a><code class="function-signature">logReportingFeeChanged(uint256 _reportingFee) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaAugur.getTimestamp()"></a><code class="function-signature">getTimestamp() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>







### `IParaOICash`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IParaOICash.initialize(contract IParaAugur,contract IParaUniverse)"><code class="function-signature">initialize(contract IParaAugur _augur, contract IParaUniverse _universe)</code></a></li><li><a href="#IParaOICash.approveFeePot()"><code class="function-signature">approveFeePot()</code></a></li><li><a href="#IParaOICash.deposit(uint256)"><code class="function-signature">deposit(uint256 _amount)</code></a></li><li><a href="#IParaOICash.withdraw(uint256)"><code class="function-signature">withdraw(uint256 _amount)</code></a></li><li><a href="#IParaOICash.buyCompleteSets(contract IMarket,uint256)"><code class="function-signature">buyCompleteSets(contract IMarket _market, uint256 _amount)</code></a></li><li class="inherited"><a href="#IERC20.totalSupply()"><code class="function-signature">totalSupply()</code></a></li><li class="inherited"><a href="#IERC20.balanceOf(address)"><code class="function-signature">balanceOf(address owner)</code></a></li><li class="inherited"><a href="#IERC20.transfer(address,uint256)"><code class="function-signature">transfer(address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address from, address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.approve(address,uint256)"><code class="function-signature">approve(address spender, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.allowance(address,address)"><code class="function-signature">allowance(address owner, address spender)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC20.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li class="inherited"><a href="#IERC20.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IParaOICash.initialize(contract IParaAugur,contract IParaUniverse)"></a><code class="function-signature">initialize(contract IParaAugur _augur, contract IParaUniverse _universe)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaOICash.approveFeePot()"></a><code class="function-signature">approveFeePot()</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaOICash.deposit(uint256)"></a><code class="function-signature">deposit(uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaOICash.withdraw(uint256)"></a><code class="function-signature">withdraw(uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaOICash.buyCompleteSets(contract IMarket,uint256)"></a><code class="function-signature">buyCompleteSets(contract IMarket _market, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>







### `IParaShareToken`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IParaShareToken.cash()"><code class="function-signature">cash()</code></a></li><li><a href="#IParaShareToken.augur()"><code class="function-signature">augur()</code></a></li><li><a href="#IParaShareToken.initialize(address,address)"><code class="function-signature">initialize(address _augur, address _originalShareToken)</code></a></li><li><a href="#IParaShareToken.approveUniverse(contract IParaUniverse)"><code class="function-signature">approveUniverse(contract IParaUniverse _paraUniverse)</code></a></li><li><a href="#IParaShareToken.buyCompleteSets(contract IMarket,address,uint256)"><code class="function-signature">buyCompleteSets(contract IMarket _market, address _account, uint256 _amount)</code></a></li><li><a href="#IParaShareToken.publicSellCompleteSets(contract IMarket,uint256)"><code class="function-signature">publicSellCompleteSets(contract IMarket _market, uint256 _amount)</code></a></li><li><a href="#IParaShareToken.publicBuyCompleteSets(contract IMarket,uint256)"><code class="function-signature">publicBuyCompleteSets(contract IMarket _market, uint256 _amount)</code></a></li><li><a href="#IParaShareToken.getTokenId(contract IMarket,uint256)"><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#IParaShareToken.unsafeTransferFrom(address,address,uint256,uint256)"><code class="function-signature">unsafeTransferFrom(address _from, address _to, uint256 _id, uint256 _value)</code></a></li><li><a href="#IParaShareToken.balanceOf(address,uint256)"><code class="function-signature">balanceOf(address owner, uint256 id)</code></a></li><li><a href="#IParaShareToken.balanceOfBatch(address[],uint256[])"><code class="function-signature">balanceOfBatch(address[] owners, uint256[] ids)</code></a></li><li><a href="#IParaShareToken.unsafeBatchTransferFrom(address,address,uint256[],uint256[])"><code class="function-signature">unsafeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IParaShareToken.cash()"></a><code class="function-signature">cash() <span class="return-arrow">→</span> <span class="return-type">contract ICash</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaShareToken.augur()"></a><code class="function-signature">augur() <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaShareToken.initialize(address,address)"></a><code class="function-signature">initialize(address _augur, address _originalShareToken)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaShareToken.approveUniverse(contract IParaUniverse)"></a><code class="function-signature">approveUniverse(contract IParaUniverse _paraUniverse)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaShareToken.buyCompleteSets(contract IMarket,address,uint256)"></a><code class="function-signature">buyCompleteSets(contract IMarket _market, address _account, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaShareToken.publicSellCompleteSets(contract IMarket,uint256)"></a><code class="function-signature">publicSellCompleteSets(contract IMarket _market, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaShareToken.publicBuyCompleteSets(contract IMarket,uint256)"></a><code class="function-signature">publicBuyCompleteSets(contract IMarket _market, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaShareToken.getTokenId(contract IMarket,uint256)"></a><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaShareToken.unsafeTransferFrom(address,address,uint256,uint256)"></a><code class="function-signature">unsafeTransferFrom(address _from, address _to, uint256 _id, uint256 _value)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaShareToken.balanceOf(address,uint256)"></a><code class="function-signature">balanceOf(address owner, uint256 id) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaShareToken.balanceOfBatch(address[],uint256[])"></a><code class="function-signature">balanceOfBatch(address[] owners, uint256[] ids) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaShareToken.unsafeBatchTransferFrom(address,address,uint256[],uint256[])"></a><code class="function-signature">unsafeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values)</code><span class="function-visibility">external</span></h4>







### `IParaUniverse`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IParaUniverse.getFeePot()"><code class="function-signature">getFeePot()</code></a></li><li><a href="#IParaUniverse.getReputationToken()"><code class="function-signature">getReputationToken()</code></a></li><li><a href="#IParaUniverse.originUniverse()"><code class="function-signature">originUniverse()</code></a></li><li><a href="#IParaUniverse.setMarketFinalized(contract IMarket,uint256)"><code class="function-signature">setMarketFinalized(contract IMarket _market, uint256 _totalSupply)</code></a></li><li><a href="#IParaUniverse.withdraw(address,uint256,address)"><code class="function-signature">withdraw(address _recipient, uint256 _amount, address _market)</code></a></li><li><a href="#IParaUniverse.deposit(address,uint256,address)"><code class="function-signature">deposit(address _sender, uint256 _amount, address _market)</code></a></li><li><a href="#IParaUniverse.decrementOpenInterest(uint256)"><code class="function-signature">decrementOpenInterest(uint256 _amount)</code></a></li><li><a href="#IParaUniverse.incrementOpenInterest(uint256)"><code class="function-signature">incrementOpenInterest(uint256 _amount)</code></a></li><li><a href="#IParaUniverse.recordMarketCreatorFees(contract IMarket,uint256,address)"><code class="function-signature">recordMarketCreatorFees(contract IMarket _market, uint256 _marketCreatorFees, address _sourceAccount)</code></a></li><li><a href="#IParaUniverse.getMarketOpenInterest(contract IMarket)"><code class="function-signature">getMarketOpenInterest(contract IMarket _market)</code></a></li><li><a href="#IParaUniverse.getOrCacheReportingFeeDivisor()"><code class="function-signature">getOrCacheReportingFeeDivisor()</code></a></li><li><a href="#IParaUniverse.getReportingFeeDivisor()"><code class="function-signature">getReportingFeeDivisor()</code></a></li><li><a href="#IParaUniverse.setOrigin(contract IUniverse)"><code class="function-signature">setOrigin(contract IUniverse _originUniverse)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IParaUniverse.getFeePot()"></a><code class="function-signature">getFeePot() <span class="return-arrow">→</span> <span class="return-type">contract IFeePot</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaUniverse.getReputationToken()"></a><code class="function-signature">getReputationToken() <span class="return-arrow">→</span> <span class="return-type">contract IV2ReputationToken</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaUniverse.originUniverse()"></a><code class="function-signature">originUniverse() <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaUniverse.setMarketFinalized(contract IMarket,uint256)"></a><code class="function-signature">setMarketFinalized(contract IMarket _market, uint256 _totalSupply) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaUniverse.withdraw(address,uint256,address)"></a><code class="function-signature">withdraw(address _recipient, uint256 _amount, address _market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaUniverse.deposit(address,uint256,address)"></a><code class="function-signature">deposit(address _sender, uint256 _amount, address _market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaUniverse.decrementOpenInterest(uint256)"></a><code class="function-signature">decrementOpenInterest(uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaUniverse.incrementOpenInterest(uint256)"></a><code class="function-signature">incrementOpenInterest(uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaUniverse.recordMarketCreatorFees(contract IMarket,uint256,address)"></a><code class="function-signature">recordMarketCreatorFees(contract IMarket _market, uint256 _marketCreatorFees, address _sourceAccount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaUniverse.getMarketOpenInterest(contract IMarket)"></a><code class="function-signature">getMarketOpenInterest(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaUniverse.getOrCacheReportingFeeDivisor()"></a><code class="function-signature">getOrCacheReportingFeeDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaUniverse.getReportingFeeDivisor()"></a><code class="function-signature">getReportingFeeDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IParaUniverse.setOrigin(contract IUniverse)"></a><code class="function-signature">setOrigin(contract IUniverse _originUniverse)</code><span class="function-visibility">external</span></h4>







### `IProfitLoss`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IProfitLoss.initialize(contract IAugur)"><code class="function-signature">initialize(contract IAugur _augur)</code></a></li><li><a href="#IProfitLoss.recordFrozenFundChange(contract IUniverse,contract IMarket,address,uint256,int256)"><code class="function-signature">recordFrozenFundChange(contract IUniverse _universe, contract IMarket _market, address _account, uint256 _outcome, int256 _frozenFundDelta)</code></a></li><li><a href="#IProfitLoss.adjustTraderProfitForFees(contract IMarket,address,uint256,uint256)"><code class="function-signature">adjustTraderProfitForFees(contract IMarket _market, address _trader, uint256 _outcome, uint256 _fees)</code></a></li><li><a href="#IProfitLoss.recordTrade(contract IUniverse,contract IMarket,address,address,uint256,int256,int256,uint256,uint256,uint256,uint256)"><code class="function-signature">recordTrade(contract IUniverse _universe, contract IMarket _market, address _longAddress, address _shortAddress, uint256 _outcome, int256 _amount, int256 _price, uint256 _numLongTokens, uint256 _numShortTokens, uint256 _numLongShares, uint256 _numShortShares)</code></a></li><li><a href="#IProfitLoss.recordClaim(contract IMarket,address,uint256[])"><code class="function-signature">recordClaim(contract IMarket _market, address _account, uint256[] _outcomeFees)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IProfitLoss.initialize(contract IAugur)"></a><code class="function-signature">initialize(contract IAugur _augur)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IProfitLoss.recordFrozenFundChange(contract IUniverse,contract IMarket,address,uint256,int256)"></a><code class="function-signature">recordFrozenFundChange(contract IUniverse _universe, contract IMarket _market, address _account, uint256 _outcome, int256 _frozenFundDelta) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IProfitLoss.adjustTraderProfitForFees(contract IMarket,address,uint256,uint256)"></a><code class="function-signature">adjustTraderProfitForFees(contract IMarket _market, address _trader, uint256 _outcome, uint256 _fees) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IProfitLoss.recordTrade(contract IUniverse,contract IMarket,address,address,uint256,int256,int256,uint256,uint256,uint256,uint256)"></a><code class="function-signature">recordTrade(contract IUniverse _universe, contract IMarket _market, address _longAddress, address _shortAddress, uint256 _outcome, int256 _amount, int256 _price, uint256 _numLongTokens, uint256 _numShortTokens, uint256 _numLongShares, uint256 _numShortShares) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IProfitLoss.recordClaim(contract IMarket,address,uint256[])"></a><code class="function-signature">recordClaim(contract IMarket _market, address _account, uint256[] _outcomeFees) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>







### `IRegistry`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IRegistry.getChildChainAndStateSender()"><code class="function-signature">getChildChainAndStateSender()</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IRegistry.getChildChainAndStateSender()"></a><code class="function-signature">getChildChainAndStateSender() <span class="return-arrow">→</span> <span class="return-type">address,address</span></code><span class="function-visibility">public</span></h4>







### `IReportingParticipant`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IReportingParticipant.getStake()"><code class="function-signature">getStake()</code></a></li><li><a href="#IReportingParticipant.getPayoutDistributionHash()"><code class="function-signature">getPayoutDistributionHash()</code></a></li><li><a href="#IReportingParticipant.liquidateLosing()"><code class="function-signature">liquidateLosing()</code></a></li><li><a href="#IReportingParticipant.redeem(address)"><code class="function-signature">redeem(address _redeemer)</code></a></li><li><a href="#IReportingParticipant.isDisavowed()"><code class="function-signature">isDisavowed()</code></a></li><li><a href="#IReportingParticipant.getPayoutNumerator(uint256)"><code class="function-signature">getPayoutNumerator(uint256 _outcome)</code></a></li><li><a href="#IReportingParticipant.getPayoutNumerators()"><code class="function-signature">getPayoutNumerators()</code></a></li><li><a href="#IReportingParticipant.getMarket()"><code class="function-signature">getMarket()</code></a></li><li><a href="#IReportingParticipant.getSize()"><code class="function-signature">getSize()</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IReportingParticipant.getStake()"></a><code class="function-signature">getStake() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReportingParticipant.getPayoutDistributionHash()"></a><code class="function-signature">getPayoutDistributionHash() <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReportingParticipant.liquidateLosing()"></a><code class="function-signature">liquidateLosing()</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReportingParticipant.redeem(address)"></a><code class="function-signature">redeem(address _redeemer) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReportingParticipant.isDisavowed()"></a><code class="function-signature">isDisavowed() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReportingParticipant.getPayoutNumerator(uint256)"></a><code class="function-signature">getPayoutNumerator(uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReportingParticipant.getPayoutNumerators()"></a><code class="function-signature">getPayoutNumerators() <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReportingParticipant.getMarket()"></a><code class="function-signature">getMarket() <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReportingParticipant.getSize()"></a><code class="function-signature">getSize() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>







### `IReputationToken`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IReputationToken.migrateOutByPayout(uint256[],uint256)"><code class="function-signature">migrateOutByPayout(uint256[] _payoutNumerators, uint256 _attotokens)</code></a></li><li><a href="#IReputationToken.migrateIn(address,uint256)"><code class="function-signature">migrateIn(address _reporter, uint256 _attotokens)</code></a></li><li><a href="#IReputationToken.trustedReportingParticipantTransfer(address,address,uint256)"><code class="function-signature">trustedReportingParticipantTransfer(address _source, address _destination, uint256 _attotokens)</code></a></li><li><a href="#IReputationToken.trustedMarketTransfer(address,address,uint256)"><code class="function-signature">trustedMarketTransfer(address _source, address _destination, uint256 _attotokens)</code></a></li><li><a href="#IReputationToken.trustedUniverseTransfer(address,address,uint256)"><code class="function-signature">trustedUniverseTransfer(address _source, address _destination, uint256 _attotokens)</code></a></li><li><a href="#IReputationToken.trustedDisputeWindowTransfer(address,address,uint256)"><code class="function-signature">trustedDisputeWindowTransfer(address _source, address _destination, uint256 _attotokens)</code></a></li><li><a href="#IReputationToken.getUniverse()"><code class="function-signature">getUniverse()</code></a></li><li><a href="#IReputationToken.getTotalMigrated()"><code class="function-signature">getTotalMigrated()</code></a></li><li><a href="#IReputationToken.getTotalTheoreticalSupply()"><code class="function-signature">getTotalTheoreticalSupply()</code></a></li><li><a href="#IReputationToken.mintForReportingParticipant(uint256)"><code class="function-signature">mintForReportingParticipant(uint256 _amountMigrated)</code></a></li><li class="inherited"><a href="#IERC20.totalSupply()"><code class="function-signature">totalSupply()</code></a></li><li class="inherited"><a href="#IERC20.balanceOf(address)"><code class="function-signature">balanceOf(address owner)</code></a></li><li class="inherited"><a href="#IERC20.transfer(address,uint256)"><code class="function-signature">transfer(address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address from, address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.approve(address,uint256)"><code class="function-signature">approve(address spender, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.allowance(address,address)"><code class="function-signature">allowance(address owner, address spender)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC20.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li class="inherited"><a href="#IERC20.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IReputationToken.migrateOutByPayout(uint256[],uint256)"></a><code class="function-signature">migrateOutByPayout(uint256[] _payoutNumerators, uint256 _attotokens) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReputationToken.migrateIn(address,uint256)"></a><code class="function-signature">migrateIn(address _reporter, uint256 _attotokens) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReputationToken.trustedReportingParticipantTransfer(address,address,uint256)"></a><code class="function-signature">trustedReportingParticipantTransfer(address _source, address _destination, uint256 _attotokens) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReputationToken.trustedMarketTransfer(address,address,uint256)"></a><code class="function-signature">trustedMarketTransfer(address _source, address _destination, uint256 _attotokens) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReputationToken.trustedUniverseTransfer(address,address,uint256)"></a><code class="function-signature">trustedUniverseTransfer(address _source, address _destination, uint256 _attotokens) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReputationToken.trustedDisputeWindowTransfer(address,address,uint256)"></a><code class="function-signature">trustedDisputeWindowTransfer(address _source, address _destination, uint256 _attotokens) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReputationToken.getUniverse()"></a><code class="function-signature">getUniverse() <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReputationToken.getTotalMigrated()"></a><code class="function-signature">getTotalMigrated() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReputationToken.getTotalTheoreticalSupply()"></a><code class="function-signature">getTotalTheoreticalSupply() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IReputationToken.mintForReportingParticipant(uint256)"></a><code class="function-signature">mintForReportingParticipant(uint256 _amountMigrated) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>







### `IShareToken`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IShareToken.initialize(contract IAugur)"><code class="function-signature">initialize(contract IAugur _augur)</code></a></li><li><a href="#IShareToken.initializeMarket(contract IMarket,uint256,uint256)"><code class="function-signature">initializeMarket(contract IMarket _market, uint256 _numOutcomes, uint256 _numTicks)</code></a></li><li><a href="#IShareToken.unsafeTransferFrom(address,address,uint256,uint256)"><code class="function-signature">unsafeTransferFrom(address _from, address _to, uint256 _id, uint256 _value)</code></a></li><li><a href="#IShareToken.unsafeBatchTransferFrom(address,address,uint256[],uint256[])"><code class="function-signature">unsafeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values)</code></a></li><li><a href="#IShareToken.claimTradingProceeds(contract IMarket,address,bytes32)"><code class="function-signature">claimTradingProceeds(contract IMarket _market, address _shareHolder, bytes32 _fingerprint)</code></a></li><li><a href="#IShareToken.getMarket(uint256)"><code class="function-signature">getMarket(uint256 _tokenId)</code></a></li><li><a href="#IShareToken.getOutcome(uint256)"><code class="function-signature">getOutcome(uint256 _tokenId)</code></a></li><li><a href="#IShareToken.getTokenId(contract IMarket,uint256)"><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#IShareToken.getTokenIds(contract IMarket,uint256[])"><code class="function-signature">getTokenIds(contract IMarket _market, uint256[] _outcomes)</code></a></li><li><a href="#IShareToken.buyCompleteSets(contract IMarket,address,uint256)"><code class="function-signature">buyCompleteSets(contract IMarket _market, address _account, uint256 _amount)</code></a></li><li><a href="#IShareToken.buyCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address)"><code class="function-signature">buyCompleteSetsForTrade(contract IMarket _market, uint256 _amount, uint256 _longOutcome, address _longRecipient, address _shortRecipient)</code></a></li><li><a href="#IShareToken.sellCompleteSets(contract IMarket,address,address,uint256,bytes32)"><code class="function-signature">sellCompleteSets(contract IMarket _market, address _holder, address _recipient, uint256 _amount, bytes32 _fingerprint)</code></a></li><li><a href="#IShareToken.sellCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address,address,address,uint256,address,bytes32)"><code class="function-signature">sellCompleteSetsForTrade(contract IMarket _market, uint256 _outcome, uint256 _amount, address _shortParticipant, address _longParticipant, address _shortRecipient, address _longRecipient, uint256 _price, address _sourceAccount, bytes32 _fingerprint)</code></a></li><li><a href="#IShareToken.totalSupplyForMarketOutcome(contract IMarket,uint256)"><code class="function-signature">totalSupplyForMarketOutcome(contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#IShareToken.balanceOfMarketOutcome(contract IMarket,uint256,address)"><code class="function-signature">balanceOfMarketOutcome(contract IMarket _market, uint256 _outcome, address _account)</code></a></li><li><a href="#IShareToken.lowestBalanceOfMarketOutcomes(contract IMarket,uint256[],address)"><code class="function-signature">lowestBalanceOfMarketOutcomes(contract IMarket _market, uint256[] _outcomes, address _account)</code></a></li><li class="inherited"><a href="matic#IERC1155.safeTransferFrom(address,address,uint256,uint256,bytes)"><code class="function-signature">safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes data)</code></a></li><li class="inherited"><a href="matic#IERC1155.safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)"><code class="function-signature">safeBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data)</code></a></li><li class="inherited"><a href="matic#IERC1155.setApprovalForAll(address,bool)"><code class="function-signature">setApprovalForAll(address operator, bool approved)</code></a></li><li class="inherited"><a href="matic#IERC1155.isApprovedForAll(address,address)"><code class="function-signature">isApprovedForAll(address owner, address operator)</code></a></li><li class="inherited"><a href="matic#IERC1155.balanceOf(address,uint256)"><code class="function-signature">balanceOf(address owner, uint256 id)</code></a></li><li class="inherited"><a href="matic#IERC1155.totalSupply(uint256)"><code class="function-signature">totalSupply(uint256 id)</code></a></li><li class="inherited"><a href="matic#IERC1155.balanceOfBatch(address[],uint256[])"><code class="function-signature">balanceOfBatch(address[] owners, uint256[] ids)</code></a></li><li class="inherited"><a href="matic#ITyped.getTypeName()"><code class="function-signature">getTypeName()</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="matic#IERC1155.TransferSingle(address,address,address,uint256,uint256)"><code class="function-signature">TransferSingle(address operator, address from, address to, uint256 id, uint256 value)</code></a></li><li class="inherited"><a href="matic#IERC1155.TransferBatch(address,address,address,uint256[],uint256[])"><code class="function-signature">TransferBatch(address operator, address from, address to, uint256[] ids, uint256[] values)</code></a></li><li class="inherited"><a href="matic#IERC1155.ApprovalForAll(address,address,bool)"><code class="function-signature">ApprovalForAll(address owner, address operator, bool approved)</code></a></li><li class="inherited"><a href="matic#IERC1155.URI(string,uint256)"><code class="function-signature">URI(string value, uint256 id)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IShareToken.initialize(contract IAugur)"></a><code class="function-signature">initialize(contract IAugur _augur)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.initializeMarket(contract IMarket,uint256,uint256)"></a><code class="function-signature">initializeMarket(contract IMarket _market, uint256 _numOutcomes, uint256 _numTicks)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.unsafeTransferFrom(address,address,uint256,uint256)"></a><code class="function-signature">unsafeTransferFrom(address _from, address _to, uint256 _id, uint256 _value)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.unsafeBatchTransferFrom(address,address,uint256[],uint256[])"></a><code class="function-signature">unsafeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.claimTradingProceeds(contract IMarket,address,bytes32)"></a><code class="function-signature">claimTradingProceeds(contract IMarket _market, address _shareHolder, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.getMarket(uint256)"></a><code class="function-signature">getMarket(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.getOutcome(uint256)"></a><code class="function-signature">getOutcome(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.getTokenId(contract IMarket,uint256)"></a><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.getTokenIds(contract IMarket,uint256[])"></a><code class="function-signature">getTokenIds(contract IMarket _market, uint256[] _outcomes) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.buyCompleteSets(contract IMarket,address,uint256)"></a><code class="function-signature">buyCompleteSets(contract IMarket _market, address _account, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.buyCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address)"></a><code class="function-signature">buyCompleteSetsForTrade(contract IMarket _market, uint256 _amount, uint256 _longOutcome, address _longRecipient, address _shortRecipient) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.sellCompleteSets(contract IMarket,address,address,uint256,bytes32)"></a><code class="function-signature">sellCompleteSets(contract IMarket _market, address _holder, address _recipient, uint256 _amount, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.sellCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address,address,address,uint256,address,bytes32)"></a><code class="function-signature">sellCompleteSetsForTrade(contract IMarket _market, uint256 _outcome, uint256 _amount, address _shortParticipant, address _longParticipant, address _shortRecipient, address _longRecipient, uint256 _price, address _sourceAccount, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.totalSupplyForMarketOutcome(contract IMarket,uint256)"></a><code class="function-signature">totalSupplyForMarketOutcome(contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.balanceOfMarketOutcome(contract IMarket,uint256,address)"></a><code class="function-signature">balanceOfMarketOutcome(contract IMarket _market, uint256 _outcome, address _account) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IShareToken.lowestBalanceOfMarketOutcomes(contract IMarket,uint256[],address)"></a><code class="function-signature">lowestBalanceOfMarketOutcomes(contract IMarket _market, uint256[] _outcomes, address _account) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>







### `ITyped`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#ITyped.getTypeName()"><code class="function-signature">getTypeName()</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="ITyped.getTypeName()"></a><code class="function-signature">getTypeName() <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>







### `IUniswapV2Pair`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IUniswapV2Pair.name()"><code class="function-signature">name()</code></a></li><li><a href="#IUniswapV2Pair.symbol()"><code class="function-signature">symbol()</code></a></li><li><a href="#IUniswapV2Pair.decimals()"><code class="function-signature">decimals()</code></a></li><li><a href="#IUniswapV2Pair.totalSupply()"><code class="function-signature">totalSupply()</code></a></li><li><a href="#IUniswapV2Pair.balanceOf(address)"><code class="function-signature">balanceOf(address owner)</code></a></li><li><a href="#IUniswapV2Pair.allowance(address,address)"><code class="function-signature">allowance(address owner, address spender)</code></a></li><li><a href="#IUniswapV2Pair.approve(address,uint256)"><code class="function-signature">approve(address spender, uint256 value)</code></a></li><li><a href="#IUniswapV2Pair.transfer(address,uint256)"><code class="function-signature">transfer(address to, uint256 value)</code></a></li><li><a href="#IUniswapV2Pair.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address from, address to, uint256 value)</code></a></li><li><a href="#IUniswapV2Pair.DOMAIN_SEPARATOR()"><code class="function-signature">DOMAIN_SEPARATOR()</code></a></li><li><a href="#IUniswapV2Pair.PERMIT_TYPEHASH()"><code class="function-signature">PERMIT_TYPEHASH()</code></a></li><li><a href="#IUniswapV2Pair.nonces(address)"><code class="function-signature">nonces(address owner)</code></a></li><li><a href="#IUniswapV2Pair.permit(address,address,uint256,uint256,uint8,bytes32,bytes32)"><code class="function-signature">permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s)</code></a></li><li><a href="#IUniswapV2Pair.MINIMUM_LIQUIDITY()"><code class="function-signature">MINIMUM_LIQUIDITY()</code></a></li><li><a href="#IUniswapV2Pair.factory()"><code class="function-signature">factory()</code></a></li><li><a href="#IUniswapV2Pair.token0()"><code class="function-signature">token0()</code></a></li><li><a href="#IUniswapV2Pair.token1()"><code class="function-signature">token1()</code></a></li><li><a href="#IUniswapV2Pair.getReserves()"><code class="function-signature">getReserves()</code></a></li><li><a href="#IUniswapV2Pair.price0CumulativeLast()"><code class="function-signature">price0CumulativeLast()</code></a></li><li><a href="#IUniswapV2Pair.price1CumulativeLast()"><code class="function-signature">price1CumulativeLast()</code></a></li><li><a href="#IUniswapV2Pair.kLast()"><code class="function-signature">kLast()</code></a></li><li><a href="#IUniswapV2Pair.mint(address)"><code class="function-signature">mint(address to)</code></a></li><li><a href="#IUniswapV2Pair.burn(address)"><code class="function-signature">burn(address to)</code></a></li><li><a href="#IUniswapV2Pair.swap(uint256,uint256,address,bytes)"><code class="function-signature">swap(uint256 amount0Out, uint256 amount1Out, address to, bytes data)</code></a></li><li><a href="#IUniswapV2Pair.skim(address)"><code class="function-signature">skim(address to)</code></a></li><li><a href="#IUniswapV2Pair.sync()"><code class="function-signature">sync()</code></a></li><li><a href="#IUniswapV2Pair.initialize(address,address)"><code class="function-signature">initialize(address, address)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li><a href="#IUniswapV2Pair.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li><li><a href="#IUniswapV2Pair.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li><a href="#IUniswapV2Pair.Mint(address,uint256,uint256)"><code class="function-signature">Mint(address sender, uint256 amount0, uint256 amount1)</code></a></li><li><a href="#IUniswapV2Pair.Burn(address,uint256,uint256,address)"><code class="function-signature">Burn(address sender, uint256 amount0, uint256 amount1, address to)</code></a></li><li><a href="#IUniswapV2Pair.Swap(address,uint256,uint256,uint256,uint256,address)"><code class="function-signature">Swap(address sender, uint256 amount0In, uint256 amount1In, uint256 amount0Out, uint256 amount1Out, address to)</code></a></li><li><a href="#IUniswapV2Pair.Sync(uint112,uint112)"><code class="function-signature">Sync(uint112 reserve0, uint112 reserve1)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.name()"></a><code class="function-signature">name() <span class="return-arrow">→</span> <span class="return-type">string</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.symbol()"></a><code class="function-signature">symbol() <span class="return-arrow">→</span> <span class="return-type">string</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.decimals()"></a><code class="function-signature">decimals() <span class="return-arrow">→</span> <span class="return-type">uint8</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.totalSupply()"></a><code class="function-signature">totalSupply() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.balanceOf(address)"></a><code class="function-signature">balanceOf(address owner) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.allowance(address,address)"></a><code class="function-signature">allowance(address owner, address spender) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.approve(address,uint256)"></a><code class="function-signature">approve(address spender, uint256 value) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.transfer(address,uint256)"></a><code class="function-signature">transfer(address to, uint256 value) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.transferFrom(address,address,uint256)"></a><code class="function-signature">transferFrom(address from, address to, uint256 value) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.DOMAIN_SEPARATOR()"></a><code class="function-signature">DOMAIN_SEPARATOR() <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.PERMIT_TYPEHASH()"></a><code class="function-signature">PERMIT_TYPEHASH() <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.nonces(address)"></a><code class="function-signature">nonces(address owner) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.permit(address,address,uint256,uint256,uint8,bytes32,bytes32)"></a><code class="function-signature">permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.MINIMUM_LIQUIDITY()"></a><code class="function-signature">MINIMUM_LIQUIDITY() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.factory()"></a><code class="function-signature">factory() <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.token0()"></a><code class="function-signature">token0() <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.token1()"></a><code class="function-signature">token1() <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.getReserves()"></a><code class="function-signature">getReserves() <span class="return-arrow">→</span> <span class="return-type">uint112,uint112,uint32</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.price0CumulativeLast()"></a><code class="function-signature">price0CumulativeLast() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.price1CumulativeLast()"></a><code class="function-signature">price1CumulativeLast() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.kLast()"></a><code class="function-signature">kLast() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.mint(address)"></a><code class="function-signature">mint(address to) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.burn(address)"></a><code class="function-signature">burn(address to) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.swap(uint256,uint256,address,bytes)"></a><code class="function-signature">swap(uint256 amount0Out, uint256 amount1Out, address to, bytes data)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.skim(address)"></a><code class="function-signature">skim(address to)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.sync()"></a><code class="function-signature">sync()</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.initialize(address,address)"></a><code class="function-signature">initialize(address, address)</code><span class="function-visibility">external</span></h4>







<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.Approval(address,address,uint256)"></a><code class="function-signature">Approval(address owner, address spender, uint256 value)</code><span class="function-visibility"></span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.Transfer(address,address,uint256)"></a><code class="function-signature">Transfer(address from, address to, uint256 value)</code><span class="function-visibility"></span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.Mint(address,uint256,uint256)"></a><code class="function-signature">Mint(address sender, uint256 amount0, uint256 amount1)</code><span class="function-visibility"></span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.Burn(address,uint256,uint256,address)"></a><code class="function-signature">Burn(address sender, uint256 amount0, uint256 amount1, address to)</code><span class="function-visibility"></span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.Swap(address,uint256,uint256,uint256,uint256,address)"></a><code class="function-signature">Swap(address sender, uint256 amount0In, uint256 amount1In, uint256 amount0Out, uint256 amount1Out, address to)</code><span class="function-visibility"></span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Pair.Sync(uint112,uint112)"></a><code class="function-signature">Sync(uint112 reserve0, uint112 reserve1)</code><span class="function-visibility"></span></h4>





### `IUniverse`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IUniverse.creationTime()"><code class="function-signature">creationTime()</code></a></li><li><a href="#IUniverse.marketBalance(address)"><code class="function-signature">marketBalance(address)</code></a></li><li><a href="#IUniverse.fork()"><code class="function-signature">fork()</code></a></li><li><a href="#IUniverse.updateForkValues()"><code class="function-signature">updateForkValues()</code></a></li><li><a href="#IUniverse.getParentUniverse()"><code class="function-signature">getParentUniverse()</code></a></li><li><a href="#IUniverse.createChildUniverse(uint256[])"><code class="function-signature">createChildUniverse(uint256[] _parentPayoutNumerators)</code></a></li><li><a href="#IUniverse.getChildUniverse(bytes32)"><code class="function-signature">getChildUniverse(bytes32 _parentPayoutDistributionHash)</code></a></li><li><a href="#IUniverse.getReputationToken()"><code class="function-signature">getReputationToken()</code></a></li><li><a href="#IUniverse.getForkingMarket()"><code class="function-signature">getForkingMarket()</code></a></li><li><a href="#IUniverse.getForkEndTime()"><code class="function-signature">getForkEndTime()</code></a></li><li><a href="#IUniverse.getForkReputationGoal()"><code class="function-signature">getForkReputationGoal()</code></a></li><li><a href="#IUniverse.getParentPayoutDistributionHash()"><code class="function-signature">getParentPayoutDistributionHash()</code></a></li><li><a href="#IUniverse.getDisputeRoundDurationInSeconds(bool)"><code class="function-signature">getDisputeRoundDurationInSeconds(bool _initial)</code></a></li><li><a href="#IUniverse.getOrCreateDisputeWindowByTimestamp(uint256,bool)"><code class="function-signature">getOrCreateDisputeWindowByTimestamp(uint256 _timestamp, bool _initial)</code></a></li><li><a href="#IUniverse.getOrCreateCurrentDisputeWindow(bool)"><code class="function-signature">getOrCreateCurrentDisputeWindow(bool _initial)</code></a></li><li><a href="#IUniverse.getOrCreateNextDisputeWindow(bool)"><code class="function-signature">getOrCreateNextDisputeWindow(bool _initial)</code></a></li><li><a href="#IUniverse.getOrCreatePreviousDisputeWindow(bool)"><code class="function-signature">getOrCreatePreviousDisputeWindow(bool _initial)</code></a></li><li><a href="#IUniverse.getOpenInterestInAttoCash()"><code class="function-signature">getOpenInterestInAttoCash()</code></a></li><li><a href="#IUniverse.getTargetRepMarketCapInAttoCash()"><code class="function-signature">getTargetRepMarketCapInAttoCash()</code></a></li><li><a href="#IUniverse.getOrCacheValidityBond()"><code class="function-signature">getOrCacheValidityBond()</code></a></li><li><a href="#IUniverse.getOrCacheDesignatedReportStake()"><code class="function-signature">getOrCacheDesignatedReportStake()</code></a></li><li><a href="#IUniverse.getOrCacheDesignatedReportNoShowBond()"><code class="function-signature">getOrCacheDesignatedReportNoShowBond()</code></a></li><li><a href="#IUniverse.getOrCacheMarketRepBond()"><code class="function-signature">getOrCacheMarketRepBond()</code></a></li><li><a href="#IUniverse.getOrCacheReportingFeeDivisor()"><code class="function-signature">getOrCacheReportingFeeDivisor()</code></a></li><li><a href="#IUniverse.getDisputeThresholdForFork()"><code class="function-signature">getDisputeThresholdForFork()</code></a></li><li><a href="#IUniverse.getDisputeThresholdForDisputePacing()"><code class="function-signature">getDisputeThresholdForDisputePacing()</code></a></li><li><a href="#IUniverse.getInitialReportMinValue()"><code class="function-signature">getInitialReportMinValue()</code></a></li><li><a href="#IUniverse.getPayoutNumerators()"><code class="function-signature">getPayoutNumerators()</code></a></li><li><a href="#IUniverse.getReportingFeeDivisor()"><code class="function-signature">getReportingFeeDivisor()</code></a></li><li><a href="#IUniverse.getPayoutNumerator(uint256)"><code class="function-signature">getPayoutNumerator(uint256 _outcome)</code></a></li><li><a href="#IUniverse.getWinningChildPayoutNumerator(uint256)"><code class="function-signature">getWinningChildPayoutNumerator(uint256 _outcome)</code></a></li><li><a href="#IUniverse.isOpenInterestCash(address)"><code class="function-signature">isOpenInterestCash(address)</code></a></li><li><a href="#IUniverse.isForkingMarket()"><code class="function-signature">isForkingMarket()</code></a></li><li><a href="#IUniverse.getCurrentDisputeWindow(bool)"><code class="function-signature">getCurrentDisputeWindow(bool _initial)</code></a></li><li><a href="#IUniverse.getDisputeWindowStartTimeAndDuration(uint256,bool)"><code class="function-signature">getDisputeWindowStartTimeAndDuration(uint256 _timestamp, bool _initial)</code></a></li><li><a href="#IUniverse.isParentOf(contract IUniverse)"><code class="function-signature">isParentOf(contract IUniverse _shadyChild)</code></a></li><li><a href="#IUniverse.updateTentativeWinningChildUniverse(bytes32)"><code class="function-signature">updateTentativeWinningChildUniverse(bytes32 _parentPayoutDistributionHash)</code></a></li><li><a href="#IUniverse.isContainerForDisputeWindow(contract IDisputeWindow)"><code class="function-signature">isContainerForDisputeWindow(contract IDisputeWindow _shadyTarget)</code></a></li><li><a href="#IUniverse.isContainerForMarket(contract IMarket)"><code class="function-signature">isContainerForMarket(contract IMarket _shadyTarget)</code></a></li><li><a href="#IUniverse.isContainerForReportingParticipant(contract IReportingParticipant)"><code class="function-signature">isContainerForReportingParticipant(contract IReportingParticipant _reportingParticipant)</code></a></li><li><a href="#IUniverse.migrateMarketOut(contract IUniverse)"><code class="function-signature">migrateMarketOut(contract IUniverse _destinationUniverse)</code></a></li><li><a href="#IUniverse.migrateMarketIn(contract IMarket,uint256,uint256)"><code class="function-signature">migrateMarketIn(contract IMarket _market, uint256 _cashBalance, uint256 _marketOI)</code></a></li><li><a href="#IUniverse.decrementOpenInterest(uint256)"><code class="function-signature">decrementOpenInterest(uint256 _amount)</code></a></li><li><a href="#IUniverse.decrementOpenInterestFromMarket(contract IMarket)"><code class="function-signature">decrementOpenInterestFromMarket(contract IMarket _market)</code></a></li><li><a href="#IUniverse.incrementOpenInterest(uint256)"><code class="function-signature">incrementOpenInterest(uint256 _amount)</code></a></li><li><a href="#IUniverse.getWinningChildUniverse()"><code class="function-signature">getWinningChildUniverse()</code></a></li><li><a href="#IUniverse.isForking()"><code class="function-signature">isForking()</code></a></li><li><a href="#IUniverse.deposit(address,uint256,address)"><code class="function-signature">deposit(address _sender, uint256 _amount, address _market)</code></a></li><li><a href="#IUniverse.withdraw(address,uint256,address)"><code class="function-signature">withdraw(address _recipient, uint256 _amount, address _market)</code></a></li><li><a href="#IUniverse.pokeRepMarketCapInAttoCash()"><code class="function-signature">pokeRepMarketCapInAttoCash()</code></a></li><li><a href="#IUniverse.createScalarMarket(uint256,uint256,contract IAffiliateValidator,uint256,address,int256[],uint256,string)"><code class="function-signature">createScalarMarket(uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, int256[] _prices, uint256 _numTicks, string _extraInfo)</code></a></li><li><a href="#IUniverse.createYesNoMarket(uint256,uint256,contract IAffiliateValidator,uint256,address,string)"><code class="function-signature">createYesNoMarket(uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, string _extraInfo)</code></a></li><li><a href="#IUniverse.createCategoricalMarket(uint256,uint256,contract IAffiliateValidator,uint256,address,bytes32[],string)"><code class="function-signature">createCategoricalMarket(uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, bytes32[] _outcomes, string _extraInfo)</code></a></li><li><a href="#IUniverse.runPeriodicals()"><code class="function-signature">runPeriodicals()</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IUniverse.creationTime()"></a><code class="function-signature">creationTime() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.marketBalance(address)"></a><code class="function-signature">marketBalance(address) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.fork()"></a><code class="function-signature">fork() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.updateForkValues()"></a><code class="function-signature">updateForkValues() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getParentUniverse()"></a><code class="function-signature">getParentUniverse() <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.createChildUniverse(uint256[])"></a><code class="function-signature">createChildUniverse(uint256[] _parentPayoutNumerators) <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getChildUniverse(bytes32)"></a><code class="function-signature">getChildUniverse(bytes32 _parentPayoutDistributionHash) <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getReputationToken()"></a><code class="function-signature">getReputationToken() <span class="return-arrow">→</span> <span class="return-type">contract IV2ReputationToken</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getForkingMarket()"></a><code class="function-signature">getForkingMarket() <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getForkEndTime()"></a><code class="function-signature">getForkEndTime() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getForkReputationGoal()"></a><code class="function-signature">getForkReputationGoal() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getParentPayoutDistributionHash()"></a><code class="function-signature">getParentPayoutDistributionHash() <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getDisputeRoundDurationInSeconds(bool)"></a><code class="function-signature">getDisputeRoundDurationInSeconds(bool _initial) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getOrCreateDisputeWindowByTimestamp(uint256,bool)"></a><code class="function-signature">getOrCreateDisputeWindowByTimestamp(uint256 _timestamp, bool _initial) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getOrCreateCurrentDisputeWindow(bool)"></a><code class="function-signature">getOrCreateCurrentDisputeWindow(bool _initial) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getOrCreateNextDisputeWindow(bool)"></a><code class="function-signature">getOrCreateNextDisputeWindow(bool _initial) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getOrCreatePreviousDisputeWindow(bool)"></a><code class="function-signature">getOrCreatePreviousDisputeWindow(bool _initial) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getOpenInterestInAttoCash()"></a><code class="function-signature">getOpenInterestInAttoCash() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getTargetRepMarketCapInAttoCash()"></a><code class="function-signature">getTargetRepMarketCapInAttoCash() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getOrCacheValidityBond()"></a><code class="function-signature">getOrCacheValidityBond() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getOrCacheDesignatedReportStake()"></a><code class="function-signature">getOrCacheDesignatedReportStake() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getOrCacheDesignatedReportNoShowBond()"></a><code class="function-signature">getOrCacheDesignatedReportNoShowBond() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getOrCacheMarketRepBond()"></a><code class="function-signature">getOrCacheMarketRepBond() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getOrCacheReportingFeeDivisor()"></a><code class="function-signature">getOrCacheReportingFeeDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getDisputeThresholdForFork()"></a><code class="function-signature">getDisputeThresholdForFork() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getDisputeThresholdForDisputePacing()"></a><code class="function-signature">getDisputeThresholdForDisputePacing() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getInitialReportMinValue()"></a><code class="function-signature">getInitialReportMinValue() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getPayoutNumerators()"></a><code class="function-signature">getPayoutNumerators() <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getReportingFeeDivisor()"></a><code class="function-signature">getReportingFeeDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getPayoutNumerator(uint256)"></a><code class="function-signature">getPayoutNumerator(uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getWinningChildPayoutNumerator(uint256)"></a><code class="function-signature">getWinningChildPayoutNumerator(uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.isOpenInterestCash(address)"></a><code class="function-signature">isOpenInterestCash(address) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.isForkingMarket()"></a><code class="function-signature">isForkingMarket() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getCurrentDisputeWindow(bool)"></a><code class="function-signature">getCurrentDisputeWindow(bool _initial) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getDisputeWindowStartTimeAndDuration(uint256,bool)"></a><code class="function-signature">getDisputeWindowStartTimeAndDuration(uint256 _timestamp, bool _initial) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.isParentOf(contract IUniverse)"></a><code class="function-signature">isParentOf(contract IUniverse _shadyChild) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.updateTentativeWinningChildUniverse(bytes32)"></a><code class="function-signature">updateTentativeWinningChildUniverse(bytes32 _parentPayoutDistributionHash) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.isContainerForDisputeWindow(contract IDisputeWindow)"></a><code class="function-signature">isContainerForDisputeWindow(contract IDisputeWindow _shadyTarget) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.isContainerForMarket(contract IMarket)"></a><code class="function-signature">isContainerForMarket(contract IMarket _shadyTarget) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.isContainerForReportingParticipant(contract IReportingParticipant)"></a><code class="function-signature">isContainerForReportingParticipant(contract IReportingParticipant _reportingParticipant) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.migrateMarketOut(contract IUniverse)"></a><code class="function-signature">migrateMarketOut(contract IUniverse _destinationUniverse) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.migrateMarketIn(contract IMarket,uint256,uint256)"></a><code class="function-signature">migrateMarketIn(contract IMarket _market, uint256 _cashBalance, uint256 _marketOI) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.decrementOpenInterest(uint256)"></a><code class="function-signature">decrementOpenInterest(uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.decrementOpenInterestFromMarket(contract IMarket)"></a><code class="function-signature">decrementOpenInterestFromMarket(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.incrementOpenInterest(uint256)"></a><code class="function-signature">incrementOpenInterest(uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.getWinningChildUniverse()"></a><code class="function-signature">getWinningChildUniverse() <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.isForking()"></a><code class="function-signature">isForking() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.deposit(address,uint256,address)"></a><code class="function-signature">deposit(address _sender, uint256 _amount, address _market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.withdraw(address,uint256,address)"></a><code class="function-signature">withdraw(address _recipient, uint256 _amount, address _market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.pokeRepMarketCapInAttoCash()"></a><code class="function-signature">pokeRepMarketCapInAttoCash() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.createScalarMarket(uint256,uint256,contract IAffiliateValidator,uint256,address,int256[],uint256,string)"></a><code class="function-signature">createScalarMarket(uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, int256[] _prices, uint256 _numTicks, string _extraInfo) <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.createYesNoMarket(uint256,uint256,contract IAffiliateValidator,uint256,address,string)"></a><code class="function-signature">createYesNoMarket(uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, string _extraInfo) <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.createCategoricalMarket(uint256,uint256,contract IAffiliateValidator,uint256,address,bytes32[],string)"></a><code class="function-signature">createCategoricalMarket(uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, bytes32[] _outcomes, string _extraInfo) <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniverse.runPeriodicals()"></a><code class="function-signature">runPeriodicals() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>







### `IV2ReputationToken`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IV2ReputationToken.parentUniverse()"><code class="function-signature">parentUniverse()</code></a></li><li><a href="#IV2ReputationToken.burnForMarket(uint256)"><code class="function-signature">burnForMarket(uint256 _amountToBurn)</code></a></li><li><a href="#IV2ReputationToken.mintForWarpSync(uint256,address)"><code class="function-signature">mintForWarpSync(uint256 _amountToMint, address _target)</code></a></li><li><a href="#IV2ReputationToken.getLegacyRepToken()"><code class="function-signature">getLegacyRepToken()</code></a></li><li><a href="#IV2ReputationToken.symbol()"><code class="function-signature">symbol()</code></a></li><li class="inherited"><a href="matic#IReputationToken.migrateOutByPayout(uint256[],uint256)"><code class="function-signature">migrateOutByPayout(uint256[] _payoutNumerators, uint256 _attotokens)</code></a></li><li class="inherited"><a href="matic#IReputationToken.migrateIn(address,uint256)"><code class="function-signature">migrateIn(address _reporter, uint256 _attotokens)</code></a></li><li class="inherited"><a href="matic#IReputationToken.trustedReportingParticipantTransfer(address,address,uint256)"><code class="function-signature">trustedReportingParticipantTransfer(address _source, address _destination, uint256 _attotokens)</code></a></li><li class="inherited"><a href="matic#IReputationToken.trustedMarketTransfer(address,address,uint256)"><code class="function-signature">trustedMarketTransfer(address _source, address _destination, uint256 _attotokens)</code></a></li><li class="inherited"><a href="matic#IReputationToken.trustedUniverseTransfer(address,address,uint256)"><code class="function-signature">trustedUniverseTransfer(address _source, address _destination, uint256 _attotokens)</code></a></li><li class="inherited"><a href="matic#IReputationToken.trustedDisputeWindowTransfer(address,address,uint256)"><code class="function-signature">trustedDisputeWindowTransfer(address _source, address _destination, uint256 _attotokens)</code></a></li><li class="inherited"><a href="matic#IReputationToken.getUniverse()"><code class="function-signature">getUniverse()</code></a></li><li class="inherited"><a href="matic#IReputationToken.getTotalMigrated()"><code class="function-signature">getTotalMigrated()</code></a></li><li class="inherited"><a href="matic#IReputationToken.getTotalTheoreticalSupply()"><code class="function-signature">getTotalTheoreticalSupply()</code></a></li><li class="inherited"><a href="matic#IReputationToken.mintForReportingParticipant(uint256)"><code class="function-signature">mintForReportingParticipant(uint256 _amountMigrated)</code></a></li><li class="inherited"><a href="#IERC20.totalSupply()"><code class="function-signature">totalSupply()</code></a></li><li class="inherited"><a href="#IERC20.balanceOf(address)"><code class="function-signature">balanceOf(address owner)</code></a></li><li class="inherited"><a href="#IERC20.transfer(address,uint256)"><code class="function-signature">transfer(address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address from, address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.approve(address,uint256)"><code class="function-signature">approve(address spender, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.allowance(address,address)"><code class="function-signature">allowance(address owner, address spender)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC20.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li class="inherited"><a href="#IERC20.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IV2ReputationToken.parentUniverse()"></a><code class="function-signature">parentUniverse() <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IV2ReputationToken.burnForMarket(uint256)"></a><code class="function-signature">burnForMarket(uint256 _amountToBurn) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IV2ReputationToken.mintForWarpSync(uint256,address)"></a><code class="function-signature">mintForWarpSync(uint256 _amountToMint, address _target) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IV2ReputationToken.getLegacyRepToken()"></a><code class="function-signature">getLegacyRepToken() <span class="return-arrow">→</span> <span class="return-type">contract IERC20</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IV2ReputationToken.symbol()"></a><code class="function-signature">symbol() <span class="return-arrow">→</span> <span class="return-type">string</span></code><span class="function-visibility">public</span></h4>







### `IWithdrawManager`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IWithdrawManager.verifyInclusion(bytes,uint8,bool)"><code class="function-signature">verifyInclusion(bytes data, uint8 offset, bool verifyTxInclusion)</code></a></li><li><a href="#IWithdrawManager.addExitToQueue(address,address,address,uint256,bytes32,bool,uint256)"><code class="function-signature">addExitToQueue(address exitor, address childToken, address rootToken, uint256 exitAmountOrTokenId, bytes32 txHash, bool isRegularExit, uint256 priority)</code></a></li><li><a href="#IWithdrawManager.addInput(uint256,uint256,address,address)"><code class="function-signature">addInput(uint256 exitId, uint256 age, address utxoOwner, address token)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IWithdrawManager.verifyInclusion(bytes,uint8,bool)"></a><code class="function-signature">verifyInclusion(bytes data, uint8 offset, bool verifyTxInclusion) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IWithdrawManager.addExitToQueue(address,address,address,uint256,bytes32,bool,uint256)"></a><code class="function-signature">addExitToQueue(address exitor, address childToken, address rootToken, uint256 exitAmountOrTokenId, bytes32 txHash, bool isRegularExit, uint256 priority)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IWithdrawManager.addInput(uint256,uint256,address,address)"></a><code class="function-signature">addInput(uint256 exitId, uint256 age, address utxoOwner, address token)</code><span class="function-visibility">external</span></h4>







### `Initializable`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#Initializable.endInitialization()"><code class="function-signature">endInitialization()</code></a></li><li><a href="#Initializable.getInitialized()"><code class="function-signature">getInitialized()</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="Initializable.endInitialization()"></a><code class="function-signature">endInitialization()</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Initializable.getInitialized()"></a><code class="function-signature">getInitialized() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>







### `Order`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#Order.create(contract IAugur,contract IAugurTrading,address,uint256,enum Order.Types,uint256,uint256,contract IMarket,bytes32,bytes32)"><code class="function-signature">create(contract IAugur _augur, contract IAugurTrading _augurTrading, address _creator, uint256 _outcome, enum Order.Types _type, uint256 _attoshares, uint256 _price, contract IMarket _market, bytes32 _betterOrderId, bytes32 _worseOrderId)</code></a></li><li><a href="#Order.getOrderId(struct Order.Data,contract IOrders)"><code class="function-signature">getOrderId(struct Order.Data _orderData, contract IOrders _orders)</code></a></li><li><a href="#Order.calculateOrderId(enum Order.Types,contract IMarket,uint256,uint256,address,uint256,uint256,uint256,uint256)"><code class="function-signature">calculateOrderId(enum Order.Types _type, contract IMarket _market, uint256 _amount, uint256 _price, address _sender, uint256 _blockNumber, uint256 _outcome, uint256 _moneyEscrowed, uint256 _sharesEscrowed)</code></a></li><li><a href="#Order.getOrderTradingTypeFromMakerDirection(enum Order.TradeDirections)"><code class="function-signature">getOrderTradingTypeFromMakerDirection(enum Order.TradeDirections _creatorDirection)</code></a></li><li><a href="#Order.getOrderTradingTypeFromFillerDirection(enum Order.TradeDirections)"><code class="function-signature">getOrderTradingTypeFromFillerDirection(enum Order.TradeDirections _fillerDirection)</code></a></li><li><a href="#Order.saveOrder(struct Order.Data,bytes32,contract IOrders)"><code class="function-signature">saveOrder(struct Order.Data _orderData, bytes32 _tradeGroupId, contract IOrders _orders)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="Order.create(contract IAugur,contract IAugurTrading,address,uint256,enum Order.Types,uint256,uint256,contract IMarket,bytes32,bytes32)"></a><code class="function-signature">create(contract IAugur _augur, contract IAugurTrading _augurTrading, address _creator, uint256 _outcome, enum Order.Types _type, uint256 _attoshares, uint256 _price, contract IMarket _market, bytes32 _betterOrderId, bytes32 _worseOrderId) <span class="return-arrow">→</span> <span class="return-type">struct Order.Data</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Order.getOrderId(struct Order.Data,contract IOrders)"></a><code class="function-signature">getOrderId(struct Order.Data _orderData, contract IOrders _orders) <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Order.calculateOrderId(enum Order.Types,contract IMarket,uint256,uint256,address,uint256,uint256,uint256,uint256)"></a><code class="function-signature">calculateOrderId(enum Order.Types _type, contract IMarket _market, uint256 _amount, uint256 _price, address _sender, uint256 _blockNumber, uint256 _outcome, uint256 _moneyEscrowed, uint256 _sharesEscrowed) <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Order.getOrderTradingTypeFromMakerDirection(enum Order.TradeDirections)"></a><code class="function-signature">getOrderTradingTypeFromMakerDirection(enum Order.TradeDirections _creatorDirection) <span class="return-arrow">→</span> <span class="return-type">enum Order.Types</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Order.getOrderTradingTypeFromFillerDirection(enum Order.TradeDirections)"></a><code class="function-signature">getOrderTradingTypeFromFillerDirection(enum Order.TradeDirections _fillerDirection) <span class="return-arrow">→</span> <span class="return-type">enum Order.Types</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Order.saveOrder(struct Order.Data,bytes32,contract IOrders)"></a><code class="function-signature">saveOrder(struct Order.Data _orderData, bytes32 _tradeGroupId, contract IOrders _orders) <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">internal</span></h4>







### `Ownable`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#Ownable.constructor()"><code class="function-signature">constructor()</code></a></li><li><a href="#Ownable.getOwner()"><code class="function-signature">getOwner()</code></a></li><li><a href="#Ownable.transferOwnership(address)"><code class="function-signature">transferOwnership(address _newOwner)</code></a></li><li><a href="#Ownable.onTransferOwnership(address,address)"><code class="function-signature">onTransferOwnership(address, address)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="Ownable.constructor()"></a><code class="function-signature">constructor()</code><span class="function-visibility">public</span></h4>

The Ownable constructor sets the original `owner` of the contract to the sender
account.



<h4><a class="anchor" aria-hidden="true" id="Ownable.getOwner()"></a><code class="function-signature">getOwner() <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Ownable.transferOwnership(address)"></a><code class="function-signature">transferOwnership(address _newOwner) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>

Allows the current owner to transfer control of the contract to a newOwner.




<h4><a class="anchor" aria-hidden="true" id="Ownable.onTransferOwnership(address,address)"></a><code class="function-signature">onTransferOwnership(address, address)</code><span class="function-visibility">internal</span></h4>







### `ParaShareToken`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#ParaShareToken.initialize(address,contract ShareToken)"><code class="function-signature">initialize(address _augur, contract ShareToken _originalShareToken)</code></a></li><li><a href="#ParaShareToken.approveUniverse(contract IParaUniverse)"><code class="function-signature">approveUniverse(contract IParaUniverse _paraUniverse)</code></a></li><li><a href="#ParaShareToken.unsafeTransferFrom(address,address,uint256,uint256)"><code class="function-signature">unsafeTransferFrom(address _from, address _to, uint256 _id, uint256 _value)</code></a></li><li><a href="#ParaShareToken.unsafeBatchTransferFrom(address,address,uint256[],uint256[])"><code class="function-signature">unsafeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values)</code></a></li><li><a href="#ParaShareToken.initializeMarket(contract IMarket)"><code class="function-signature">initializeMarket(contract IMarket _market)</code></a></li><li><a href="#ParaShareToken.isMarketInitialized(contract IMarket)"><code class="function-signature">isMarketInitialized(contract IMarket _market)</code></a></li><li><a href="#ParaShareToken.publicBuyCompleteSets(contract IMarket,uint256)"><code class="function-signature">publicBuyCompleteSets(contract IMarket _market, uint256 _amount)</code></a></li><li><a href="#ParaShareToken.buyCompleteSets(contract IMarket,address,uint256)"><code class="function-signature">buyCompleteSets(contract IMarket _market, address _account, uint256 _amount)</code></a></li><li><a href="#ParaShareToken.buyCompleteSetsInternal(contract IMarket,address,uint256)"><code class="function-signature">buyCompleteSetsInternal(contract IMarket _market, address _account, uint256 _amount)</code></a></li><li><a href="#ParaShareToken.buyCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address)"><code class="function-signature">buyCompleteSetsForTrade(contract IMarket _market, uint256 _amount, uint256 _longOutcome, address _longRecipient, address _shortRecipient)</code></a></li><li><a href="#ParaShareToken.publicSellCompleteSets(contract IMarket,uint256)"><code class="function-signature">publicSellCompleteSets(contract IMarket _market, uint256 _amount)</code></a></li><li><a href="#ParaShareToken.sellCompleteSets(contract IMarket,address,address,uint256,bytes32)"><code class="function-signature">sellCompleteSets(contract IMarket _market, address _holder, address _recipient, uint256 _amount, bytes32 _fingerprint)</code></a></li><li><a href="#ParaShareToken.sellCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address,address,address,uint256,address,bytes32)"><code class="function-signature">sellCompleteSetsForTrade(contract IMarket _market, uint256 _outcome, uint256 _amount, address _shortParticipant, address _longParticipant, address _shortRecipient, address _longRecipient, uint256 _price, address _sourceAccount, bytes32 _fingerprint)</code></a></li><li><a href="#ParaShareToken.claimTradingProceeds(contract IMarket,address,bytes32)"><code class="function-signature">claimTradingProceeds(contract IMarket _market, address _shareHolder, bytes32 _fingerprint)</code></a></li><li><a href="#ParaShareToken.claimTradingProceedsInternal(contract IMarket,address,bytes32)"><code class="function-signature">claimTradingProceedsInternal(contract IMarket _market, address _shareHolder, bytes32 _fingerprint)</code></a></li><li><a href="#ParaShareToken.divideUpWinnings(contract IMarket,contract IParaUniverse,uint256,uint256)"><code class="function-signature">divideUpWinnings(contract IMarket _market, contract IParaUniverse _paraUniverse, uint256 _outcome, uint256 _numberOfShares)</code></a></li><li><a href="#ParaShareToken.calculateProceeds(contract IMarket,uint256,uint256)"><code class="function-signature">calculateProceeds(contract IMarket _market, uint256 _outcome, uint256 _numberOfShares)</code></a></li><li><a href="#ParaShareToken.calculateReportingFee(contract IParaUniverse,uint256)"><code class="function-signature">calculateReportingFee(contract IParaUniverse _paraUniverse, uint256 _amount)</code></a></li><li><a href="#ParaShareToken.calculateCreatorFee(contract IMarket,uint256)"><code class="function-signature">calculateCreatorFee(contract IMarket _market, uint256 _amount)</code></a></li><li><a href="#ParaShareToken.getTypeName()"><code class="function-signature">getTypeName()</code></a></li><li><a href="#ParaShareToken.getMarket(uint256)"><code class="function-signature">getMarket(uint256 _tokenId)</code></a></li><li><a href="#ParaShareToken.getOutcome(uint256)"><code class="function-signature">getOutcome(uint256 _tokenId)</code></a></li><li><a href="#ParaShareToken.totalSupplyForMarketOutcome(contract IMarket,uint256)"><code class="function-signature">totalSupplyForMarketOutcome(contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#ParaShareToken.balanceOfMarketOutcome(contract IMarket,uint256,address)"><code class="function-signature">balanceOfMarketOutcome(contract IMarket _market, uint256 _outcome, address _account)</code></a></li><li><a href="#ParaShareToken.lowestBalanceOfMarketOutcomes(contract IMarket,uint256[],address)"><code class="function-signature">lowestBalanceOfMarketOutcomes(contract IMarket _market, uint256[] _outcomes, address _account)</code></a></li><li><a href="#ParaShareToken.getTokenId(contract IMarket,uint256)"><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#ParaShareToken.getTokenIds(contract IMarket,uint256[])"><code class="function-signature">getTokenIds(contract IMarket _market, uint256[] _outcomes)</code></a></li><li><a href="#ParaShareToken.unpackTokenId(uint256)"><code class="function-signature">unpackTokenId(uint256 _tokenId)</code></a></li><li><a href="#ParaShareToken.onTokenTransfer(uint256,address,address,uint256)"><code class="function-signature">onTokenTransfer(uint256 _tokenId, address _from, address _to, uint256 _value)</code></a></li><li><a href="#ParaShareToken.onMint(uint256,address,uint256)"><code class="function-signature">onMint(uint256 _tokenId, address _target, uint256 _amount)</code></a></li><li><a href="#ParaShareToken.onBurn(uint256,address,uint256)"><code class="function-signature">onBurn(uint256 _tokenId, address _target, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC1155.constructor()"><code class="function-signature">constructor()</code></a></li><li class="inherited"><a href="#ERC1155.balanceOf(address,uint256)"><code class="function-signature">balanceOf(address account, uint256 id)</code></a></li><li class="inherited"><a href="#ERC1155.totalSupply(uint256)"><code class="function-signature">totalSupply(uint256 id)</code></a></li><li class="inherited"><a href="#ERC1155.balanceOfBatch(address[],uint256[])"><code class="function-signature">balanceOfBatch(address[] accounts, uint256[] ids)</code></a></li><li class="inherited"><a href="#ERC1155.setApprovalForAll(address,bool)"><code class="function-signature">setApprovalForAll(address operator, bool approved)</code></a></li><li class="inherited"><a href="#ERC1155.isApprovedForAll(address,address)"><code class="function-signature">isApprovedForAll(address account, address operator)</code></a></li><li class="inherited"><a href="#ERC1155.safeTransferFrom(address,address,uint256,uint256,bytes)"><code class="function-signature">safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes data)</code></a></li><li class="inherited"><a href="#ERC1155._transferFrom(address,address,uint256,uint256,bytes,bool)"><code class="function-signature">_transferFrom(address from, address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155._internalTransferFrom(address,address,uint256,uint256,bytes,bool)"><code class="function-signature">_internalTransferFrom(address from, address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155.safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)"><code class="function-signature">safeBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data)</code></a></li><li class="inherited"><a href="#ERC1155._batchTransferFrom(address,address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_batchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155._internalBatchTransferFrom(address,address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_internalBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155._mint(address,uint256,uint256,bytes,bool)"><code class="function-signature">_mint(address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155._mintBatch(address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_mintBatch(address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155._burn(address,uint256,uint256,bytes,bool)"><code class="function-signature">_burn(address account, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155._burnBatch(address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_burnBatch(address account, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes)"><code class="function-signature">_doSafeTransferAcceptanceCheck(address operator, address from, address to, uint256 id, uint256 value, bytes data)</code></a></li><li class="inherited"><a href="#ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes)"><code class="function-signature">_doSafeBatchTransferAcceptanceCheck(address operator, address from, address to, uint256[] ids, uint256[] values, bytes data)</code></a></li><li class="inherited"><a href="#ERC165.supportsInterface(bytes4)"><code class="function-signature">supportsInterface(bytes4 interfaceId)</code></a></li><li class="inherited"><a href="#ERC165._registerInterface(bytes4)"><code class="function-signature">_registerInterface(bytes4 interfaceId)</code></a></li><li class="inherited"><a href="#Initializable.endInitialization()"><code class="function-signature">endInitialization()</code></a></li><li class="inherited"><a href="#Initializable.getInitialized()"><code class="function-signature">getInitialized()</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC1155.TransferSingle(address,address,address,uint256,uint256)"><code class="function-signature">TransferSingle(address operator, address from, address to, uint256 id, uint256 value)</code></a></li><li class="inherited"><a href="#IERC1155.TransferBatch(address,address,address,uint256[],uint256[])"><code class="function-signature">TransferBatch(address operator, address from, address to, uint256[] ids, uint256[] values)</code></a></li><li class="inherited"><a href="#IERC1155.ApprovalForAll(address,address,bool)"><code class="function-signature">ApprovalForAll(address owner, address operator, bool approved)</code></a></li><li class="inherited"><a href="#IERC1155.URI(string,uint256)"><code class="function-signature">URI(string value, uint256 id)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.initialize(address,contract ShareToken)"></a><code class="function-signature">initialize(address _augur, contract ShareToken _originalShareToken)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.approveUniverse(contract IParaUniverse)"></a><code class="function-signature">approveUniverse(contract IParaUniverse _paraUniverse)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.unsafeTransferFrom(address,address,uint256,uint256)"></a><code class="function-signature">unsafeTransferFrom(address _from, address _to, uint256 _id, uint256 _value)</code><span class="function-visibility">external</span></h4>

Transfers `value` amount of an `id` from the `from` address to the `to` address specified.
Caller must be approved to manage the tokens being transferred out of the `from` account.
Regardless of if the desintation is a contract or not this will not call `onERC1155Received` on `to`




<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.unsafeBatchTransferFrom(address,address,uint256[],uint256[])"></a><code class="function-signature">unsafeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values)</code><span class="function-visibility">external</span></h4>

Transfers `values` amount(s) of `ids` from the `from` address to the
`to` address specified. Caller must be approved to manage the tokens being
transferred out of the `from` account. Regardless of if the desintation is
a contract or not this will not call `onERC1155Received` on `to`




<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.initializeMarket(contract IMarket)"></a><code class="function-signature">initializeMarket(contract IMarket _market)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.isMarketInitialized(contract IMarket)"></a><code class="function-signature">isMarketInitialized(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.publicBuyCompleteSets(contract IMarket,uint256)"></a><code class="function-signature">publicBuyCompleteSets(contract IMarket _market, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.buyCompleteSets(contract IMarket,address,uint256)"></a><code class="function-signature">buyCompleteSets(contract IMarket _market, address _account, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.buyCompleteSetsInternal(contract IMarket,address,uint256)"></a><code class="function-signature">buyCompleteSetsInternal(contract IMarket _market, address _account, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.buyCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address)"></a><code class="function-signature">buyCompleteSetsForTrade(contract IMarket _market, uint256 _amount, uint256 _longOutcome, address _longRecipient, address _shortRecipient) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.publicSellCompleteSets(contract IMarket,uint256)"></a><code class="function-signature">publicSellCompleteSets(contract IMarket _market, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.sellCompleteSets(contract IMarket,address,address,uint256,bytes32)"></a><code class="function-signature">sellCompleteSets(contract IMarket _market, address _holder, address _recipient, uint256 _amount, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.sellCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address,address,address,uint256,address,bytes32)"></a><code class="function-signature">sellCompleteSetsForTrade(contract IMarket _market, uint256 _outcome, uint256 _amount, address _shortParticipant, address _longParticipant, address _shortRecipient, address _longRecipient, uint256 _price, address _sourceAccount, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.claimTradingProceeds(contract IMarket,address,bytes32)"></a><code class="function-signature">claimTradingProceeds(contract IMarket _market, address _shareHolder, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.claimTradingProceedsInternal(contract IMarket,address,bytes32)"></a><code class="function-signature">claimTradingProceedsInternal(contract IMarket _market, address _shareHolder, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.divideUpWinnings(contract IMarket,contract IParaUniverse,uint256,uint256)"></a><code class="function-signature">divideUpWinnings(contract IMarket _market, contract IParaUniverse _paraUniverse, uint256 _outcome, uint256 _numberOfShares) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256,uint256,uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.calculateProceeds(contract IMarket,uint256,uint256)"></a><code class="function-signature">calculateProceeds(contract IMarket _market, uint256 _outcome, uint256 _numberOfShares) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.calculateReportingFee(contract IParaUniverse,uint256)"></a><code class="function-signature">calculateReportingFee(contract IParaUniverse _paraUniverse, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.calculateCreatorFee(contract IMarket,uint256)"></a><code class="function-signature">calculateCreatorFee(contract IMarket _market, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.getTypeName()"></a><code class="function-signature">getTypeName() <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.getMarket(uint256)"></a><code class="function-signature">getMarket(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.getOutcome(uint256)"></a><code class="function-signature">getOutcome(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.totalSupplyForMarketOutcome(contract IMarket,uint256)"></a><code class="function-signature">totalSupplyForMarketOutcome(contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.balanceOfMarketOutcome(contract IMarket,uint256,address)"></a><code class="function-signature">balanceOfMarketOutcome(contract IMarket _market, uint256 _outcome, address _account) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.lowestBalanceOfMarketOutcomes(contract IMarket,uint256[],address)"></a><code class="function-signature">lowestBalanceOfMarketOutcomes(contract IMarket _market, uint256[] _outcomes, address _account) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.getTokenId(contract IMarket,uint256)"></a><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.getTokenIds(contract IMarket,uint256[])"></a><code class="function-signature">getTokenIds(contract IMarket _market, uint256[] _outcomes) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.unpackTokenId(uint256)"></a><code class="function-signature">unpackTokenId(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">address,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.onTokenTransfer(uint256,address,address,uint256)"></a><code class="function-signature">onTokenTransfer(uint256 _tokenId, address _from, address _to, uint256 _value)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.onMint(uint256,address,uint256)"></a><code class="function-signature">onMint(uint256 _tokenId, address _target, uint256 _amount)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ParaShareToken.onBurn(uint256,address,uint256)"></a><code class="function-signature">onBurn(uint256 _tokenId, address _target, uint256 _amount)</code><span class="function-visibility">internal</span></h4>







### `PredicateRegistry`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#PredicateRegistry.mapMarket(address,address,uint256,uint256)"><code class="function-signature">mapMarket(address childMarket, address rootMarket, uint256 numOutcomes, uint256 numTicks)</code></a></li><li><a href="#PredicateRegistry.setZeroXTrade(address)"><code class="function-signature">setZeroXTrade(address _zeroXTrade)</code></a></li><li><a href="#PredicateRegistry.setZeroXExchange(address,address,bool)"><code class="function-signature">setZeroXExchange(address childExchange, address rootExchange, bool isDefaultExchange)</code></a></li><li><a href="#PredicateRegistry.setCash(address)"><code class="function-signature">setCash(address _cash)</code></a></li><li><a href="#PredicateRegistry.setShareToken(address)"><code class="function-signature">setShareToken(address _shareToken)</code></a></li><li><a href="#PredicateRegistry.getDeprecationType(address)"><code class="function-signature">getDeprecationType(address addr)</code></a></li><li><a href="#PredicateRegistry.getContractType(address)"><code class="function-signature">getContractType(address addr)</code></a></li><li><a href="#PredicateRegistry.onTransferOwnership(address,address)"><code class="function-signature">onTransferOwnership(address, address)</code></a></li><li class="inherited"><a href="#Ownable.constructor()"><code class="function-signature">constructor()</code></a></li><li class="inherited"><a href="#Ownable.getOwner()"><code class="function-signature">getOwner()</code></a></li><li class="inherited"><a href="#Ownable.transferOwnership(address)"><code class="function-signature">transferOwnership(address _newOwner)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="PredicateRegistry.mapMarket(address,address,uint256,uint256)"></a><code class="function-signature">mapMarket(address childMarket, address rootMarket, uint256 numOutcomes, uint256 numTicks)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="PredicateRegistry.setZeroXTrade(address)"></a><code class="function-signature">setZeroXTrade(address _zeroXTrade)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="PredicateRegistry.setZeroXExchange(address,address,bool)"></a><code class="function-signature">setZeroXExchange(address childExchange, address rootExchange, bool isDefaultExchange)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="PredicateRegistry.setCash(address)"></a><code class="function-signature">setCash(address _cash)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="PredicateRegistry.setShareToken(address)"></a><code class="function-signature">setShareToken(address _shareToken)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="PredicateRegistry.getDeprecationType(address)"></a><code class="function-signature">getDeprecationType(address addr) <span class="return-arrow">→</span> <span class="return-type">enum PredicateRegistry.DeprecationType</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="PredicateRegistry.getContractType(address)"></a><code class="function-signature">getContractType(address addr) <span class="return-arrow">→</span> <span class="return-type">enum PredicateRegistry.ContractType</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="PredicateRegistry.onTransferOwnership(address,address)"></a><code class="function-signature">onTransferOwnership(address, address)</code><span class="function-visibility">internal</span></h4>







### `ProofReader`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#ProofReader.convertToExitPayload(bytes)"><code class="function-signature">convertToExitPayload(bytes data)</code></a></li><li><a href="#ProofReader.convertToTx(bytes)"><code class="function-signature">convertToTx(bytes data)</code></a></li><li><a href="#ProofReader.getLogIndex(struct RLPReader.RLPItem[])"><code class="function-signature">getLogIndex(struct RLPReader.RLPItem[] payload)</code></a></li><li><a href="#ProofReader.getReceipt(struct RLPReader.RLPItem[])"><code class="function-signature">getReceipt(struct RLPReader.RLPItem[] payload)</code></a></li><li><a href="#ProofReader.getLog(struct RLPReader.RLPItem[])"><code class="function-signature">getLog(struct RLPReader.RLPItem[] payload)</code></a></li><li><a href="#ProofReader.getLogEmitterAddress(struct RLPReader.RLPItem[])"><code class="function-signature">getLogEmitterAddress(struct RLPReader.RLPItem[] log)</code></a></li><li><a href="#ProofReader.getLogTopics(struct RLPReader.RLPItem[])"><code class="function-signature">getLogTopics(struct RLPReader.RLPItem[] log)</code></a></li><li><a href="#ProofReader.getChallengeTxBytes(struct RLPReader.RLPItem[])"><code class="function-signature">getChallengeTxBytes(struct RLPReader.RLPItem[] payload)</code></a></li><li><a href="#ProofReader.getChallengeTx(struct RLPReader.RLPItem[])"><code class="function-signature">getChallengeTx(struct RLPReader.RLPItem[] payload)</code></a></li><li><a href="#ProofReader.getTxNonce(struct RLPReader.RLPItem[])"><code class="function-signature">getTxNonce(struct RLPReader.RLPItem[] _tx)</code></a></li><li><a href="#ProofReader.getTxTo(struct RLPReader.RLPItem[])"><code class="function-signature">getTxTo(struct RLPReader.RLPItem[] _tx)</code></a></li><li><a href="#ProofReader.getTxData(struct RLPReader.RLPItem[])"><code class="function-signature">getTxData(struct RLPReader.RLPItem[] _tx)</code></a></li><li><a href="#ProofReader.getFunctionSignature(bytes)"><code class="function-signature">getFunctionSignature(bytes data)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="ProofReader.convertToExitPayload(bytes)"></a><code class="function-signature">convertToExitPayload(bytes data) <span class="return-arrow">→</span> <span class="return-type">struct RLPReader.RLPItem[]</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ProofReader.convertToTx(bytes)"></a><code class="function-signature">convertToTx(bytes data) <span class="return-arrow">→</span> <span class="return-type">struct RLPReader.RLPItem[]</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ProofReader.getLogIndex(struct RLPReader.RLPItem[])"></a><code class="function-signature">getLogIndex(struct RLPReader.RLPItem[] payload) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ProofReader.getReceipt(struct RLPReader.RLPItem[])"></a><code class="function-signature">getReceipt(struct RLPReader.RLPItem[] payload) <span class="return-arrow">→</span> <span class="return-type">struct RLPReader.RLPItem[]</span></code><span class="function-visibility">internal</span></h4>

Receipt structred as:
0: Status
1: CumulativeGasUsed
2: LogsBloom
3: Logs - array of [address, [topics], data]



<h4><a class="anchor" aria-hidden="true" id="ProofReader.getLog(struct RLPReader.RLPItem[])"></a><code class="function-signature">getLog(struct RLPReader.RLPItem[] payload) <span class="return-arrow">→</span> <span class="return-type">struct RLPReader.RLPItem[]</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ProofReader.getLogEmitterAddress(struct RLPReader.RLPItem[])"></a><code class="function-signature">getLogEmitterAddress(struct RLPReader.RLPItem[] log) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ProofReader.getLogTopics(struct RLPReader.RLPItem[])"></a><code class="function-signature">getLogTopics(struct RLPReader.RLPItem[] log) <span class="return-arrow">→</span> <span class="return-type">struct RLPReader.RLPItem[]</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ProofReader.getChallengeTxBytes(struct RLPReader.RLPItem[])"></a><code class="function-signature">getChallengeTxBytes(struct RLPReader.RLPItem[] payload) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ProofReader.getChallengeTx(struct RLPReader.RLPItem[])"></a><code class="function-signature">getChallengeTx(struct RLPReader.RLPItem[] payload) <span class="return-arrow">→</span> <span class="return-type">struct RLPReader.RLPItem[]</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ProofReader.getTxNonce(struct RLPReader.RLPItem[])"></a><code class="function-signature">getTxNonce(struct RLPReader.RLPItem[] _tx) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ProofReader.getTxTo(struct RLPReader.RLPItem[])"></a><code class="function-signature">getTxTo(struct RLPReader.RLPItem[] _tx) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ProofReader.getTxData(struct RLPReader.RLPItem[])"></a><code class="function-signature">getTxData(struct RLPReader.RLPItem[] _tx) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ProofReader.getFunctionSignature(bytes)"></a><code class="function-signature">getFunctionSignature(bytes data) <span class="return-arrow">→</span> <span class="return-type">bytes4</span></code><span class="function-visibility">internal</span></h4>







### `RLPEncode`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#RLPEncode.encodeItem(bytes)"><code class="function-signature">encodeItem(bytes self)</code></a></li><li><a href="#RLPEncode.encodeList(bytes[])"><code class="function-signature">encodeList(bytes[] self)</code></a></li><li><a href="#RLPEncode.encodeLength(uint256,uint256)"><code class="function-signature">encodeLength(uint256 L, uint256 offset)</code></a></li><li><a href="#RLPEncode.getLengthBytes(uint256)"><code class="function-signature">getLengthBytes(uint256 x)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="RLPEncode.encodeItem(bytes)"></a><code class="function-signature">encodeItem(bytes self) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPEncode.encodeList(bytes[])"></a><code class="function-signature">encodeList(bytes[] self) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPEncode.encodeLength(uint256,uint256)"></a><code class="function-signature">encodeLength(uint256 L, uint256 offset) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPEncode.getLengthBytes(uint256)"></a><code class="function-signature">getLengthBytes(uint256 x) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>







### `RLPReader`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#RLPReader.next(struct RLPReader.Iterator)"><code class="function-signature">next(struct RLPReader.Iterator self)</code></a></li><li><a href="#RLPReader.hasNext(struct RLPReader.Iterator)"><code class="function-signature">hasNext(struct RLPReader.Iterator self)</code></a></li><li><a href="#RLPReader.toRlpItem(bytes)"><code class="function-signature">toRlpItem(bytes item)</code></a></li><li><a href="#RLPReader.iterator(struct RLPReader.RLPItem)"><code class="function-signature">iterator(struct RLPReader.RLPItem self)</code></a></li><li><a href="#RLPReader.rlpLen(struct RLPReader.RLPItem)"><code class="function-signature">rlpLen(struct RLPReader.RLPItem item)</code></a></li><li><a href="#RLPReader.payloadLen(struct RLPReader.RLPItem)"><code class="function-signature">payloadLen(struct RLPReader.RLPItem item)</code></a></li><li><a href="#RLPReader.toList(struct RLPReader.RLPItem)"><code class="function-signature">toList(struct RLPReader.RLPItem item)</code></a></li><li><a href="#RLPReader.isList(struct RLPReader.RLPItem)"><code class="function-signature">isList(struct RLPReader.RLPItem item)</code></a></li><li><a href="#RLPReader.toRlpBytes(struct RLPReader.RLPItem)"><code class="function-signature">toRlpBytes(struct RLPReader.RLPItem item)</code></a></li><li><a href="#RLPReader.toBoolean(struct RLPReader.RLPItem)"><code class="function-signature">toBoolean(struct RLPReader.RLPItem item)</code></a></li><li><a href="#RLPReader.toAddress(struct RLPReader.RLPItem)"><code class="function-signature">toAddress(struct RLPReader.RLPItem item)</code></a></li><li><a href="#RLPReader.toUint(struct RLPReader.RLPItem)"><code class="function-signature">toUint(struct RLPReader.RLPItem item)</code></a></li><li><a href="#RLPReader.toUintStrict(struct RLPReader.RLPItem)"><code class="function-signature">toUintStrict(struct RLPReader.RLPItem item)</code></a></li><li><a href="#RLPReader.toBytes(struct RLPReader.RLPItem)"><code class="function-signature">toBytes(struct RLPReader.RLPItem item)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="RLPReader.next(struct RLPReader.Iterator)"></a><code class="function-signature">next(struct RLPReader.Iterator self) <span class="return-arrow">→</span> <span class="return-type">struct RLPReader.RLPItem</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPReader.hasNext(struct RLPReader.Iterator)"></a><code class="function-signature">hasNext(struct RLPReader.Iterator self) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPReader.toRlpItem(bytes)"></a><code class="function-signature">toRlpItem(bytes item) <span class="return-arrow">→</span> <span class="return-type">struct RLPReader.RLPItem</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPReader.iterator(struct RLPReader.RLPItem)"></a><code class="function-signature">iterator(struct RLPReader.RLPItem self) <span class="return-arrow">→</span> <span class="return-type">struct RLPReader.Iterator</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPReader.rlpLen(struct RLPReader.RLPItem)"></a><code class="function-signature">rlpLen(struct RLPReader.RLPItem item) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPReader.payloadLen(struct RLPReader.RLPItem)"></a><code class="function-signature">payloadLen(struct RLPReader.RLPItem item) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPReader.toList(struct RLPReader.RLPItem)"></a><code class="function-signature">toList(struct RLPReader.RLPItem item) <span class="return-arrow">→</span> <span class="return-type">struct RLPReader.RLPItem[]</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPReader.isList(struct RLPReader.RLPItem)"></a><code class="function-signature">isList(struct RLPReader.RLPItem item) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPReader.toRlpBytes(struct RLPReader.RLPItem)"></a><code class="function-signature">toRlpBytes(struct RLPReader.RLPItem item) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPReader.toBoolean(struct RLPReader.RLPItem)"></a><code class="function-signature">toBoolean(struct RLPReader.RLPItem item) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPReader.toAddress(struct RLPReader.RLPItem)"></a><code class="function-signature">toAddress(struct RLPReader.RLPItem item) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPReader.toUint(struct RLPReader.RLPItem)"></a><code class="function-signature">toUint(struct RLPReader.RLPItem item) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPReader.toUintStrict(struct RLPReader.RLPItem)"></a><code class="function-signature">toUintStrict(struct RLPReader.RLPItem item) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="RLPReader.toBytes(struct RLPReader.RLPItem)"></a><code class="function-signature">toBytes(struct RLPReader.RLPItem item) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>







### `ReentrancyGuard`



<div class="contract-index"></div>





### `SafeMathUint256`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#SafeMathUint256.mul(uint256,uint256)"><code class="function-signature">mul(uint256 a, uint256 b)</code></a></li><li><a href="#SafeMathUint256.div(uint256,uint256)"><code class="function-signature">div(uint256 a, uint256 b)</code></a></li><li><a href="#SafeMathUint256.sub(uint256,uint256)"><code class="function-signature">sub(uint256 a, uint256 b)</code></a></li><li><a href="#SafeMathUint256.subS(uint256,uint256,string)"><code class="function-signature">subS(uint256 a, uint256 b, string message)</code></a></li><li><a href="#SafeMathUint256.add(uint256,uint256)"><code class="function-signature">add(uint256 a, uint256 b)</code></a></li><li><a href="#SafeMathUint256.min(uint256,uint256)"><code class="function-signature">min(uint256 a, uint256 b)</code></a></li><li><a href="#SafeMathUint256.max(uint256,uint256)"><code class="function-signature">max(uint256 a, uint256 b)</code></a></li><li><a href="#SafeMathUint256.sqrt(uint256)"><code class="function-signature">sqrt(uint256 y)</code></a></li><li><a href="#SafeMathUint256.getUint256Min()"><code class="function-signature">getUint256Min()</code></a></li><li><a href="#SafeMathUint256.getUint256Max()"><code class="function-signature">getUint256Max()</code></a></li><li><a href="#SafeMathUint256.isMultipleOf(uint256,uint256)"><code class="function-signature">isMultipleOf(uint256 a, uint256 b)</code></a></li><li><a href="#SafeMathUint256.fxpMul(uint256,uint256,uint256)"><code class="function-signature">fxpMul(uint256 a, uint256 b, uint256 base)</code></a></li><li><a href="#SafeMathUint256.fxpDiv(uint256,uint256,uint256)"><code class="function-signature">fxpDiv(uint256 a, uint256 b, uint256 base)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="SafeMathUint256.mul(uint256,uint256)"></a><code class="function-signature">mul(uint256 a, uint256 b) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="SafeMathUint256.div(uint256,uint256)"></a><code class="function-signature">div(uint256 a, uint256 b) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="SafeMathUint256.sub(uint256,uint256)"></a><code class="function-signature">sub(uint256 a, uint256 b) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="SafeMathUint256.subS(uint256,uint256,string)"></a><code class="function-signature">subS(uint256 a, uint256 b, string message) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="SafeMathUint256.add(uint256,uint256)"></a><code class="function-signature">add(uint256 a, uint256 b) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="SafeMathUint256.min(uint256,uint256)"></a><code class="function-signature">min(uint256 a, uint256 b) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="SafeMathUint256.max(uint256,uint256)"></a><code class="function-signature">max(uint256 a, uint256 b) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="SafeMathUint256.sqrt(uint256)"></a><code class="function-signature">sqrt(uint256 y) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="SafeMathUint256.getUint256Min()"></a><code class="function-signature">getUint256Min() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="SafeMathUint256.getUint256Max()"></a><code class="function-signature">getUint256Max() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="SafeMathUint256.isMultipleOf(uint256,uint256)"></a><code class="function-signature">isMultipleOf(uint256 a, uint256 b) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="SafeMathUint256.fxpMul(uint256,uint256,uint256)"></a><code class="function-signature">fxpMul(uint256 a, uint256 b, uint256 base) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="SafeMathUint256.fxpDiv(uint256,uint256,uint256)"></a><code class="function-signature">fxpDiv(uint256 a, uint256 b, uint256 base) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>







### `ShareToken`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#ShareToken.initialize(contract IAugur)"><code class="function-signature">initialize(contract IAugur _augur)</code></a></li><li><a href="#ShareToken.unsafeTransferFrom(address,address,uint256,uint256)"><code class="function-signature">unsafeTransferFrom(address _from, address _to, uint256 _id, uint256 _value)</code></a></li><li><a href="#ShareToken.unsafeBatchTransferFrom(address,address,uint256[],uint256[])"><code class="function-signature">unsafeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values)</code></a></li><li><a href="#ShareToken.initializeMarket(contract IMarket,uint256,uint256)"><code class="function-signature">initializeMarket(contract IMarket _market, uint256 _numOutcomes, uint256 _numTicks)</code></a></li><li><a href="#ShareToken.publicBuyCompleteSets(contract IMarket,uint256)"><code class="function-signature">publicBuyCompleteSets(contract IMarket _market, uint256 _amount)</code></a></li><li><a href="#ShareToken.buyCompleteSets(contract IMarket,address,uint256)"><code class="function-signature">buyCompleteSets(contract IMarket _market, address _account, uint256 _amount)</code></a></li><li><a href="#ShareToken.buyCompleteSetsInternal(contract IMarket,address,uint256)"><code class="function-signature">buyCompleteSetsInternal(contract IMarket _market, address _account, uint256 _amount)</code></a></li><li><a href="#ShareToken.buyCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address)"><code class="function-signature">buyCompleteSetsForTrade(contract IMarket _market, uint256 _amount, uint256 _longOutcome, address _longRecipient, address _shortRecipient)</code></a></li><li><a href="#ShareToken.publicSellCompleteSets(contract IMarket,uint256)"><code class="function-signature">publicSellCompleteSets(contract IMarket _market, uint256 _amount)</code></a></li><li><a href="#ShareToken.sellCompleteSets(contract IMarket,address,address,uint256,bytes32)"><code class="function-signature">sellCompleteSets(contract IMarket _market, address _holder, address _recipient, uint256 _amount, bytes32 _fingerprint)</code></a></li><li><a href="#ShareToken.sellCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address,address,address,uint256,address,bytes32)"><code class="function-signature">sellCompleteSetsForTrade(contract IMarket _market, uint256 _outcome, uint256 _amount, address _shortParticipant, address _longParticipant, address _shortRecipient, address _longRecipient, uint256 _price, address _sourceAccount, bytes32 _fingerprint)</code></a></li><li><a href="#ShareToken.claimTradingProceeds(contract IMarket,address,bytes32)"><code class="function-signature">claimTradingProceeds(contract IMarket _market, address _shareHolder, bytes32 _fingerprint)</code></a></li><li><a href="#ShareToken.claimTradingProceedsInternal(contract IMarket,address,bytes32)"><code class="function-signature">claimTradingProceedsInternal(contract IMarket _market, address _shareHolder, bytes32 _fingerprint)</code></a></li><li><a href="#ShareToken.divideUpWinnings(contract IMarket,uint256,uint256)"><code class="function-signature">divideUpWinnings(contract IMarket _market, uint256 _outcome, uint256 _numberOfShares)</code></a></li><li><a href="#ShareToken.calculateProceeds(contract IMarket,uint256,uint256)"><code class="function-signature">calculateProceeds(contract IMarket _market, uint256 _outcome, uint256 _numberOfShares)</code></a></li><li><a href="#ShareToken.calculateReportingFee(contract IMarket,uint256)"><code class="function-signature">calculateReportingFee(contract IMarket _market, uint256 _amount)</code></a></li><li><a href="#ShareToken.calculateCreatorFee(contract IMarket,uint256)"><code class="function-signature">calculateCreatorFee(contract IMarket _market, uint256 _amount)</code></a></li><li><a href="#ShareToken.getTypeName()"><code class="function-signature">getTypeName()</code></a></li><li><a href="#ShareToken.getMarket(uint256)"><code class="function-signature">getMarket(uint256 _tokenId)</code></a></li><li><a href="#ShareToken.getOutcome(uint256)"><code class="function-signature">getOutcome(uint256 _tokenId)</code></a></li><li><a href="#ShareToken.totalSupplyForMarketOutcome(contract IMarket,uint256)"><code class="function-signature">totalSupplyForMarketOutcome(contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#ShareToken.balanceOfMarketOutcome(contract IMarket,uint256,address)"><code class="function-signature">balanceOfMarketOutcome(contract IMarket _market, uint256 _outcome, address _account)</code></a></li><li><a href="#ShareToken.lowestBalanceOfMarketOutcomes(contract IMarket,uint256[],address)"><code class="function-signature">lowestBalanceOfMarketOutcomes(contract IMarket _market, uint256[] _outcomes, address _account)</code></a></li><li><a href="#ShareToken.assertBalances(contract IMarket)"><code class="function-signature">assertBalances(contract IMarket _market)</code></a></li><li><a href="#ShareToken.getTokenId(contract IMarket,uint256)"><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#ShareToken.getTokenIds(contract IMarket,uint256[])"><code class="function-signature">getTokenIds(contract IMarket _market, uint256[] _outcomes)</code></a></li><li><a href="#ShareToken.unpackTokenId(uint256)"><code class="function-signature">unpackTokenId(uint256 _tokenId)</code></a></li><li><a href="#ShareToken.onTokenTransfer(uint256,address,address,uint256)"><code class="function-signature">onTokenTransfer(uint256 _tokenId, address _from, address _to, uint256 _value)</code></a></li><li><a href="#ShareToken.onMint(uint256,address,uint256)"><code class="function-signature">onMint(uint256 _tokenId, address _target, uint256 _amount)</code></a></li><li><a href="#ShareToken.onBurn(uint256,address,uint256)"><code class="function-signature">onBurn(uint256 _tokenId, address _target, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC1155.constructor()"><code class="function-signature">constructor()</code></a></li><li class="inherited"><a href="#ERC1155.balanceOf(address,uint256)"><code class="function-signature">balanceOf(address account, uint256 id)</code></a></li><li class="inherited"><a href="#ERC1155.totalSupply(uint256)"><code class="function-signature">totalSupply(uint256 id)</code></a></li><li class="inherited"><a href="#ERC1155.balanceOfBatch(address[],uint256[])"><code class="function-signature">balanceOfBatch(address[] accounts, uint256[] ids)</code></a></li><li class="inherited"><a href="#ERC1155.setApprovalForAll(address,bool)"><code class="function-signature">setApprovalForAll(address operator, bool approved)</code></a></li><li class="inherited"><a href="#ERC1155.isApprovedForAll(address,address)"><code class="function-signature">isApprovedForAll(address account, address operator)</code></a></li><li class="inherited"><a href="#ERC1155.safeTransferFrom(address,address,uint256,uint256,bytes)"><code class="function-signature">safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes data)</code></a></li><li class="inherited"><a href="#ERC1155._transferFrom(address,address,uint256,uint256,bytes,bool)"><code class="function-signature">_transferFrom(address from, address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155._internalTransferFrom(address,address,uint256,uint256,bytes,bool)"><code class="function-signature">_internalTransferFrom(address from, address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155.safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)"><code class="function-signature">safeBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data)</code></a></li><li class="inherited"><a href="#ERC1155._batchTransferFrom(address,address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_batchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155._internalBatchTransferFrom(address,address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_internalBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155._mint(address,uint256,uint256,bytes,bool)"><code class="function-signature">_mint(address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155._mintBatch(address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_mintBatch(address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155._burn(address,uint256,uint256,bytes,bool)"><code class="function-signature">_burn(address account, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155._burnBatch(address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_burnBatch(address account, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="#ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes)"><code class="function-signature">_doSafeTransferAcceptanceCheck(address operator, address from, address to, uint256 id, uint256 value, bytes data)</code></a></li><li class="inherited"><a href="#ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes)"><code class="function-signature">_doSafeBatchTransferAcceptanceCheck(address operator, address from, address to, uint256[] ids, uint256[] values, bytes data)</code></a></li><li class="inherited"><a href="#ERC165.supportsInterface(bytes4)"><code class="function-signature">supportsInterface(bytes4 interfaceId)</code></a></li><li class="inherited"><a href="#ERC165._registerInterface(bytes4)"><code class="function-signature">_registerInterface(bytes4 interfaceId)</code></a></li><li class="inherited"><a href="#Initializable.endInitialization()"><code class="function-signature">endInitialization()</code></a></li><li class="inherited"><a href="#Initializable.getInitialized()"><code class="function-signature">getInitialized()</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC1155.TransferSingle(address,address,address,uint256,uint256)"><code class="function-signature">TransferSingle(address operator, address from, address to, uint256 id, uint256 value)</code></a></li><li class="inherited"><a href="#IERC1155.TransferBatch(address,address,address,uint256[],uint256[])"><code class="function-signature">TransferBatch(address operator, address from, address to, uint256[] ids, uint256[] values)</code></a></li><li class="inherited"><a href="#IERC1155.ApprovalForAll(address,address,bool)"><code class="function-signature">ApprovalForAll(address owner, address operator, bool approved)</code></a></li><li class="inherited"><a href="#IERC1155.URI(string,uint256)"><code class="function-signature">URI(string value, uint256 id)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="ShareToken.initialize(contract IAugur)"></a><code class="function-signature">initialize(contract IAugur _augur)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.unsafeTransferFrom(address,address,uint256,uint256)"></a><code class="function-signature">unsafeTransferFrom(address _from, address _to, uint256 _id, uint256 _value)</code><span class="function-visibility">public</span></h4>

Transfers `value` amount of an `id` from the `from` address to the `to` address specified.
Caller must be approved to manage the tokens being transferred out of the `from` account.
Regardless of if the desintation is a contract or not this will not call `onERC1155Received` on `to`




<h4><a class="anchor" aria-hidden="true" id="ShareToken.unsafeBatchTransferFrom(address,address,uint256[],uint256[])"></a><code class="function-signature">unsafeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values)</code><span class="function-visibility">public</span></h4>

Transfers `values` amount(s) of `ids` from the `from` address to the
`to` address specified. Caller must be approved to manage the tokens being
transferred out of the `from` account. Regardless of if the desintation is
a contract or not this will not call `onERC1155Received` on `to`




<h4><a class="anchor" aria-hidden="true" id="ShareToken.initializeMarket(contract IMarket,uint256,uint256)"></a><code class="function-signature">initializeMarket(contract IMarket _market, uint256 _numOutcomes, uint256 _numTicks)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.publicBuyCompleteSets(contract IMarket,uint256)"></a><code class="function-signature">publicBuyCompleteSets(contract IMarket _market, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.buyCompleteSets(contract IMarket,address,uint256)"></a><code class="function-signature">buyCompleteSets(contract IMarket _market, address _account, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.buyCompleteSetsInternal(contract IMarket,address,uint256)"></a><code class="function-signature">buyCompleteSetsInternal(contract IMarket _market, address _account, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.buyCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address)"></a><code class="function-signature">buyCompleteSetsForTrade(contract IMarket _market, uint256 _amount, uint256 _longOutcome, address _longRecipient, address _shortRecipient) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.publicSellCompleteSets(contract IMarket,uint256)"></a><code class="function-signature">publicSellCompleteSets(contract IMarket _market, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.sellCompleteSets(contract IMarket,address,address,uint256,bytes32)"></a><code class="function-signature">sellCompleteSets(contract IMarket _market, address _holder, address _recipient, uint256 _amount, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.sellCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address,address,address,uint256,address,bytes32)"></a><code class="function-signature">sellCompleteSetsForTrade(contract IMarket _market, uint256 _outcome, uint256 _amount, address _shortParticipant, address _longParticipant, address _shortRecipient, address _longRecipient, uint256 _price, address _sourceAccount, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.claimTradingProceeds(contract IMarket,address,bytes32)"></a><code class="function-signature">claimTradingProceeds(contract IMarket _market, address _shareHolder, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.claimTradingProceedsInternal(contract IMarket,address,bytes32)"></a><code class="function-signature">claimTradingProceedsInternal(contract IMarket _market, address _shareHolder, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.divideUpWinnings(contract IMarket,uint256,uint256)"></a><code class="function-signature">divideUpWinnings(contract IMarket _market, uint256 _outcome, uint256 _numberOfShares) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256,uint256,uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.calculateProceeds(contract IMarket,uint256,uint256)"></a><code class="function-signature">calculateProceeds(contract IMarket _market, uint256 _outcome, uint256 _numberOfShares) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.calculateReportingFee(contract IMarket,uint256)"></a><code class="function-signature">calculateReportingFee(contract IMarket _market, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.calculateCreatorFee(contract IMarket,uint256)"></a><code class="function-signature">calculateCreatorFee(contract IMarket _market, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.getTypeName()"></a><code class="function-signature">getTypeName() <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.getMarket(uint256)"></a><code class="function-signature">getMarket(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.getOutcome(uint256)"></a><code class="function-signature">getOutcome(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.totalSupplyForMarketOutcome(contract IMarket,uint256)"></a><code class="function-signature">totalSupplyForMarketOutcome(contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.balanceOfMarketOutcome(contract IMarket,uint256,address)"></a><code class="function-signature">balanceOfMarketOutcome(contract IMarket _market, uint256 _outcome, address _account) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.lowestBalanceOfMarketOutcomes(contract IMarket,uint256[],address)"></a><code class="function-signature">lowestBalanceOfMarketOutcomes(contract IMarket _market, uint256[] _outcomes, address _account) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.assertBalances(contract IMarket)"></a><code class="function-signature">assertBalances(contract IMarket _market)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.getTokenId(contract IMarket,uint256)"></a><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.getTokenIds(contract IMarket,uint256[])"></a><code class="function-signature">getTokenIds(contract IMarket _market, uint256[] _outcomes) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.unpackTokenId(uint256)"></a><code class="function-signature">unpackTokenId(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">address,uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.onTokenTransfer(uint256,address,address,uint256)"></a><code class="function-signature">onTokenTransfer(uint256 _tokenId, address _from, address _to, uint256 _value)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.onMint(uint256,address,uint256)"></a><code class="function-signature">onMint(uint256 _tokenId, address _target, uint256 _amount)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareToken.onBurn(uint256,address,uint256)"></a><code class="function-signature">onBurn(uint256 _tokenId, address _target, uint256 _amount)</code><span class="function-visibility">internal</span></h4>







### `ShareTokenPredicate`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#ShareTokenPredicate.initialize(contract PredicateRegistry,contract IWithdrawManager)"><code class="function-signature">initialize(contract PredicateRegistry _predicateRegistry, contract IWithdrawManager _withdrawManager)</code></a></li><li><a href="#ShareTokenPredicate.parseData(bytes)"><code class="function-signature">parseData(bytes data)</code></a></li><li><a href="#ShareTokenPredicate.executeInFlightTransaction(bytes,address,contract IExitShareToken)"><code class="function-signature">executeInFlightTransaction(bytes txData, address signer, contract IExitShareToken exitShareToken)</code></a></li><li><a href="#ShareTokenPredicate.isValidDeprecation(bytes)"><code class="function-signature">isValidDeprecation(bytes txData)</code></a></li><li><a href="#ShareTokenPredicate.repackageTokenIds(uint256[])"><code class="function-signature">repackageTokenIds(uint256[] _tokenIds)</code></a></li><li><a href="#ShareTokenPredicate.repackageTokenId(uint256)"><code class="function-signature">repackageTokenId(uint256 _tokenId)</code></a></li><li><a href="#ShareTokenPredicate.getTokenId(contract IMarket,uint256)"><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#ShareTokenPredicate.unpackTokenId(uint256)"><code class="function-signature">unpackTokenId(uint256 _tokenId)</code></a></li><li class="inherited"><a href="matic#Initializable.endInitialization()"><code class="function-signature">endInitialization()</code></a></li><li class="inherited"><a href="matic#Initializable.getInitialized()"><code class="function-signature">getInitialized()</code></a></li></ul><span class="contract-index-title">Events</span><ul><li><a href="#ShareTokenPredicate.ExitFinalized(uint256,address)"><code class="function-signature">ExitFinalized(uint256 exitId, address exitor)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="ShareTokenPredicate.initialize(contract PredicateRegistry,contract IWithdrawManager)"></a><code class="function-signature">initialize(contract PredicateRegistry _predicateRegistry, contract IWithdrawManager _withdrawManager)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareTokenPredicate.parseData(bytes)"></a><code class="function-signature">parseData(bytes data) <span class="return-arrow">→</span> <span class="return-type">address,address,uint256,uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareTokenPredicate.executeInFlightTransaction(bytes,address,contract IExitShareToken)"></a><code class="function-signature">executeInFlightTransaction(bytes txData, address signer, contract IExitShareToken exitShareToken) <span class="return-arrow">→</span> <span class="return-type">int256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareTokenPredicate.isValidDeprecation(bytes)"></a><code class="function-signature">isValidDeprecation(bytes txData) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareTokenPredicate.repackageTokenIds(uint256[])"></a><code class="function-signature">repackageTokenIds(uint256[] _tokenIds) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareTokenPredicate.repackageTokenId(uint256)"></a><code class="function-signature">repackageTokenId(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareTokenPredicate.getTokenId(contract IMarket,uint256)"></a><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ShareTokenPredicate.unpackTokenId(uint256)"></a><code class="function-signature">unpackTokenId(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">address,uint256</span></code><span class="function-visibility">internal</span></h4>







<h4><a class="anchor" aria-hidden="true" id="ShareTokenPredicate.ExitFinalized(uint256,address)"></a><code class="function-signature">ExitFinalized(uint256 exitId, address exitor)</code><span class="function-visibility"></span></h4>





### `TokenId`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#TokenId.getTokenId(address,uint256)"><code class="function-signature">getTokenId(address _market, uint256 _outcome)</code></a></li><li><a href="#TokenId.getTokenId(contract IMarket,uint256)"><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#TokenId.getTokenIds(address,uint256[])"><code class="function-signature">getTokenIds(address _market, uint256[] _outcomes)</code></a></li><li><a href="#TokenId.getTokenIds(contract IMarket,uint256[])"><code class="function-signature">getTokenIds(contract IMarket _market, uint256[] _outcomes)</code></a></li><li><a href="#TokenId.unpackTokenId(uint256)"><code class="function-signature">unpackTokenId(uint256 _tokenId)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="TokenId.getTokenId(address,uint256)"></a><code class="function-signature">getTokenId(address _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="TokenId.getTokenId(contract IMarket,uint256)"></a><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="TokenId.getTokenIds(address,uint256[])"></a><code class="function-signature">getTokenIds(address _market, uint256[] _outcomes) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="TokenId.getTokenIds(contract IMarket,uint256[])"></a><code class="function-signature">getTokenIds(contract IMarket _market, uint256[] _outcomes) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="TokenId.unpackTokenId(uint256)"></a><code class="function-signature">unpackTokenId(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">address,uint256</span></code><span class="function-visibility">internal</span></h4>







### `VariableSupplyToken`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#VariableSupplyToken.mint(address,uint256)"><code class="function-signature">mint(address _target, uint256 _amount)</code></a></li><li><a href="#VariableSupplyToken.burn(address,uint256)"><code class="function-signature">burn(address _target, uint256 _amount)</code></a></li><li><a href="#VariableSupplyToken.onMint(address,uint256)"><code class="function-signature">onMint(address, uint256)</code></a></li><li><a href="#VariableSupplyToken.onBurn(address,uint256)"><code class="function-signature">onBurn(address, uint256)</code></a></li><li class="inherited"><a href="#ERC20.balanceOf(address)"><code class="function-signature">balanceOf(address _account)</code></a></li><li class="inherited"><a href="#ERC20.transfer(address,uint256)"><code class="function-signature">transfer(address _recipient, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20.allowance(address,address)"><code class="function-signature">allowance(address _owner, address _spender)</code></a></li><li class="inherited"><a href="#ERC20.approve(address,uint256)"><code class="function-signature">approve(address _spender, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address _sender, address _recipient, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20.increaseAllowance(address,uint256)"><code class="function-signature">increaseAllowance(address _spender, uint256 _addedValue)</code></a></li><li class="inherited"><a href="#ERC20.decreaseAllowance(address,uint256)"><code class="function-signature">decreaseAllowance(address _spender, uint256 _subtractedValue)</code></a></li><li class="inherited"><a href="#ERC20._transfer(address,address,uint256)"><code class="function-signature">_transfer(address _sender, address _recipient, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20._mint(address,uint256)"><code class="function-signature">_mint(address _account, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20._burn(address,uint256)"><code class="function-signature">_burn(address _account, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20._approve(address,address,uint256)"><code class="function-signature">_approve(address _owner, address _spender, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20._burnFrom(address,uint256)"><code class="function-signature">_burnFrom(address _account, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20.onTokenTransfer(address,address,uint256)"><code class="function-signature">onTokenTransfer(address _from, address _to, uint256 _value)</code></a></li><li class="inherited"><a href="#IERC20.totalSupply()"><code class="function-signature">totalSupply()</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC20.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li class="inherited"><a href="#IERC20.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="VariableSupplyToken.mint(address,uint256)"></a><code class="function-signature">mint(address _target, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="VariableSupplyToken.burn(address,uint256)"></a><code class="function-signature">burn(address _target, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="VariableSupplyToken.onMint(address,uint256)"></a><code class="function-signature">onMint(address, uint256)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="VariableSupplyToken.onBurn(address,uint256)"></a><code class="function-signature">onBurn(address, uint256)</code><span class="function-visibility">internal</span></h4>







### `AugurPredicateExtension`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#AugurPredicateExtension.startExit(uint256)"><code class="function-signature">startExit(uint256 exitId)</code></a></li><li><a href="#AugurPredicateExtension.initializeForExit()"><code class="function-signature">initializeForExit()</code></a></li><li><a href="#AugurPredicateExtension.claimShareBalance(bytes)"><code class="function-signature">claimShareBalance(bytes data)</code></a></li><li><a href="#AugurPredicateExtension.claimCashBalance(bytes,address,uint256)"><code class="function-signature">claimCashBalance(bytes data, address participant, uint256 exitId)</code></a></li><li><a href="#AugurPredicateExtension._addMarketToExit(uint256,address)"><code class="function-signature">_addMarketToExit(uint256 exitId, address market)</code></a></li><li><a href="#AugurPredicateExtension.startExitWithBurntTokens(bytes)"><code class="function-signature">startExitWithBurntTokens(bytes data)</code></a></li><li class="inherited"><a href="matic#AugurPredicateBase.getExitId(address)"><code class="function-signature">getExitId(address exitor)</code></a></li><li class="inherited"><a href="matic#AugurPredicateBase.getExit(uint256)"><code class="function-signature">getExit(uint256 exitId)</code></a></li><li class="inherited"><a href="matic#AugurPredicateBase.setIsExecuting(uint256,bool)"><code class="function-signature">setIsExecuting(uint256 exitId, bool isExecuting)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="matic#AugurPredicateBase.ExitFinalized(uint256,address)"><code class="function-signature">ExitFinalized(uint256 exitId, address exitor)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="AugurPredicateExtension.startExit(uint256)"></a><code class="function-signature">startExit(uint256 exitId)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicateExtension.initializeForExit()"></a><code class="function-signature">initializeForExit() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>

new ShareToken() / new Cash() causes the bytecode of this contract to be too large, working around that limitation for now,
however, the intention is to deploy a new ShareToken and Cash contract per exit - todo: use proxies for that



<h4><a class="anchor" aria-hidden="true" id="AugurPredicateExtension.claimShareBalance(bytes)"></a><code class="function-signature">claimShareBalance(bytes data)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicateExtension.claimCashBalance(bytes,address,uint256)"></a><code class="function-signature">claimCashBalance(bytes data, address participant, uint256 exitId)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicateExtension._addMarketToExit(uint256,address)"></a><code class="function-signature">_addMarketToExit(uint256 exitId, address market)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurPredicateExtension.startExitWithBurntTokens(bytes)"></a><code class="function-signature">startExitWithBurntTokens(bytes data)</code><span class="function-visibility">external</span></h4>







### `AugurRegistry`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#AugurRegistry.constructor(contract TradingCash)"><code class="function-signature">constructor(contract TradingCash _feesToken)</code></a></li><li><a href="#AugurRegistry.setMinimumFeesForWithdrawal(uint256)"><code class="function-signature">setMinimumFeesForWithdrawal(uint256 _minFees)</code></a></li><li><a href="#AugurRegistry.onStateReceive(uint256,bytes)"><code class="function-signature">onStateReceive(uint256, bytes stateData)</code></a></li><li><a href="#AugurRegistry.isValid(address)"><code class="function-signature">isValid(address market)</code></a></li><li><a href="#AugurRegistry.isFinalized(address)"><code class="function-signature">isFinalized(address market)</code></a></li><li><a href="#AugurRegistry.isFinalizedAsInvalid(address)"><code class="function-signature">isFinalizedAsInvalid(address market)</code></a></li><li><a href="#AugurRegistry.getOwner(address)"><code class="function-signature">getOwner(address market)</code></a></li><li><a href="#AugurRegistry.getCreatorFee(address)"><code class="function-signature">getCreatorFee(address market)</code></a></li><li><a href="#AugurRegistry.getUniverse(address)"><code class="function-signature">getUniverse(address market)</code></a></li><li><a href="#AugurRegistry.getNumTicks(address)"><code class="function-signature">getNumTicks(address market)</code></a></li><li><a href="#AugurRegistry.getNumberOfOutcomes(address)"><code class="function-signature">getNumberOfOutcomes(address market)</code></a></li><li><a href="#AugurRegistry.getWinningPayoutNumerator(address,uint256)"><code class="function-signature">getWinningPayoutNumerator(address market, uint256 outcome)</code></a></li><li><a href="#AugurRegistry.getAffiliateFeeDivisor(address)"><code class="function-signature">getAffiliateFeeDivisor(address market)</code></a></li><li><a href="#AugurRegistry.getOrCacheReportingFeeDivisor()"><code class="function-signature">getOrCacheReportingFeeDivisor()</code></a></li><li><a href="#AugurRegistry.withdrawFees()"><code class="function-signature">withdrawFees()</code></a></li><li class="inherited"><a href="#BaseStateSyncVerifier.constructor()"><code class="function-signature">constructor()</code></a></li><li class="inherited"><a href="#BaseStateSyncVerifier.isOnlyStateSyncerContract()"><code class="function-signature">isOnlyStateSyncerContract()</code></a></li><li class="inherited"><a href="#BaseStateSyncVerifier.changeStateSyncerAddress(address)"><code class="function-signature">changeStateSyncerAddress(address newAddress)</code></a></li><li class="inherited"><a href="#BaseStateSyncVerifier.onTransferOwnership(address,address)"><code class="function-signature">onTransferOwnership(address, address)</code></a></li><li class="inherited"><a href="#Ownable.getOwner()"><code class="function-signature">getOwner()</code></a></li><li class="inherited"><a href="#Ownable.transferOwnership(address)"><code class="function-signature">transferOwnership(address _newOwner)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#BaseStateSyncVerifier.StateSyncerAddressChanged(address,address)"><code class="function-signature">StateSyncerAddressChanged(address previousAddress, address newAddress)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.constructor(contract TradingCash)"></a><code class="function-signature">constructor(contract TradingCash _feesToken)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.setMinimumFeesForWithdrawal(uint256)"></a><code class="function-signature">setMinimumFeesForWithdrawal(uint256 _minFees)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.onStateReceive(uint256,bytes)"></a><code class="function-signature">onStateReceive(uint256, bytes stateData)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.isValid(address)"></a><code class="function-signature">isValid(address market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.isFinalized(address)"></a><code class="function-signature">isFinalized(address market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.isFinalizedAsInvalid(address)"></a><code class="function-signature">isFinalizedAsInvalid(address market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.getOwner(address)"></a><code class="function-signature">getOwner(address market) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.getCreatorFee(address)"></a><code class="function-signature">getCreatorFee(address market) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.getUniverse(address)"></a><code class="function-signature">getUniverse(address market) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.getNumTicks(address)"></a><code class="function-signature">getNumTicks(address market) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.getNumberOfOutcomes(address)"></a><code class="function-signature">getNumberOfOutcomes(address market) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.getWinningPayoutNumerator(address,uint256)"></a><code class="function-signature">getWinningPayoutNumerator(address market, uint256 outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.getAffiliateFeeDivisor(address)"></a><code class="function-signature">getAffiliateFeeDivisor(address market) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.getOrCacheReportingFeeDivisor()"></a><code class="function-signature">getOrCacheReportingFeeDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurRegistry.withdrawFees()"></a><code class="function-signature">withdrawFees()</code><span class="function-visibility">public</span></h4>







### `BaseStateSyncVerifier`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#BaseStateSyncVerifier.constructor()"><code class="function-signature">constructor()</code></a></li><li><a href="#BaseStateSyncVerifier.isOnlyStateSyncerContract()"><code class="function-signature">isOnlyStateSyncerContract()</code></a></li><li><a href="#BaseStateSyncVerifier.changeStateSyncerAddress(address)"><code class="function-signature">changeStateSyncerAddress(address newAddress)</code></a></li><li><a href="#BaseStateSyncVerifier.onTransferOwnership(address,address)"><code class="function-signature">onTransferOwnership(address, address)</code></a></li><li class="inherited"><a href="matic#Ownable.getOwner()"><code class="function-signature">getOwner()</code></a></li><li class="inherited"><a href="matic#Ownable.transferOwnership(address)"><code class="function-signature">transferOwnership(address _newOwner)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li><a href="#BaseStateSyncVerifier.StateSyncerAddressChanged(address,address)"><code class="function-signature">StateSyncerAddressChanged(address previousAddress, address newAddress)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="BaseStateSyncVerifier.constructor()"></a><code class="function-signature">constructor()</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="BaseStateSyncVerifier.isOnlyStateSyncerContract()"></a><code class="function-signature">isOnlyStateSyncerContract() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>

Returns true if the caller is the state syncer contract
TODO: replace onlyOwner ownership with 0x1000 for validator majority



<h4><a class="anchor" aria-hidden="true" id="BaseStateSyncVerifier.changeStateSyncerAddress(address)"></a><code class="function-signature">changeStateSyncerAddress(address newAddress)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="BaseStateSyncVerifier.onTransferOwnership(address,address)"></a><code class="function-signature">onTransferOwnership(address, address)</code><span class="function-visibility">internal</span></h4>







<h4><a class="anchor" aria-hidden="true" id="BaseStateSyncVerifier.StateSyncerAddressChanged(address,address)"></a><code class="function-signature">StateSyncerAddressChanged(address previousAddress, address newAddress)</code><span class="function-visibility"></span></h4>





### `IStateReceiver`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IStateReceiver.onStateReceive(uint256,bytes)"><code class="function-signature">onStateReceive(uint256 id, bytes data)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IStateReceiver.onStateReceive(uint256,bytes)"></a><code class="function-signature">onStateReceive(uint256 id, bytes data)</code><span class="function-visibility">external</span></h4>







### `TradingCash`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#TradingCash.constructor(address)"><code class="function-signature">constructor(address _rootToken)</code></a></li><li><a href="#TradingCash.setWhitelistedSpender(address,bool)"><code class="function-signature">setWhitelistedSpender(address _spender, bool _value)</code></a></li><li><a href="#TradingCash.changeChildChain(address)"><code class="function-signature">changeChildChain(address newAddress)</code></a></li><li><a href="#TradingCash.deposit(address,uint256)"><code class="function-signature">deposit(address user, uint256 amount)</code></a></li><li><a href="#TradingCash.withdraw(uint256)"><code class="function-signature">withdraw(uint256 amount)</code></a></li><li><a href="#TradingCash.onStateReceive(uint256,bytes)"><code class="function-signature">onStateReceive(uint256, bytes data)</code></a></li><li><a href="#TradingCash.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address _sender, address _recipient, uint256 _amount)</code></a></li><li><a href="#TradingCash._transfer(address,address,uint256)"><code class="function-signature">_transfer(address _sender, address _recipient, uint256 _amount)</code></a></li><li><a href="#TradingCash.onTokenTransfer(address,address,uint256)"><code class="function-signature">onTokenTransfer(address _from, address _to, uint256 _value)</code></a></li><li><a href="#TradingCash.allowance(address,address)"><code class="function-signature">allowance(address, address _sender)</code></a></li><li><a href="#TradingCash.approve(address,uint256)"><code class="function-signature">approve(address, uint256)</code></a></li><li class="inherited"><a href="matic#ERC20.balanceOf(address)"><code class="function-signature">balanceOf(address _account)</code></a></li><li class="inherited"><a href="matic#ERC20.transfer(address,uint256)"><code class="function-signature">transfer(address _recipient, uint256 _amount)</code></a></li><li class="inherited"><a href="matic#ERC20.increaseAllowance(address,uint256)"><code class="function-signature">increaseAllowance(address _spender, uint256 _addedValue)</code></a></li><li class="inherited"><a href="matic#ERC20.decreaseAllowance(address,uint256)"><code class="function-signature">decreaseAllowance(address _spender, uint256 _subtractedValue)</code></a></li><li class="inherited"><a href="matic#ERC20._mint(address,uint256)"><code class="function-signature">_mint(address _account, uint256 _amount)</code></a></li><li class="inherited"><a href="matic#ERC20._burn(address,uint256)"><code class="function-signature">_burn(address _account, uint256 _amount)</code></a></li><li class="inherited"><a href="matic#ERC20._approve(address,address,uint256)"><code class="function-signature">_approve(address _owner, address _spender, uint256 _amount)</code></a></li><li class="inherited"><a href="matic#ERC20._burnFrom(address,uint256)"><code class="function-signature">_burnFrom(address _account, uint256 _amount)</code></a></li><li class="inherited"><a href="matic#IERC20.totalSupply()"><code class="function-signature">totalSupply()</code></a></li><li class="inherited"><a href="matic#BaseStateSyncVerifier.constructor()"><code class="function-signature">constructor()</code></a></li><li class="inherited"><a href="matic#BaseStateSyncVerifier.isOnlyStateSyncerContract()"><code class="function-signature">isOnlyStateSyncerContract()</code></a></li><li class="inherited"><a href="matic#BaseStateSyncVerifier.changeStateSyncerAddress(address)"><code class="function-signature">changeStateSyncerAddress(address newAddress)</code></a></li><li class="inherited"><a href="matic#BaseStateSyncVerifier.onTransferOwnership(address,address)"><code class="function-signature">onTransferOwnership(address, address)</code></a></li><li class="inherited"><a href="matic#Ownable.getOwner()"><code class="function-signature">getOwner()</code></a></li><li class="inherited"><a href="matic#Ownable.transferOwnership(address)"><code class="function-signature">transferOwnership(address _newOwner)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li><a href="#TradingCash.Deposit(address,address,uint256,uint256,uint256)"><code class="function-signature">Deposit(address token, address from, uint256 amount, uint256 input1, uint256 output1)</code></a></li><li><a href="#TradingCash.Withdraw(address,address,uint256,uint256,uint256)"><code class="function-signature">Withdraw(address token, address from, uint256 amount, uint256 input1, uint256 output1)</code></a></li><li><a href="#TradingCash.LogTransfer(address,address,address,uint256,uint256,uint256,uint256,uint256)"><code class="function-signature">LogTransfer(address token, address from, address to, uint256 amount, uint256 input1, uint256 input2, uint256 output1, uint256 output2)</code></a></li><li><a href="#TradingCash.ChildChainChanged(address,address)"><code class="function-signature">ChildChainChanged(address previousAddress, address newAddress)</code></a></li><li class="inherited"><a href="matic#IERC20.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li class="inherited"><a href="matic#IERC20.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li><li class="inherited"><a href="matic#BaseStateSyncVerifier.StateSyncerAddressChanged(address,address)"><code class="function-signature">StateSyncerAddressChanged(address previousAddress, address newAddress)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="TradingCash.constructor(address)"></a><code class="function-signature">constructor(address _rootToken)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="TradingCash.setWhitelistedSpender(address,bool)"></a><code class="function-signature">setWhitelistedSpender(address _spender, bool _value)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="TradingCash.changeChildChain(address)"></a><code class="function-signature">changeChildChain(address newAddress)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="TradingCash.deposit(address,uint256)"></a><code class="function-signature">deposit(address user, uint256 amount)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="TradingCash.withdraw(uint256)"></a><code class="function-signature">withdraw(uint256 amount)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="TradingCash.onStateReceive(uint256,bytes)"></a><code class="function-signature">onStateReceive(uint256, bytes data)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="TradingCash.transferFrom(address,address,uint256)"></a><code class="function-signature">transferFrom(address _sender, address _recipient, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>

Override it to check if the sender is whitelisted



<h4><a class="anchor" aria-hidden="true" id="TradingCash._transfer(address,address,uint256)"></a><code class="function-signature">_transfer(address _sender, address _recipient, uint256 _amount)</code><span class="function-visibility">internal</span></h4>

Override to emit additional logs for proof creation



<h4><a class="anchor" aria-hidden="true" id="TradingCash.onTokenTransfer(address,address,uint256)"></a><code class="function-signature">onTokenTransfer(address _from, address _to, uint256 _value)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="TradingCash.allowance(address,address)"></a><code class="function-signature">allowance(address, address _sender) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="TradingCash.approve(address,uint256)"></a><code class="function-signature">approve(address, uint256) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>







<h4><a class="anchor" aria-hidden="true" id="TradingCash.Deposit(address,address,uint256,uint256,uint256)"></a><code class="function-signature">Deposit(address token, address from, uint256 amount, uint256 input1, uint256 output1)</code><span class="function-visibility"></span></h4>





<h4><a class="anchor" aria-hidden="true" id="TradingCash.Withdraw(address,address,uint256,uint256,uint256)"></a><code class="function-signature">Withdraw(address token, address from, uint256 amount, uint256 input1, uint256 output1)</code><span class="function-visibility"></span></h4>





<h4><a class="anchor" aria-hidden="true" id="TradingCash.LogTransfer(address,address,address,uint256,uint256,uint256,uint256,uint256)"></a><code class="function-signature">LogTransfer(address token, address from, address to, uint256 amount, uint256 input1, uint256 input2, uint256 output1, uint256 output2)</code><span class="function-visibility"></span></h4>





<h4><a class="anchor" aria-hidden="true" id="TradingCash.ChildChainChanged(address,address)"></a><code class="function-signature">ChildChainChanged(address previousAddress, address newAddress)</code><span class="function-visibility"></span></h4>





### `AugurSyncer`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#AugurSyncer.setMarketRegistry(address)"><code class="function-signature">setMarketRegistry(address _marketRegistry)</code></a></li><li><a href="#AugurSyncer.setRegistry(contract IRegistry)"><code class="function-signature">setRegistry(contract IRegistry _registry)</code></a></li><li><a href="#AugurSyncer.updateChildChainAndStateSender()"><code class="function-signature">updateChildChainAndStateSender()</code></a></li><li><a href="#AugurSyncer.syncMarket(contract Market)"><code class="function-signature">syncMarket(contract Market _market)</code></a></li><li><a href="#AugurSyncer.migrateMarketIn(contract IUniverse,contract IMarket,uint256,uint256)"><code class="function-signature">migrateMarketIn(contract IUniverse _universe, contract IMarket _market, uint256 _cashBalance, uint256 _marketOI)</code></a></li><li><a href="#AugurSyncer.syncReportingFee(contract IUniverse)"><code class="function-signature">syncReportingFee(contract IUniverse _universe)</code></a></li><li><a href="#AugurSyncer.syncMarketFinalized(contract Market)"><code class="function-signature">syncMarketFinalized(contract Market _market)</code></a></li><li><a href="#AugurSyncer.onTransferOwnership(address,address)"><code class="function-signature">onTransferOwnership(address, address)</code></a></li><li class="inherited"><a href="#Ownable.constructor()"><code class="function-signature">constructor()</code></a></li><li class="inherited"><a href="#Ownable.getOwner()"><code class="function-signature">getOwner()</code></a></li><li class="inherited"><a href="#Ownable.transferOwnership(address)"><code class="function-signature">transferOwnership(address _newOwner)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="AugurSyncer.setMarketRegistry(address)"></a><code class="function-signature">setMarketRegistry(address _marketRegistry)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurSyncer.setRegistry(contract IRegistry)"></a><code class="function-signature">setRegistry(contract IRegistry _registry)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurSyncer.updateChildChainAndStateSender()"></a><code class="function-signature">updateChildChainAndStateSender()</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurSyncer.syncMarket(contract Market)"></a><code class="function-signature">syncMarket(contract Market _market)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurSyncer.migrateMarketIn(contract IUniverse,contract IMarket,uint256,uint256)"></a><code class="function-signature">migrateMarketIn(contract IUniverse _universe, contract IMarket _market, uint256 _cashBalance, uint256 _marketOI)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurSyncer.syncReportingFee(contract IUniverse)"></a><code class="function-signature">syncReportingFee(contract IUniverse _universe)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurSyncer.syncMarketFinalized(contract Market)"></a><code class="function-signature">syncMarketFinalized(contract Market _market)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="AugurSyncer.onTransferOwnership(address,address)"></a><code class="function-signature">onTransferOwnership(address, address)</code><span class="function-visibility">internal</span></h4>







### `CloneFactory`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#CloneFactory.createClone(address)"><code class="function-signature">createClone(address target)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="CloneFactory.createClone(address)"></a><code class="function-signature">createClone(address target) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">internal</span></h4>







### `IAffiliates`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IAffiliates.setFingerprint(bytes32)"><code class="function-signature">setFingerprint(bytes32 _fingerprint)</code></a></li><li><a href="#IAffiliates.setReferrer(address)"><code class="function-signature">setReferrer(address _referrer)</code></a></li><li><a href="#IAffiliates.getAccountFingerprint(address)"><code class="function-signature">getAccountFingerprint(address _account)</code></a></li><li><a href="#IAffiliates.getReferrer(address)"><code class="function-signature">getReferrer(address _account)</code></a></li><li><a href="#IAffiliates.getAndValidateReferrer(address,contract IAffiliateValidator)"><code class="function-signature">getAndValidateReferrer(address _account, contract IAffiliateValidator affiliateValidator)</code></a></li><li><a href="#IAffiliates.affiliateValidators(address)"><code class="function-signature">affiliateValidators(address _affiliateValidator)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IAffiliates.setFingerprint(bytes32)"></a><code class="function-signature">setFingerprint(bytes32 _fingerprint)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAffiliates.setReferrer(address)"></a><code class="function-signature">setReferrer(address _referrer)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAffiliates.getAccountFingerprint(address)"></a><code class="function-signature">getAccountFingerprint(address _account) <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAffiliates.getReferrer(address)"></a><code class="function-signature">getReferrer(address _account) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAffiliates.getAndValidateReferrer(address,contract IAffiliateValidator)"></a><code class="function-signature">getAndValidateReferrer(address _account, contract IAffiliateValidator affiliateValidator) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAffiliates.affiliateValidators(address)"></a><code class="function-signature">affiliateValidators(address _affiliateValidator) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>







### `IDisputeCrowdsourcer`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IDisputeCrowdsourcer.initialize(contract IAugur,contract IMarket,uint256,bytes32,uint256[],uint256)"><code class="function-signature">initialize(contract IAugur _augur, contract IMarket market, uint256 _size, bytes32 _payoutDistributionHash, uint256[] _payoutNumerators, uint256 _crowdsourcerGeneration)</code></a></li><li><a href="#IDisputeCrowdsourcer.contribute(address,uint256,bool)"><code class="function-signature">contribute(address _participant, uint256 _amount, bool _overload)</code></a></li><li><a href="#IDisputeCrowdsourcer.setSize(uint256)"><code class="function-signature">setSize(uint256 _size)</code></a></li><li><a href="#IDisputeCrowdsourcer.getRemainingToFill()"><code class="function-signature">getRemainingToFill()</code></a></li><li><a href="#IDisputeCrowdsourcer.correctSize()"><code class="function-signature">correctSize()</code></a></li><li><a href="#IDisputeCrowdsourcer.getCrowdsourcerGeneration()"><code class="function-signature">getCrowdsourcerGeneration()</code></a></li><li class="inherited"><a href="#IERC20.totalSupply()"><code class="function-signature">totalSupply()</code></a></li><li class="inherited"><a href="#IERC20.balanceOf(address)"><code class="function-signature">balanceOf(address owner)</code></a></li><li class="inherited"><a href="#IERC20.transfer(address,uint256)"><code class="function-signature">transfer(address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address from, address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.approve(address,uint256)"><code class="function-signature">approve(address spender, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.allowance(address,address)"><code class="function-signature">allowance(address owner, address spender)</code></a></li><li class="inherited"><a href="#IReportingParticipant.getStake()"><code class="function-signature">getStake()</code></a></li><li class="inherited"><a href="#IReportingParticipant.getPayoutDistributionHash()"><code class="function-signature">getPayoutDistributionHash()</code></a></li><li class="inherited"><a href="#IReportingParticipant.liquidateLosing()"><code class="function-signature">liquidateLosing()</code></a></li><li class="inherited"><a href="#IReportingParticipant.redeem(address)"><code class="function-signature">redeem(address _redeemer)</code></a></li><li class="inherited"><a href="#IReportingParticipant.isDisavowed()"><code class="function-signature">isDisavowed()</code></a></li><li class="inherited"><a href="#IReportingParticipant.getPayoutNumerator(uint256)"><code class="function-signature">getPayoutNumerator(uint256 _outcome)</code></a></li><li class="inherited"><a href="#IReportingParticipant.getPayoutNumerators()"><code class="function-signature">getPayoutNumerators()</code></a></li><li class="inherited"><a href="#IReportingParticipant.getMarket()"><code class="function-signature">getMarket()</code></a></li><li class="inherited"><a href="#IReportingParticipant.getSize()"><code class="function-signature">getSize()</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC20.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li class="inherited"><a href="#IERC20.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IDisputeCrowdsourcer.initialize(contract IAugur,contract IMarket,uint256,bytes32,uint256[],uint256)"></a><code class="function-signature">initialize(contract IAugur _augur, contract IMarket market, uint256 _size, bytes32 _payoutDistributionHash, uint256[] _payoutNumerators, uint256 _crowdsourcerGeneration)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeCrowdsourcer.contribute(address,uint256,bool)"></a><code class="function-signature">contribute(address _participant, uint256 _amount, bool _overload) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeCrowdsourcer.setSize(uint256)"></a><code class="function-signature">setSize(uint256 _size)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeCrowdsourcer.getRemainingToFill()"></a><code class="function-signature">getRemainingToFill() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeCrowdsourcer.correctSize()"></a><code class="function-signature">correctSize() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IDisputeCrowdsourcer.getCrowdsourcerGeneration()"></a><code class="function-signature">getCrowdsourcerGeneration() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>







### `IDisputeCrowdsourcerFactory`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IDisputeCrowdsourcerFactory.createDisputeCrowdsourcer(contract IAugur,uint256,bytes32,uint256[],uint256)"><code class="function-signature">createDisputeCrowdsourcer(contract IAugur _augur, uint256 _size, bytes32 _payoutDistributionHash, uint256[] _payoutNumerators, uint256 _crowdsourcerGeneration)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IDisputeCrowdsourcerFactory.createDisputeCrowdsourcer(contract IAugur,uint256,bytes32,uint256[],uint256)"></a><code class="function-signature">createDisputeCrowdsourcer(contract IAugur _augur, uint256 _size, bytes32 _payoutDistributionHash, uint256[] _payoutNumerators, uint256 _crowdsourcerGeneration) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeCrowdsourcer</span></code><span class="function-visibility">public</span></h4>







### `IDisputeWindowFactory`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IDisputeWindowFactory.createDisputeWindow(contract IAugur,uint256,uint256,uint256,bool)"><code class="function-signature">createDisputeWindow(contract IAugur _augur, uint256 _disputeWindowId, uint256 _windowDuration, uint256 _startTime, bool _participationTokensEnabled)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IDisputeWindowFactory.createDisputeWindow(contract IAugur,uint256,uint256,uint256,bool)"></a><code class="function-signature">createDisputeWindow(contract IAugur _augur, uint256 _disputeWindowId, uint256 _windowDuration, uint256 _startTime, bool _participationTokensEnabled) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>







### `IFormulas`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IFormulas.calculateFloatingValue(uint256,uint256,uint256,uint256,uint256)"><code class="function-signature">calculateFloatingValue(uint256 _totalBad, uint256 _total, uint256 _targetDivisor, uint256 _previousValue, uint256 _floor)</code></a></li><li><a href="#IFormulas.calculateValidityBond(contract IDisputeWindow,uint256)"><code class="function-signature">calculateValidityBond(contract IDisputeWindow _previousDisputeWindow, uint256 _previousValidityBondInAttoCash)</code></a></li><li><a href="#IFormulas.calculateDesignatedReportStake(contract IDisputeWindow,uint256,uint256)"><code class="function-signature">calculateDesignatedReportStake(contract IDisputeWindow _previousDisputeWindow, uint256 _previousDesignatedReportStakeInAttoRep, uint256 _initialReportMinValue)</code></a></li><li><a href="#IFormulas.calculateDesignatedReportNoShowBond(contract IDisputeWindow,uint256,uint256)"><code class="function-signature">calculateDesignatedReportNoShowBond(contract IDisputeWindow _previousDisputeWindow, uint256 _previousDesignatedReportNoShowBondInAttoRep, uint256 _initialReportMinValue)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IFormulas.calculateFloatingValue(uint256,uint256,uint256,uint256,uint256)"></a><code class="function-signature">calculateFloatingValue(uint256 _totalBad, uint256 _total, uint256 _targetDivisor, uint256 _previousValue, uint256 _floor) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IFormulas.calculateValidityBond(contract IDisputeWindow,uint256)"></a><code class="function-signature">calculateValidityBond(contract IDisputeWindow _previousDisputeWindow, uint256 _previousValidityBondInAttoCash) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IFormulas.calculateDesignatedReportStake(contract IDisputeWindow,uint256,uint256)"></a><code class="function-signature">calculateDesignatedReportStake(contract IDisputeWindow _previousDisputeWindow, uint256 _previousDesignatedReportStakeInAttoRep, uint256 _initialReportMinValue) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IFormulas.calculateDesignatedReportNoShowBond(contract IDisputeWindow,uint256,uint256)"></a><code class="function-signature">calculateDesignatedReportNoShowBond(contract IDisputeWindow _previousDisputeWindow, uint256 _previousDesignatedReportNoShowBondInAttoRep, uint256 _initialReportMinValue) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>







### `IMarketFactory`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IMarketFactory.createMarket(contract IAugur,uint256,uint256,contract IAffiliateValidator,uint256,address,address,uint256,uint256)"><code class="function-signature">createMarket(contract IAugur _augur, uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, address _sender, uint256 _numOutcomes, uint256 _numTicks)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IMarketFactory.createMarket(contract IAugur,uint256,uint256,contract IAffiliateValidator,uint256,address,address,uint256,uint256)"></a><code class="function-signature">createMarket(contract IAugur _augur, uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, address _sender, uint256 _numOutcomes, uint256 _numTicks) <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">public</span></h4>







### `IOICash`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IOICash.initialize(contract IAugur,contract IUniverse)"><code class="function-signature">initialize(contract IAugur _augur, contract IUniverse _universe)</code></a></li><li class="inherited"><a href="#IERC20.totalSupply()"><code class="function-signature">totalSupply()</code></a></li><li class="inherited"><a href="#IERC20.balanceOf(address)"><code class="function-signature">balanceOf(address owner)</code></a></li><li class="inherited"><a href="#IERC20.transfer(address,uint256)"><code class="function-signature">transfer(address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address from, address to, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.approve(address,uint256)"><code class="function-signature">approve(address spender, uint256 amount)</code></a></li><li class="inherited"><a href="#IERC20.allowance(address,address)"><code class="function-signature">allowance(address owner, address spender)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC20.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li class="inherited"><a href="#IERC20.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IOICash.initialize(contract IAugur,contract IUniverse)"></a><code class="function-signature">initialize(contract IAugur _augur, contract IUniverse _universe)</code><span class="function-visibility">external</span></h4>







### `IOICashFactory`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IOICashFactory.createOICash(contract IAugur)"><code class="function-signature">createOICash(contract IAugur _augur)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IOICashFactory.createOICash(contract IAugur)"></a><code class="function-signature">createOICash(contract IAugur _augur) <span class="return-arrow">→</span> <span class="return-type">contract IOICash</span></code><span class="function-visibility">public</span></h4>







### `IRepOracle`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IRepOracle.initialize(contract IAugur)"><code class="function-signature">initialize(contract IAugur _augur)</code></a></li><li><a href="#IRepOracle.getLastUpdateTimestamp(address)"><code class="function-signature">getLastUpdateTimestamp(address _reputationToken)</code></a></li><li><a href="#IRepOracle.poke(address)"><code class="function-signature">poke(address _reputationTokenAddress)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IRepOracle.initialize(contract IAugur)"></a><code class="function-signature">initialize(contract IAugur _augur)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IRepOracle.getLastUpdateTimestamp(address)"></a><code class="function-signature">getLastUpdateTimestamp(address _reputationToken) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IRepOracle.poke(address)"></a><code class="function-signature">poke(address _reputationTokenAddress) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>







### `IReputationTokenFactory`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IReputationTokenFactory.createReputationToken(contract IAugur,contract IUniverse)"><code class="function-signature">createReputationToken(contract IAugur _augur, contract IUniverse _parentUniverse)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IReputationTokenFactory.createReputationToken(contract IAugur,contract IUniverse)"></a><code class="function-signature">createReputationToken(contract IAugur _augur, contract IUniverse _parentUniverse) <span class="return-arrow">→</span> <span class="return-type">contract IV2ReputationToken</span></code><span class="function-visibility">public</span></h4>







### `IStateSender`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IStateSender.syncState(address,bytes)"><code class="function-signature">syncState(address receiver, bytes data)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IStateSender.syncState(address,bytes)"></a><code class="function-signature">syncState(address receiver, bytes data)</code><span class="function-visibility">external</span></h4>







### `IWarpSync`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IWarpSync.markets(address)"><code class="function-signature">markets(address _universe)</code></a></li><li><a href="#IWarpSync.notifyMarketFinalized()"><code class="function-signature">notifyMarketFinalized()</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IWarpSync.markets(address)"></a><code class="function-signature">markets(address _universe) <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IWarpSync.notifyMarketFinalized()"></a><code class="function-signature">notifyMarketFinalized()</code><span class="function-visibility">public</span></h4>







### `InitialReporterFactory`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#InitialReporterFactory.createInitialReporter(contract IAugur,address)"><code class="function-signature">createInitialReporter(contract IAugur _augur, address _designatedReporter)</code></a></li><li class="inherited"><a href="matic#CloneFactory.createClone(address)"><code class="function-signature">createClone(address target)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="InitialReporterFactory.createInitialReporter(contract IAugur,address)"></a><code class="function-signature">createInitialReporter(contract IAugur _augur, address _designatedReporter) <span class="return-arrow">→</span> <span class="return-type">contract IInitialReporter</span></code><span class="function-visibility">public</span></h4>







### `Market`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#Market.initialize(contract IAugur,contract IUniverse,uint256,uint256,contract IAffiliateValidator,uint256,address,address,uint256,uint256)"><code class="function-signature">initialize(contract IAugur _augur, contract IUniverse _universe, uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, address _creator, uint256 _numOutcomes, uint256 _numTicks)</code></a></li><li><a href="#Market.doInitialReport(uint256[],string,uint256)"><code class="function-signature">doInitialReport(uint256[] _payoutNumerators, string _description, uint256 _additionalStake)</code></a></li><li><a href="#Market.contributeToTentative(uint256[],uint256,string)"><code class="function-signature">contributeToTentative(uint256[] _payoutNumerators, uint256 _amount, string _description)</code></a></li><li><a href="#Market.contribute(uint256[],uint256,string)"><code class="function-signature">contribute(uint256[] _payoutNumerators, uint256 _amount, string _description)</code></a></li><li><a href="#Market.internalContribute(address,bytes32,uint256[],uint256,bool,string)"><code class="function-signature">internalContribute(address _contributor, bytes32 _payoutDistributionHash, uint256[] _payoutNumerators, uint256 _amount, bool _overload, string _description)</code></a></li><li><a href="#Market.finalize()"><code class="function-signature">finalize()</code></a></li><li><a href="#Market.getMarketCreatorSettlementFeeDivisor()"><code class="function-signature">getMarketCreatorSettlementFeeDivisor()</code></a></li><li><a href="#Market.deriveMarketCreatorFeeAmount(uint256)"><code class="function-signature">deriveMarketCreatorFeeAmount(uint256 _amount)</code></a></li><li><a href="#Market.recordMarketCreatorFees(uint256,address,bytes32)"><code class="function-signature">recordMarketCreatorFees(uint256 _marketCreatorFees, address _sourceAccount, bytes32 _fingerprint)</code></a></li><li><a href="#Market.migrateThroughOneFork(uint256[],string)"><code class="function-signature">migrateThroughOneFork(uint256[] _payoutNumerators, string _description)</code></a></li><li><a href="#Market.disavowCrowdsourcers()"><code class="function-signature">disavowCrowdsourcers()</code></a></li><li><a href="#Market.getHighestNonTentativeParticipantStake()"><code class="function-signature">getHighestNonTentativeParticipantStake()</code></a></li><li><a href="#Market.getParticipantStake()"><code class="function-signature">getParticipantStake()</code></a></li><li><a href="#Market.getStakeInOutcome(bytes32)"><code class="function-signature">getStakeInOutcome(bytes32 _payoutDistributionHash)</code></a></li><li><a href="#Market.getForkingMarket()"><code class="function-signature">getForkingMarket()</code></a></li><li><a href="#Market.getWinningPayoutDistributionHash()"><code class="function-signature">getWinningPayoutDistributionHash()</code></a></li><li><a href="#Market.isFinalized()"><code class="function-signature">isFinalized()</code></a></li><li><a href="#Market.getEndTime()"><code class="function-signature">getEndTime()</code></a></li><li><a href="#Market.isFinalizedAsInvalid()"><code class="function-signature">isFinalizedAsInvalid()</code></a></li><li><a href="#Market.getInitialReporter()"><code class="function-signature">getInitialReporter()</code></a></li><li><a href="#Market.getCrowdsourcer(bytes32)"><code class="function-signature">getCrowdsourcer(bytes32 _payoutDistributionHash)</code></a></li><li><a href="#Market.getWinningReportingParticipant()"><code class="function-signature">getWinningReportingParticipant()</code></a></li><li><a href="#Market.getWinningPayoutNumerator(uint256)"><code class="function-signature">getWinningPayoutNumerator(uint256 _outcome)</code></a></li><li><a href="#Market.getUniverse()"><code class="function-signature">getUniverse()</code></a></li><li><a href="#Market.getDisputeWindow()"><code class="function-signature">getDisputeWindow()</code></a></li><li><a href="#Market.getFinalizationTime()"><code class="function-signature">getFinalizationTime()</code></a></li><li><a href="#Market.getReputationToken()"><code class="function-signature">getReputationToken()</code></a></li><li><a href="#Market.getNumberOfOutcomes()"><code class="function-signature">getNumberOfOutcomes()</code></a></li><li><a href="#Market.getNumTicks()"><code class="function-signature">getNumTicks()</code></a></li><li><a href="#Market.getDesignatedReportingEndTime()"><code class="function-signature">getDesignatedReportingEndTime()</code></a></li><li><a href="#Market.getNumParticipants()"><code class="function-signature">getNumParticipants()</code></a></li><li><a href="#Market.getValidityBondAttoCash()"><code class="function-signature">getValidityBondAttoCash()</code></a></li><li><a href="#Market.getDisputePacingOn()"><code class="function-signature">getDisputePacingOn()</code></a></li><li><a href="#Market.derivePayoutDistributionHash(uint256[])"><code class="function-signature">derivePayoutDistributionHash(uint256[] _payoutNumerators)</code></a></li><li><a href="#Market.isContainerForReportingParticipant(contract IReportingParticipant)"><code class="function-signature">isContainerForReportingParticipant(contract IReportingParticipant _shadyReportingParticipant)</code></a></li><li><a href="#Market.onTransferOwnership(address,address)"><code class="function-signature">onTransferOwnership(address _owner, address _newOwner)</code></a></li><li><a href="#Market.transferRepBondOwnership(address)"><code class="function-signature">transferRepBondOwnership(address _newOwner)</code></a></li><li><a href="#Market.isForkingMarket()"><code class="function-signature">isForkingMarket()</code></a></li><li><a href="#Market.getWinningChildPayout(uint256)"><code class="function-signature">getWinningChildPayout(uint256 _outcome)</code></a></li><li><a href="#Market.getOpenInterest()"><code class="function-signature">getOpenInterest()</code></a></li><li class="inherited"><a href="#IMarket.affiliateFeeDivisor()"><code class="function-signature">affiliateFeeDivisor()</code></a></li><li class="inherited"><a href="#Ownable.constructor()"><code class="function-signature">constructor()</code></a></li><li class="inherited"><a href="#Ownable.getOwner()"><code class="function-signature">getOwner()</code></a></li><li class="inherited"><a href="#Ownable.transferOwnership(address)"><code class="function-signature">transferOwnership(address _newOwner)</code></a></li><li class="inherited"><a href="#Initializable.endInitialization()"><code class="function-signature">endInitialization()</code></a></li><li class="inherited"><a href="#Initializable.getInitialized()"><code class="function-signature">getInitialized()</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="Market.initialize(contract IAugur,contract IUniverse,uint256,uint256,contract IAffiliateValidator,uint256,address,address,uint256,uint256)"></a><code class="function-signature">initialize(contract IAugur _augur, contract IUniverse _universe, uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, address _creator, uint256 _numOutcomes, uint256 _numTicks)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.doInitialReport(uint256[],string,uint256)"></a><code class="function-signature">doInitialReport(uint256[] _payoutNumerators, string _description, uint256 _additionalStake) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.contributeToTentative(uint256[],uint256,string)"></a><code class="function-signature">contributeToTentative(uint256[] _payoutNumerators, uint256 _amount, string _description) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>

This will escrow REP in a bond which will be active immediately if the tentative outcome is successfully disputed.




<h4><a class="anchor" aria-hidden="true" id="Market.contribute(uint256[],uint256,string)"></a><code class="function-signature">contribute(uint256[] _payoutNumerators, uint256 _amount, string _description) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.internalContribute(address,bytes32,uint256[],uint256,bool,string)"></a><code class="function-signature">internalContribute(address _contributor, bytes32 _payoutDistributionHash, uint256[] _payoutNumerators, uint256 _amount, bool _overload, string _description)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.finalize()"></a><code class="function-signature">finalize() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getMarketCreatorSettlementFeeDivisor()"></a><code class="function-signature">getMarketCreatorSettlementFeeDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.deriveMarketCreatorFeeAmount(uint256)"></a><code class="function-signature">deriveMarketCreatorFeeAmount(uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.recordMarketCreatorFees(uint256,address,bytes32)"></a><code class="function-signature">recordMarketCreatorFees(uint256 _marketCreatorFees, address _sourceAccount, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.migrateThroughOneFork(uint256[],string)"></a><code class="function-signature">migrateThroughOneFork(uint256[] _payoutNumerators, string _description) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>

This will extract a new REP no show bond from whoever calls this and if the market is in the reporting phase will require a report be made as well




<h4><a class="anchor" aria-hidden="true" id="Market.disavowCrowdsourcers()"></a><code class="function-signature">disavowCrowdsourcers() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getHighestNonTentativeParticipantStake()"></a><code class="function-signature">getHighestNonTentativeParticipantStake() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getParticipantStake()"></a><code class="function-signature">getParticipantStake() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getStakeInOutcome(bytes32)"></a><code class="function-signature">getStakeInOutcome(bytes32 _payoutDistributionHash) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getForkingMarket()"></a><code class="function-signature">getForkingMarket() <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getWinningPayoutDistributionHash()"></a><code class="function-signature">getWinningPayoutDistributionHash() <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.isFinalized()"></a><code class="function-signature">isFinalized() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getEndTime()"></a><code class="function-signature">getEndTime() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.isFinalizedAsInvalid()"></a><code class="function-signature">isFinalizedAsInvalid() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getInitialReporter()"></a><code class="function-signature">getInitialReporter() <span class="return-arrow">→</span> <span class="return-type">contract IInitialReporter</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getCrowdsourcer(bytes32)"></a><code class="function-signature">getCrowdsourcer(bytes32 _payoutDistributionHash) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeCrowdsourcer</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getWinningReportingParticipant()"></a><code class="function-signature">getWinningReportingParticipant() <span class="return-arrow">→</span> <span class="return-type">contract IReportingParticipant</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getWinningPayoutNumerator(uint256)"></a><code class="function-signature">getWinningPayoutNumerator(uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getUniverse()"></a><code class="function-signature">getUniverse() <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getDisputeWindow()"></a><code class="function-signature">getDisputeWindow() <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getFinalizationTime()"></a><code class="function-signature">getFinalizationTime() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getReputationToken()"></a><code class="function-signature">getReputationToken() <span class="return-arrow">→</span> <span class="return-type">contract IV2ReputationToken</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getNumberOfOutcomes()"></a><code class="function-signature">getNumberOfOutcomes() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getNumTicks()"></a><code class="function-signature">getNumTicks() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getDesignatedReportingEndTime()"></a><code class="function-signature">getDesignatedReportingEndTime() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getNumParticipants()"></a><code class="function-signature">getNumParticipants() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getValidityBondAttoCash()"></a><code class="function-signature">getValidityBondAttoCash() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getDisputePacingOn()"></a><code class="function-signature">getDisputePacingOn() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.derivePayoutDistributionHash(uint256[])"></a><code class="function-signature">derivePayoutDistributionHash(uint256[] _payoutNumerators) <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.isContainerForReportingParticipant(contract IReportingParticipant)"></a><code class="function-signature">isContainerForReportingParticipant(contract IReportingParticipant _shadyReportingParticipant) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.onTransferOwnership(address,address)"></a><code class="function-signature">onTransferOwnership(address _owner, address _newOwner)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.transferRepBondOwnership(address)"></a><code class="function-signature">transferRepBondOwnership(address _newOwner) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.isForkingMarket()"></a><code class="function-signature">isForkingMarket() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getWinningChildPayout(uint256)"></a><code class="function-signature">getWinningChildPayout(uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Market.getOpenInterest()"></a><code class="function-signature">getOpenInterest() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>







### `Reporting`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#Reporting.getDesignatedReportingDurationSeconds()"><code class="function-signature">getDesignatedReportingDurationSeconds()</code></a></li><li><a href="#Reporting.getInitialDisputeRoundDurationSeconds()"><code class="function-signature">getInitialDisputeRoundDurationSeconds()</code></a></li><li><a href="#Reporting.getDisputeWindowBufferSeconds()"><code class="function-signature">getDisputeWindowBufferSeconds()</code></a></li><li><a href="#Reporting.getDisputeRoundDurationSeconds()"><code class="function-signature">getDisputeRoundDurationSeconds()</code></a></li><li><a href="#Reporting.getForkDurationSeconds()"><code class="function-signature">getForkDurationSeconds()</code></a></li><li><a href="#Reporting.getBaseMarketDurationMaximum()"><code class="function-signature">getBaseMarketDurationMaximum()</code></a></li><li><a href="#Reporting.getUpgradeCadence()"><code class="function-signature">getUpgradeCadence()</code></a></li><li><a href="#Reporting.getInitialUpgradeTimestamp()"><code class="function-signature">getInitialUpgradeTimestamp()</code></a></li><li><a href="#Reporting.getDefaultValidityBond()"><code class="function-signature">getDefaultValidityBond()</code></a></li><li><a href="#Reporting.getValidityBondFloor()"><code class="function-signature">getValidityBondFloor()</code></a></li><li><a href="#Reporting.getTargetInvalidMarketsDivisor()"><code class="function-signature">getTargetInvalidMarketsDivisor()</code></a></li><li><a href="#Reporting.getTargetIncorrectDesignatedReportMarketsDivisor()"><code class="function-signature">getTargetIncorrectDesignatedReportMarketsDivisor()</code></a></li><li><a href="#Reporting.getTargetDesignatedReportNoShowsDivisor()"><code class="function-signature">getTargetDesignatedReportNoShowsDivisor()</code></a></li><li><a href="#Reporting.getTargetRepMarketCapMultiplier()"><code class="function-signature">getTargetRepMarketCapMultiplier()</code></a></li><li><a href="#Reporting.getMaximumReportingFeeDivisor()"><code class="function-signature">getMaximumReportingFeeDivisor()</code></a></li><li><a href="#Reporting.getMinimumReportingFeeDivisor()"><code class="function-signature">getMinimumReportingFeeDivisor()</code></a></li><li><a href="#Reporting.getDefaultReportingFeeDivisor()"><code class="function-signature">getDefaultReportingFeeDivisor()</code></a></li><li><a href="#Reporting.getInitialREPSupply()"><code class="function-signature">getInitialREPSupply()</code></a></li><li><a href="#Reporting.getAffiliateSourceCutDivisor()"><code class="function-signature">getAffiliateSourceCutDivisor()</code></a></li><li><a href="#Reporting.getForkThresholdDivisor()"><code class="function-signature">getForkThresholdDivisor()</code></a></li><li><a href="#Reporting.getMaximumDisputeRounds()"><code class="function-signature">getMaximumDisputeRounds()</code></a></li><li><a href="#Reporting.getMinimumSlowRounds()"><code class="function-signature">getMinimumSlowRounds()</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="Reporting.getDesignatedReportingDurationSeconds()"></a><code class="function-signature">getDesignatedReportingDurationSeconds() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getInitialDisputeRoundDurationSeconds()"></a><code class="function-signature">getInitialDisputeRoundDurationSeconds() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getDisputeWindowBufferSeconds()"></a><code class="function-signature">getDisputeWindowBufferSeconds() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getDisputeRoundDurationSeconds()"></a><code class="function-signature">getDisputeRoundDurationSeconds() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getForkDurationSeconds()"></a><code class="function-signature">getForkDurationSeconds() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getBaseMarketDurationMaximum()"></a><code class="function-signature">getBaseMarketDurationMaximum() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getUpgradeCadence()"></a><code class="function-signature">getUpgradeCadence() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getInitialUpgradeTimestamp()"></a><code class="function-signature">getInitialUpgradeTimestamp() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getDefaultValidityBond()"></a><code class="function-signature">getDefaultValidityBond() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getValidityBondFloor()"></a><code class="function-signature">getValidityBondFloor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getTargetInvalidMarketsDivisor()"></a><code class="function-signature">getTargetInvalidMarketsDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getTargetIncorrectDesignatedReportMarketsDivisor()"></a><code class="function-signature">getTargetIncorrectDesignatedReportMarketsDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getTargetDesignatedReportNoShowsDivisor()"></a><code class="function-signature">getTargetDesignatedReportNoShowsDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getTargetRepMarketCapMultiplier()"></a><code class="function-signature">getTargetRepMarketCapMultiplier() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getMaximumReportingFeeDivisor()"></a><code class="function-signature">getMaximumReportingFeeDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getMinimumReportingFeeDivisor()"></a><code class="function-signature">getMinimumReportingFeeDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getDefaultReportingFeeDivisor()"></a><code class="function-signature">getDefaultReportingFeeDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getInitialREPSupply()"></a><code class="function-signature">getInitialREPSupply() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getAffiliateSourceCutDivisor()"></a><code class="function-signature">getAffiliateSourceCutDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getForkThresholdDivisor()"></a><code class="function-signature">getForkThresholdDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getMaximumDisputeRounds()"></a><code class="function-signature">getMaximumDisputeRounds() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Reporting.getMinimumSlowRounds()"></a><code class="function-signature">getMinimumSlowRounds() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>







### `Universe`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#Universe.constructor(contract IAugur,contract IUniverse,bytes32,uint256[])"><code class="function-signature">constructor(contract IAugur _augur, contract IUniverse _parentUniverse, bytes32 _parentPayoutDistributionHash, uint256[] _payoutNumerators)</code></a></li><li><a href="#Universe.fork()"><code class="function-signature">fork()</code></a></li><li><a href="#Universe.updateForkValues()"><code class="function-signature">updateForkValues()</code></a></li><li><a href="#Universe.getPayoutNumerator(uint256)"><code class="function-signature">getPayoutNumerator(uint256 _outcome)</code></a></li><li><a href="#Universe.getWinningChildPayoutNumerator(uint256)"><code class="function-signature">getWinningChildPayoutNumerator(uint256 _outcome)</code></a></li><li><a href="#Universe.getParentUniverse()"><code class="function-signature">getParentUniverse()</code></a></li><li><a href="#Universe.getParentPayoutDistributionHash()"><code class="function-signature">getParentPayoutDistributionHash()</code></a></li><li><a href="#Universe.getReputationToken()"><code class="function-signature">getReputationToken()</code></a></li><li><a href="#Universe.getForkingMarket()"><code class="function-signature">getForkingMarket()</code></a></li><li><a href="#Universe.getForkEndTime()"><code class="function-signature">getForkEndTime()</code></a></li><li><a href="#Universe.getForkReputationGoal()"><code class="function-signature">getForkReputationGoal()</code></a></li><li><a href="#Universe.getDisputeThresholdForFork()"><code class="function-signature">getDisputeThresholdForFork()</code></a></li><li><a href="#Universe.getDisputeThresholdForDisputePacing()"><code class="function-signature">getDisputeThresholdForDisputePacing()</code></a></li><li><a href="#Universe.getInitialReportMinValue()"><code class="function-signature">getInitialReportMinValue()</code></a></li><li><a href="#Universe.getPayoutNumerators()"><code class="function-signature">getPayoutNumerators()</code></a></li><li><a href="#Universe.getDisputeWindow(uint256)"><code class="function-signature">getDisputeWindow(uint256 _disputeWindowId)</code></a></li><li><a href="#Universe.isForking()"><code class="function-signature">isForking()</code></a></li><li><a href="#Universe.isForkingMarket()"><code class="function-signature">isForkingMarket()</code></a></li><li><a href="#Universe.getChildUniverse(bytes32)"><code class="function-signature">getChildUniverse(bytes32 _parentPayoutDistributionHash)</code></a></li><li><a href="#Universe.getDisputeWindowId(uint256,bool)"><code class="function-signature">getDisputeWindowId(uint256 _timestamp, bool _initial)</code></a></li><li><a href="#Universe.getDisputeRoundDurationInSeconds(bool)"><code class="function-signature">getDisputeRoundDurationInSeconds(bool _initial)</code></a></li><li><a href="#Universe.getOrCreateDisputeWindowByTimestamp(uint256,bool)"><code class="function-signature">getOrCreateDisputeWindowByTimestamp(uint256 _timestamp, bool _initial)</code></a></li><li><a href="#Universe.getDisputeWindowStartTimeAndDuration(uint256,bool)"><code class="function-signature">getDisputeWindowStartTimeAndDuration(uint256 _timestamp, bool _initial)</code></a></li><li><a href="#Universe.getDisputeWindowByTimestamp(uint256,bool)"><code class="function-signature">getDisputeWindowByTimestamp(uint256 _timestamp, bool _initial)</code></a></li><li><a href="#Universe.getOrCreatePreviousPreviousDisputeWindow(bool)"><code class="function-signature">getOrCreatePreviousPreviousDisputeWindow(bool _initial)</code></a></li><li><a href="#Universe.getOrCreatePreviousDisputeWindow(bool)"><code class="function-signature">getOrCreatePreviousDisputeWindow(bool _initial)</code></a></li><li><a href="#Universe.getOrCreateCurrentDisputeWindow(bool)"><code class="function-signature">getOrCreateCurrentDisputeWindow(bool _initial)</code></a></li><li><a href="#Universe.getCurrentDisputeWindow(bool)"><code class="function-signature">getCurrentDisputeWindow(bool _initial)</code></a></li><li><a href="#Universe.getOrCreateNextDisputeWindow(bool)"><code class="function-signature">getOrCreateNextDisputeWindow(bool _initial)</code></a></li><li><a href="#Universe.createChildUniverse(uint256[])"><code class="function-signature">createChildUniverse(uint256[] _parentPayoutNumerators)</code></a></li><li><a href="#Universe.updateTentativeWinningChildUniverse(bytes32)"><code class="function-signature">updateTentativeWinningChildUniverse(bytes32 _parentPayoutDistributionHash)</code></a></li><li><a href="#Universe.getWinningChildUniverse()"><code class="function-signature">getWinningChildUniverse()</code></a></li><li><a href="#Universe.isContainerForDisputeWindow(contract IDisputeWindow)"><code class="function-signature">isContainerForDisputeWindow(contract IDisputeWindow _shadyDisputeWindow)</code></a></li><li><a href="#Universe.isContainerForMarket(contract IMarket)"><code class="function-signature">isContainerForMarket(contract IMarket _shadyMarket)</code></a></li><li><a href="#Universe.migrateMarketOut(contract IUniverse)"><code class="function-signature">migrateMarketOut(contract IUniverse _destinationUniverse)</code></a></li><li><a href="#Universe.migrateMarketIn(contract IMarket,uint256,uint256)"><code class="function-signature">migrateMarketIn(contract IMarket _market, uint256 _cashBalance, uint256 _marketOI)</code></a></li><li><a href="#Universe.isContainerForReportingParticipant(contract IReportingParticipant)"><code class="function-signature">isContainerForReportingParticipant(contract IReportingParticipant _shadyReportingParticipant)</code></a></li><li><a href="#Universe.isParentOf(contract IUniverse)"><code class="function-signature">isParentOf(contract IUniverse _shadyChild)</code></a></li><li><a href="#Universe.decrementOpenInterest(uint256)"><code class="function-signature">decrementOpenInterest(uint256 _amount)</code></a></li><li><a href="#Universe.decrementOpenInterestFromMarket(contract IMarket)"><code class="function-signature">decrementOpenInterestFromMarket(contract IMarket _market)</code></a></li><li><a href="#Universe.incrementOpenInterest(uint256)"><code class="function-signature">incrementOpenInterest(uint256 _amount)</code></a></li><li><a href="#Universe.getOpenInterestInAttoCash()"><code class="function-signature">getOpenInterestInAttoCash()</code></a></li><li><a href="#Universe.isOpenInterestCash(address)"><code class="function-signature">isOpenInterestCash(address _address)</code></a></li><li><a href="#Universe.pokeRepMarketCapInAttoCash()"><code class="function-signature">pokeRepMarketCapInAttoCash()</code></a></li><li><a href="#Universe.getTargetRepMarketCapInAttoCash()"><code class="function-signature">getTargetRepMarketCapInAttoCash()</code></a></li><li><a href="#Universe.getOrCacheValidityBond()"><code class="function-signature">getOrCacheValidityBond()</code></a></li><li><a href="#Universe.getOrCacheDesignatedReportStake()"><code class="function-signature">getOrCacheDesignatedReportStake()</code></a></li><li><a href="#Universe.getOrCacheDesignatedReportNoShowBond()"><code class="function-signature">getOrCacheDesignatedReportNoShowBond()</code></a></li><li><a href="#Universe.getOrCacheMarketRepBond()"><code class="function-signature">getOrCacheMarketRepBond()</code></a></li><li><a href="#Universe.getOrCacheReportingFeeDivisor()"><code class="function-signature">getOrCacheReportingFeeDivisor()</code></a></li><li><a href="#Universe.getReportingFeeDivisor()"><code class="function-signature">getReportingFeeDivisor()</code></a></li><li><a href="#Universe.createYesNoMarket(uint256,uint256,contract IAffiliateValidator,uint256,address,string)"><code class="function-signature">createYesNoMarket(uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, string _extraInfo)</code></a></li><li><a href="#Universe.createCategoricalMarket(uint256,uint256,contract IAffiliateValidator,uint256,address,bytes32[],string)"><code class="function-signature">createCategoricalMarket(uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, bytes32[] _outcomes, string _extraInfo)</code></a></li><li><a href="#Universe.createScalarMarket(uint256,uint256,contract IAffiliateValidator,uint256,address,int256[],uint256,string)"><code class="function-signature">createScalarMarket(uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, int256[] _prices, uint256 _numTicks, string _extraInfo)</code></a></li><li><a href="#Universe.deposit(address,uint256,address)"><code class="function-signature">deposit(address _sender, uint256 _amount, address _market)</code></a></li><li><a href="#Universe.withdraw(address,uint256,address)"><code class="function-signature">withdraw(address _recipient, uint256 _amount, address _market)</code></a></li><li><a href="#Universe.runPeriodicals()"><code class="function-signature">runPeriodicals()</code></a></li><li class="inherited"><a href="#IUniverse.creationTime()"><code class="function-signature">creationTime()</code></a></li><li class="inherited"><a href="#IUniverse.marketBalance(address)"><code class="function-signature">marketBalance(address)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="Universe.constructor(contract IAugur,contract IUniverse,bytes32,uint256[])"></a><code class="function-signature">constructor(contract IAugur _augur, contract IUniverse _parentUniverse, bytes32 _parentPayoutDistributionHash, uint256[] _payoutNumerators)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.fork()"></a><code class="function-signature">fork() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.updateForkValues()"></a><code class="function-signature">updateForkValues() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getPayoutNumerator(uint256)"></a><code class="function-signature">getPayoutNumerator(uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getWinningChildPayoutNumerator(uint256)"></a><code class="function-signature">getWinningChildPayoutNumerator(uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getParentUniverse()"></a><code class="function-signature">getParentUniverse() <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getParentPayoutDistributionHash()"></a><code class="function-signature">getParentPayoutDistributionHash() <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getReputationToken()"></a><code class="function-signature">getReputationToken() <span class="return-arrow">→</span> <span class="return-type">contract IV2ReputationToken</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getForkingMarket()"></a><code class="function-signature">getForkingMarket() <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getForkEndTime()"></a><code class="function-signature">getForkEndTime() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getForkReputationGoal()"></a><code class="function-signature">getForkReputationGoal() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getDisputeThresholdForFork()"></a><code class="function-signature">getDisputeThresholdForFork() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getDisputeThresholdForDisputePacing()"></a><code class="function-signature">getDisputeThresholdForDisputePacing() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getInitialReportMinValue()"></a><code class="function-signature">getInitialReportMinValue() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getPayoutNumerators()"></a><code class="function-signature">getPayoutNumerators() <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getDisputeWindow(uint256)"></a><code class="function-signature">getDisputeWindow(uint256 _disputeWindowId) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.isForking()"></a><code class="function-signature">isForking() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.isForkingMarket()"></a><code class="function-signature">isForkingMarket() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getChildUniverse(bytes32)"></a><code class="function-signature">getChildUniverse(bytes32 _parentPayoutDistributionHash) <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getDisputeWindowId(uint256,bool)"></a><code class="function-signature">getDisputeWindowId(uint256 _timestamp, bool _initial) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getDisputeRoundDurationInSeconds(bool)"></a><code class="function-signature">getDisputeRoundDurationInSeconds(bool _initial) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getOrCreateDisputeWindowByTimestamp(uint256,bool)"></a><code class="function-signature">getOrCreateDisputeWindowByTimestamp(uint256 _timestamp, bool _initial) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getDisputeWindowStartTimeAndDuration(uint256,bool)"></a><code class="function-signature">getDisputeWindowStartTimeAndDuration(uint256 _timestamp, bool _initial) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getDisputeWindowByTimestamp(uint256,bool)"></a><code class="function-signature">getDisputeWindowByTimestamp(uint256 _timestamp, bool _initial) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getOrCreatePreviousPreviousDisputeWindow(bool)"></a><code class="function-signature">getOrCreatePreviousPreviousDisputeWindow(bool _initial) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getOrCreatePreviousDisputeWindow(bool)"></a><code class="function-signature">getOrCreatePreviousDisputeWindow(bool _initial) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getOrCreateCurrentDisputeWindow(bool)"></a><code class="function-signature">getOrCreateCurrentDisputeWindow(bool _initial) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getCurrentDisputeWindow(bool)"></a><code class="function-signature">getCurrentDisputeWindow(bool _initial) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getOrCreateNextDisputeWindow(bool)"></a><code class="function-signature">getOrCreateNextDisputeWindow(bool _initial) <span class="return-arrow">→</span> <span class="return-type">contract IDisputeWindow</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.createChildUniverse(uint256[])"></a><code class="function-signature">createChildUniverse(uint256[] _parentPayoutNumerators) <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.updateTentativeWinningChildUniverse(bytes32)"></a><code class="function-signature">updateTentativeWinningChildUniverse(bytes32 _parentPayoutDistributionHash) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getWinningChildUniverse()"></a><code class="function-signature">getWinningChildUniverse() <span class="return-arrow">→</span> <span class="return-type">contract IUniverse</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.isContainerForDisputeWindow(contract IDisputeWindow)"></a><code class="function-signature">isContainerForDisputeWindow(contract IDisputeWindow _shadyDisputeWindow) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.isContainerForMarket(contract IMarket)"></a><code class="function-signature">isContainerForMarket(contract IMarket _shadyMarket) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.migrateMarketOut(contract IUniverse)"></a><code class="function-signature">migrateMarketOut(contract IUniverse _destinationUniverse) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.migrateMarketIn(contract IMarket,uint256,uint256)"></a><code class="function-signature">migrateMarketIn(contract IMarket _market, uint256 _cashBalance, uint256 _marketOI) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.isContainerForReportingParticipant(contract IReportingParticipant)"></a><code class="function-signature">isContainerForReportingParticipant(contract IReportingParticipant _shadyReportingParticipant) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.isParentOf(contract IUniverse)"></a><code class="function-signature">isParentOf(contract IUniverse _shadyChild) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.decrementOpenInterest(uint256)"></a><code class="function-signature">decrementOpenInterest(uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.decrementOpenInterestFromMarket(contract IMarket)"></a><code class="function-signature">decrementOpenInterestFromMarket(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.incrementOpenInterest(uint256)"></a><code class="function-signature">incrementOpenInterest(uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getOpenInterestInAttoCash()"></a><code class="function-signature">getOpenInterestInAttoCash() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.isOpenInterestCash(address)"></a><code class="function-signature">isOpenInterestCash(address _address) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.pokeRepMarketCapInAttoCash()"></a><code class="function-signature">pokeRepMarketCapInAttoCash() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getTargetRepMarketCapInAttoCash()"></a><code class="function-signature">getTargetRepMarketCapInAttoCash() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getOrCacheValidityBond()"></a><code class="function-signature">getOrCacheValidityBond() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getOrCacheDesignatedReportStake()"></a><code class="function-signature">getOrCacheDesignatedReportStake() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getOrCacheDesignatedReportNoShowBond()"></a><code class="function-signature">getOrCacheDesignatedReportNoShowBond() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getOrCacheMarketRepBond()"></a><code class="function-signature">getOrCacheMarketRepBond() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.getOrCacheReportingFeeDivisor()"></a><code class="function-signature">getOrCacheReportingFeeDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>

this should be used in contracts so that the fee is actually set




<h4><a class="anchor" aria-hidden="true" id="Universe.getReportingFeeDivisor()"></a><code class="function-signature">getReportingFeeDivisor() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>

this should be used for estimation purposes as it is a view and does not actually freeze or recalculate the rate




<h4><a class="anchor" aria-hidden="true" id="Universe.createYesNoMarket(uint256,uint256,contract IAffiliateValidator,uint256,address,string)"></a><code class="function-signature">createYesNoMarket(uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, string _extraInfo) <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.createCategoricalMarket(uint256,uint256,contract IAffiliateValidator,uint256,address,bytes32[],string)"></a><code class="function-signature">createCategoricalMarket(uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, bytes32[] _outcomes, string _extraInfo) <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.createScalarMarket(uint256,uint256,contract IAffiliateValidator,uint256,address,int256[],uint256,string)"></a><code class="function-signature">createScalarMarket(uint256 _endTime, uint256 _feePerCashInAttoCash, contract IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, int256[] _prices, uint256 _numTicks, string _extraInfo) <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.deposit(address,uint256,address)"></a><code class="function-signature">deposit(address _sender, uint256 _amount, address _market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.withdraw(address,uint256,address)"></a><code class="function-signature">withdraw(address _recipient, uint256 _amount, address _market) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Universe.runPeriodicals()"></a><code class="function-signature">runPeriodicals() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>







### `ExecutorAcl`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#ExecutorAcl.setIsExecuting(bool)"><code class="function-signature">setIsExecuting(bool executing)</code></a></li><li class="inherited"><a href="#Initializable.endInitialization()"><code class="function-signature">endInitialization()</code></a></li><li class="inherited"><a href="#Initializable.getInitialized()"><code class="function-signature">getInitialized()</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="ExecutorAcl.setIsExecuting(bool)"></a><code class="function-signature">setIsExecuting(bool executing)</code><span class="function-visibility">public</span></h4>







### `ExitCash`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#ExitCash.faucet(address,uint256)"><code class="function-signature">faucet(address _account, uint256 _amount)</code></a></li><li><a href="#ExitCash.getTypeName()"><code class="function-signature">getTypeName()</code></a></li><li><a href="#ExitCash.onTokenTransfer(address,address,uint256)"><code class="function-signature">onTokenTransfer(address _from, address _to, uint256 _value)</code></a></li><li><a href="#ExitCash.initialize(address)"><code class="function-signature">initialize(address _augurPredicate)</code></a></li><li><a href="#ExitCash.transfer(address,uint256)"><code class="function-signature">transfer(address _to, uint256 _amount)</code></a></li><li><a href="#ExitCash.transferFrom(address,address,uint256)"><code class="function-signature">transferFrom(address _from, address _to, uint256 _amount)</code></a></li><li><a href="#ExitCash.increaseAllowance(address,uint256)"><code class="function-signature">increaseAllowance(address _spender, uint256 _addedValue)</code></a></li><li><a href="#ExitCash.decreaseAllowance(address,uint256)"><code class="function-signature">decreaseAllowance(address _spender, uint256 _subtractedValue)</code></a></li><li class="inherited"><a href="#ExecutorAcl.setIsExecuting(bool)"><code class="function-signature">setIsExecuting(bool executing)</code></a></li><li class="inherited"><a href="#Initializable.endInitialization()"><code class="function-signature">endInitialization()</code></a></li><li class="inherited"><a href="#Initializable.getInitialized()"><code class="function-signature">getInitialized()</code></a></li><li class="inherited"><a href="matic#VariableSupplyToken.mint(address,uint256)"><code class="function-signature">mint(address _target, uint256 _amount)</code></a></li><li class="inherited"><a href="matic#VariableSupplyToken.burn(address,uint256)"><code class="function-signature">burn(address _target, uint256 _amount)</code></a></li><li class="inherited"><a href="matic#VariableSupplyToken.onMint(address,uint256)"><code class="function-signature">onMint(address, uint256)</code></a></li><li class="inherited"><a href="matic#VariableSupplyToken.onBurn(address,uint256)"><code class="function-signature">onBurn(address, uint256)</code></a></li><li class="inherited"><a href="#ERC20.balanceOf(address)"><code class="function-signature">balanceOf(address _account)</code></a></li><li class="inherited"><a href="#ERC20.allowance(address,address)"><code class="function-signature">allowance(address _owner, address _spender)</code></a></li><li class="inherited"><a href="#ERC20.approve(address,uint256)"><code class="function-signature">approve(address _spender, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20._transfer(address,address,uint256)"><code class="function-signature">_transfer(address _sender, address _recipient, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20._mint(address,uint256)"><code class="function-signature">_mint(address _account, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20._burn(address,uint256)"><code class="function-signature">_burn(address _account, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20._approve(address,address,uint256)"><code class="function-signature">_approve(address _owner, address _spender, uint256 _amount)</code></a></li><li class="inherited"><a href="#ERC20._burnFrom(address,uint256)"><code class="function-signature">_burnFrom(address _account, uint256 _amount)</code></a></li><li class="inherited"><a href="#IERC20.totalSupply()"><code class="function-signature">totalSupply()</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC20.Transfer(address,address,uint256)"><code class="function-signature">Transfer(address from, address to, uint256 value)</code></a></li><li class="inherited"><a href="#IERC20.Approval(address,address,uint256)"><code class="function-signature">Approval(address owner, address spender, uint256 value)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="ExitCash.faucet(address,uint256)"></a><code class="function-signature">faucet(address _account, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitCash.getTypeName()"></a><code class="function-signature">getTypeName() <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitCash.onTokenTransfer(address,address,uint256)"></a><code class="function-signature">onTokenTransfer(address _from, address _to, uint256 _value)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitCash.initialize(address)"></a><code class="function-signature">initialize(address _augurPredicate)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitCash.transfer(address,uint256)"></a><code class="function-signature">transfer(address _to, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitCash.transferFrom(address,address,uint256)"></a><code class="function-signature">transferFrom(address _from, address _to, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitCash.increaseAllowance(address,uint256)"></a><code class="function-signature">increaseAllowance(address _spender, uint256 _addedValue) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitCash.decreaseAllowance(address,uint256)"></a><code class="function-signature">decreaseAllowance(address _spender, uint256 _subtractedValue) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>







### `ExitFillOrder`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#ExitFillOrder.initialize(contract IAugur,contract IAugurTrading,address,address,address)"><code class="function-signature">initialize(contract IAugur _augur, contract IAugurTrading _augurTrading, address _zeroXTrade, address _exitCash, address _exitShareToken)</code></a></li><li><a href="#ExitFillOrder.publicFillOrder(bytes32,uint256,bytes32,bytes32)"><code class="function-signature">publicFillOrder(bytes32 _orderId, uint256 _amountFillerWants, bytes32 _tradeGroupId, bytes32 _fingerprint)</code></a></li><li><a href="#ExitFillOrder.fillOrder(address,bytes32,uint256,bytes32,bytes32)"><code class="function-signature">fillOrder(address _filler, bytes32 _orderId, uint256 _amountFillerWants, bytes32 _tradeGroupId, bytes32 _fingerprint)</code></a></li><li><a href="#ExitFillOrder.fillZeroXOrder(struct IExitFillOrder.FillZeroXOrderArguments)"><code class="function-signature">fillZeroXOrder(struct IExitFillOrder.FillZeroXOrderArguments args)</code></a></li><li><a href="#ExitFillOrder.fillOrderInternal(address,struct Trade.Data,uint256,bytes32)"><code class="function-signature">fillOrderInternal(address _filler, struct Trade.Data _tradeData, uint256 _amountFillerWants, bytes32 _tradeGroupId)</code></a></li><li><a href="#ExitFillOrder.sellCompleteSets(struct Trade.Data)"><code class="function-signature">sellCompleteSets(struct Trade.Data _tradeData)</code></a></li><li><a href="#ExitFillOrder.getMarketOutcomeValues(contract IMarket)"><code class="function-signature">getMarketOutcomeValues(contract IMarket _market)</code></a></li><li><a href="#ExitFillOrder.getMarketVolume(contract IMarket)"><code class="function-signature">getMarketVolume(contract IMarket _market)</code></a></li><li class="inherited"><a href="#Initializable.endInitialization()"><code class="function-signature">endInitialization()</code></a></li><li class="inherited"><a href="#Initializable.getInitialized()"><code class="function-signature">getInitialized()</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="ExitFillOrder.initialize(contract IAugur,contract IAugurTrading,address,address,address)"></a><code class="function-signature">initialize(contract IAugur _augur, contract IAugurTrading _augurTrading, address _zeroXTrade, address _exitCash, address _exitShareToken)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitFillOrder.publicFillOrder(bytes32,uint256,bytes32,bytes32)"></a><code class="function-signature">publicFillOrder(bytes32 _orderId, uint256 _amountFillerWants, bytes32 _tradeGroupId, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitFillOrder.fillOrder(address,bytes32,uint256,bytes32,bytes32)"></a><code class="function-signature">fillOrder(address _filler, bytes32 _orderId, uint256 _amountFillerWants, bytes32 _tradeGroupId, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitFillOrder.fillZeroXOrder(struct IExitFillOrder.FillZeroXOrderArguments)"></a><code class="function-signature">fillZeroXOrder(struct IExitFillOrder.FillZeroXOrderArguments args) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitFillOrder.fillOrderInternal(address,struct Trade.Data,uint256,bytes32)"></a><code class="function-signature">fillOrderInternal(address _filler, struct Trade.Data _tradeData, uint256 _amountFillerWants, bytes32 _tradeGroupId) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitFillOrder.sellCompleteSets(struct Trade.Data)"></a><code class="function-signature">sellCompleteSets(struct Trade.Data _tradeData) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitFillOrder.getMarketOutcomeValues(contract IMarket)"></a><code class="function-signature">getMarketOutcomeValues(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitFillOrder.getMarketVolume(contract IMarket)"></a><code class="function-signature">getMarketVolume(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>







### `IExitFillOrder`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IExitFillOrder.fillZeroXOrder(struct IExitFillOrder.FillZeroXOrderArguments)"><code class="function-signature">fillZeroXOrder(struct IExitFillOrder.FillZeroXOrderArguments args)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IExitFillOrder.fillZeroXOrder(struct IExitFillOrder.FillZeroXOrderArguments)"></a><code class="function-signature">fillZeroXOrder(struct IExitFillOrder.FillZeroXOrderArguments args) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>







### `Trade`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#Trade.create(struct Trade.StoredContracts,bytes32,address,uint256,bytes32)"><code class="function-signature">create(struct Trade.StoredContracts _storedContracts, bytes32 _orderId, address _fillerAddress, uint256 _fillerSize, bytes32 _fingerprint)</code></a></li><li><a href="#Trade.createWithData(struct Trade.StoredContracts,struct Trade.OrderData,address,uint256,bytes32)"><code class="function-signature">createWithData(struct Trade.StoredContracts _storedContracts, struct Trade.OrderData _orderData, address _fillerAddress, uint256 _fillerSize, bytes32 _fingerprint)</code></a></li><li><a href="#Trade.createOrderDataWithOrderId(struct Trade.StoredContracts,bytes32)"><code class="function-signature">createOrderDataWithOrderId(struct Trade.StoredContracts _storedContracts, bytes32 _orderId)</code></a></li><li><a href="#Trade.createOrderData(contract IShareToken,contract IMarket,uint256,uint256,enum Order.Types,uint256,address)"><code class="function-signature">createOrderData(contract IShareToken _shareToken, contract IMarket _market, uint256 _outcome, uint256 _price, enum Order.Types _orderType, uint256 _amount, address _creator)</code></a></li><li><a href="#Trade.tradeMakerSharesForFillerShares(struct Trade.Data)"><code class="function-signature">tradeMakerSharesForFillerShares(struct Trade.Data _data)</code></a></li><li><a href="#Trade.tradeMakerSharesForFillerTokens(struct Trade.Data)"><code class="function-signature">tradeMakerSharesForFillerTokens(struct Trade.Data _data)</code></a></li><li><a href="#Trade.tradeMakerTokensForFillerShares(struct Trade.Data)"><code class="function-signature">tradeMakerTokensForFillerShares(struct Trade.Data _data)</code></a></li><li><a href="#Trade.tradeMakerTokensForFillerTokens(struct Trade.Data)"><code class="function-signature">tradeMakerTokensForFillerTokens(struct Trade.Data _data)</code></a></li><li><a href="#Trade.getLongShareBuyerDestination(struct Trade.Data)"><code class="function-signature">getLongShareBuyerDestination(struct Trade.Data _data)</code></a></li><li><a href="#Trade.getShortShareBuyerDestination(struct Trade.Data)"><code class="function-signature">getShortShareBuyerDestination(struct Trade.Data _data)</code></a></li><li><a href="#Trade.getLongShareSellerSource(struct Trade.Data)"><code class="function-signature">getLongShareSellerSource(struct Trade.Data _data)</code></a></li><li><a href="#Trade.getShortShareSellerSource(struct Trade.Data)"><code class="function-signature">getShortShareSellerSource(struct Trade.Data _data)</code></a></li><li><a href="#Trade.getLongShareSellerDestination(struct Trade.Data)"><code class="function-signature">getLongShareSellerDestination(struct Trade.Data _data)</code></a></li><li><a href="#Trade.getShortShareSellerDestination(struct Trade.Data)"><code class="function-signature">getShortShareSellerDestination(struct Trade.Data _data)</code></a></li><li><a href="#Trade.getMakerSharesDepleted(struct Trade.Data)"><code class="function-signature">getMakerSharesDepleted(struct Trade.Data _data)</code></a></li><li><a href="#Trade.getFillerSharesDepleted(struct Trade.Data)"><code class="function-signature">getFillerSharesDepleted(struct Trade.Data _data)</code></a></li><li><a href="#Trade.getMakerTokensDepleted(struct Trade.Data)"><code class="function-signature">getMakerTokensDepleted(struct Trade.Data _data)</code></a></li><li><a href="#Trade.getFillerTokensDepleted(struct Trade.Data)"><code class="function-signature">getFillerTokensDepleted(struct Trade.Data _data)</code></a></li><li><a href="#Trade.getTokensDepleted(struct Trade.Data,enum Trade.Direction,uint256,uint256)"><code class="function-signature">getTokensDepleted(struct Trade.Data _data, enum Trade.Direction _direction, uint256 _startingSharesToBuy, uint256 _endingSharesToBuy)</code></a></li><li><a href="#Trade.getTokensToCover(struct Trade.Data,enum Trade.Direction,uint256)"><code class="function-signature">getTokensToCover(struct Trade.Data _data, enum Trade.Direction _direction, uint256 _numShares)</code></a></li><li><a href="#Trade.getTokensToCover(enum Trade.Direction,uint256,uint256,uint256)"><code class="function-signature">getTokensToCover(enum Trade.Direction _direction, uint256 _sharePriceLong, uint256 _sharePriceShort, uint256 _numShares)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="Trade.create(struct Trade.StoredContracts,bytes32,address,uint256,bytes32)"></a><code class="function-signature">create(struct Trade.StoredContracts _storedContracts, bytes32 _orderId, address _fillerAddress, uint256 _fillerSize, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">struct Trade.Data</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.createWithData(struct Trade.StoredContracts,struct Trade.OrderData,address,uint256,bytes32)"></a><code class="function-signature">createWithData(struct Trade.StoredContracts _storedContracts, struct Trade.OrderData _orderData, address _fillerAddress, uint256 _fillerSize, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">struct Trade.Data</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.createOrderDataWithOrderId(struct Trade.StoredContracts,bytes32)"></a><code class="function-signature">createOrderDataWithOrderId(struct Trade.StoredContracts _storedContracts, bytes32 _orderId) <span class="return-arrow">→</span> <span class="return-type">struct Trade.OrderData</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.createOrderData(contract IShareToken,contract IMarket,uint256,uint256,enum Order.Types,uint256,address)"></a><code class="function-signature">createOrderData(contract IShareToken _shareToken, contract IMarket _market, uint256 _outcome, uint256 _price, enum Order.Types _orderType, uint256 _amount, address _creator) <span class="return-arrow">→</span> <span class="return-type">struct Trade.OrderData</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.tradeMakerSharesForFillerShares(struct Trade.Data)"></a><code class="function-signature">tradeMakerSharesForFillerShares(struct Trade.Data _data) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.tradeMakerSharesForFillerTokens(struct Trade.Data)"></a><code class="function-signature">tradeMakerSharesForFillerTokens(struct Trade.Data _data) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.tradeMakerTokensForFillerShares(struct Trade.Data)"></a><code class="function-signature">tradeMakerTokensForFillerShares(struct Trade.Data _data) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.tradeMakerTokensForFillerTokens(struct Trade.Data)"></a><code class="function-signature">tradeMakerTokensForFillerTokens(struct Trade.Data _data) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.getLongShareBuyerDestination(struct Trade.Data)"></a><code class="function-signature">getLongShareBuyerDestination(struct Trade.Data _data) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.getShortShareBuyerDestination(struct Trade.Data)"></a><code class="function-signature">getShortShareBuyerDestination(struct Trade.Data _data) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.getLongShareSellerSource(struct Trade.Data)"></a><code class="function-signature">getLongShareSellerSource(struct Trade.Data _data) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.getShortShareSellerSource(struct Trade.Data)"></a><code class="function-signature">getShortShareSellerSource(struct Trade.Data _data) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.getLongShareSellerDestination(struct Trade.Data)"></a><code class="function-signature">getLongShareSellerDestination(struct Trade.Data _data) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.getShortShareSellerDestination(struct Trade.Data)"></a><code class="function-signature">getShortShareSellerDestination(struct Trade.Data _data) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.getMakerSharesDepleted(struct Trade.Data)"></a><code class="function-signature">getMakerSharesDepleted(struct Trade.Data _data) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.getFillerSharesDepleted(struct Trade.Data)"></a><code class="function-signature">getFillerSharesDepleted(struct Trade.Data _data) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.getMakerTokensDepleted(struct Trade.Data)"></a><code class="function-signature">getMakerTokensDepleted(struct Trade.Data _data) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.getFillerTokensDepleted(struct Trade.Data)"></a><code class="function-signature">getFillerTokensDepleted(struct Trade.Data _data) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.getTokensDepleted(struct Trade.Data,enum Trade.Direction,uint256,uint256)"></a><code class="function-signature">getTokensDepleted(struct Trade.Data _data, enum Trade.Direction _direction, uint256 _startingSharesToBuy, uint256 _endingSharesToBuy) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.getTokensToCover(struct Trade.Data,enum Trade.Direction,uint256)"></a><code class="function-signature">getTokensToCover(struct Trade.Data _data, enum Trade.Direction _direction, uint256 _numShares) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="Trade.getTokensToCover(enum Trade.Direction,uint256,uint256,uint256)"></a><code class="function-signature">getTokensToCover(enum Trade.Direction _direction, uint256 _sharePriceLong, uint256 _sharePriceShort, uint256 _numShares) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>







### `ExitShareToken`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#ExitShareToken.initialize(contract IAugur,address,address)"><code class="function-signature">initialize(contract IAugur _augur, address _cash, address _augurPredicate)</code></a></li><li><a href="#ExitShareToken.unsafeTransferFrom(address,address,uint256,uint256)"><code class="function-signature">unsafeTransferFrom(address _from, address _to, uint256 _id, uint256 _value)</code></a></li><li><a href="#ExitShareToken.unsafeBatchTransferFrom(address,address,uint256[],uint256[])"><code class="function-signature">unsafeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values)</code></a></li><li><a href="#ExitShareToken.initializeMarket(contract IMarket,uint256,uint256)"><code class="function-signature">initializeMarket(contract IMarket _market, uint256 _numOutcomes, uint256 _numTicks)</code></a></li><li><a href="#ExitShareToken.publicBuyCompleteSets(contract IMarket,uint256)"><code class="function-signature">publicBuyCompleteSets(contract IMarket _market, uint256 _amount)</code></a></li><li><a href="#ExitShareToken.buyCompleteSets(contract IMarket,address,uint256)"><code class="function-signature">buyCompleteSets(contract IMarket _market, address _account, uint256 _amount)</code></a></li><li><a href="#ExitShareToken.buyCompleteSetsInternal(contract IMarket,address,uint256)"><code class="function-signature">buyCompleteSetsInternal(contract IMarket _market, address _account, uint256 _amount)</code></a></li><li><a href="#ExitShareToken.buyCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address)"><code class="function-signature">buyCompleteSetsForTrade(contract IMarket _market, uint256 _amount, uint256 _longOutcome, address _longRecipient, address _shortRecipient)</code></a></li><li><a href="#ExitShareToken.publicSellCompleteSets(contract IMarket,uint256)"><code class="function-signature">publicSellCompleteSets(contract IMarket _market, uint256 _amount)</code></a></li><li><a href="#ExitShareToken.sellCompleteSets(contract IMarket,address,address,uint256,bytes32)"><code class="function-signature">sellCompleteSets(contract IMarket _market, address _holder, address _recipient, uint256 _amount, bytes32 _fingerprint)</code></a></li><li><a href="#ExitShareToken.sellCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address,address,address,uint256,address,bytes32)"><code class="function-signature">sellCompleteSetsForTrade(contract IMarket _market, uint256 _outcome, uint256 _amount, address _shortParticipant, address _longParticipant, address _shortRecipient, address _longRecipient, uint256 _price, address _sourceAccount, bytes32 _fingerprint)</code></a></li><li><a href="#ExitShareToken.claimTradingProceeds(contract IMarket,address,bytes32)"><code class="function-signature">claimTradingProceeds(contract IMarket _market, address _shareHolder, bytes32 _fingerprint)</code></a></li><li><a href="#ExitShareToken.claimTradingProceedsInternal(contract IMarket,address,bytes32)"><code class="function-signature">claimTradingProceedsInternal(contract IMarket _market, address _shareHolder, bytes32 _fingerprint)</code></a></li><li><a href="#ExitShareToken.divideUpWinnings(contract IMarket,uint256,uint256)"><code class="function-signature">divideUpWinnings(contract IMarket _market, uint256 _outcome, uint256 _numberOfShares)</code></a></li><li><a href="#ExitShareToken.calculateProceeds(contract IMarket,uint256,uint256)"><code class="function-signature">calculateProceeds(contract IMarket _market, uint256 _outcome, uint256 _numberOfShares)</code></a></li><li><a href="#ExitShareToken.calculateReportingFee(contract IMarket,uint256)"><code class="function-signature">calculateReportingFee(contract IMarket _market, uint256 _amount)</code></a></li><li><a href="#ExitShareToken.calculateCreatorFee(contract IMarket,uint256)"><code class="function-signature">calculateCreatorFee(contract IMarket _market, uint256 _amount)</code></a></li><li><a href="#ExitShareToken.getTypeName()"><code class="function-signature">getTypeName()</code></a></li><li><a href="#ExitShareToken.getMarket(uint256)"><code class="function-signature">getMarket(uint256 _tokenId)</code></a></li><li><a href="#ExitShareToken.getOutcome(uint256)"><code class="function-signature">getOutcome(uint256 _tokenId)</code></a></li><li><a href="#ExitShareToken.totalSupplyForMarketOutcome(contract IMarket,uint256)"><code class="function-signature">totalSupplyForMarketOutcome(contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#ExitShareToken.balanceOfMarketOutcome(contract IMarket,uint256,address)"><code class="function-signature">balanceOfMarketOutcome(contract IMarket _market, uint256 _outcome, address _account)</code></a></li><li><a href="#ExitShareToken.lowestBalanceOfMarketOutcomes(contract IMarket,uint256[],address)"><code class="function-signature">lowestBalanceOfMarketOutcomes(contract IMarket _market, uint256[] _outcomes, address _account)</code></a></li><li><a href="#ExitShareToken.assertBalances(contract IMarket)"><code class="function-signature">assertBalances(contract IMarket _market)</code></a></li><li><a href="#ExitShareToken.getTokenId(contract IMarket,uint256)"><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome)</code></a></li><li><a href="#ExitShareToken.getTokenIds(contract IMarket,uint256[])"><code class="function-signature">getTokenIds(contract IMarket _market, uint256[] _outcomes)</code></a></li><li><a href="#ExitShareToken.unpackTokenId(uint256)"><code class="function-signature">unpackTokenId(uint256 _tokenId)</code></a></li><li><a href="#ExitShareToken.onTokenTransfer(uint256,address,address,uint256)"><code class="function-signature">onTokenTransfer(uint256 _tokenId, address _from, address _to, uint256 _value)</code></a></li><li><a href="#ExitShareToken.onMint(uint256,address,uint256)"><code class="function-signature">onMint(uint256 _tokenId, address _target, uint256 _amount)</code></a></li><li><a href="#ExitShareToken.onBurn(uint256,address,uint256)"><code class="function-signature">onBurn(uint256 _tokenId, address _target, uint256 _amount)</code></a></li><li><a href="#ExitShareToken.mint(address,contract IMarket,uint256,uint256)"><code class="function-signature">mint(address to, contract IMarket market, uint256 outcome, uint256 balance)</code></a></li><li class="inherited"><a href="matic#ExecutorAcl.setIsExecuting(bool)"><code class="function-signature">setIsExecuting(bool executing)</code></a></li><li class="inherited"><a href="#Initializable.endInitialization()"><code class="function-signature">endInitialization()</code></a></li><li class="inherited"><a href="#Initializable.getInitialized()"><code class="function-signature">getInitialized()</code></a></li><li class="inherited"><a href="matic#ERC1155.constructor()"><code class="function-signature">constructor()</code></a></li><li class="inherited"><a href="matic#ERC1155.balanceOf(address,uint256)"><code class="function-signature">balanceOf(address account, uint256 id)</code></a></li><li class="inherited"><a href="matic#ERC1155.totalSupply(uint256)"><code class="function-signature">totalSupply(uint256 id)</code></a></li><li class="inherited"><a href="matic#ERC1155.balanceOfBatch(address[],uint256[])"><code class="function-signature">balanceOfBatch(address[] accounts, uint256[] ids)</code></a></li><li class="inherited"><a href="matic#ERC1155.setApprovalForAll(address,bool)"><code class="function-signature">setApprovalForAll(address operator, bool approved)</code></a></li><li class="inherited"><a href="matic#ERC1155.isApprovedForAll(address,address)"><code class="function-signature">isApprovedForAll(address account, address operator)</code></a></li><li class="inherited"><a href="matic#ERC1155.safeTransferFrom(address,address,uint256,uint256,bytes)"><code class="function-signature">safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes data)</code></a></li><li class="inherited"><a href="matic#ERC1155._transferFrom(address,address,uint256,uint256,bytes,bool)"><code class="function-signature">_transferFrom(address from, address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="matic#ERC1155._internalTransferFrom(address,address,uint256,uint256,bytes,bool)"><code class="function-signature">_internalTransferFrom(address from, address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="matic#ERC1155.safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)"><code class="function-signature">safeBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data)</code></a></li><li class="inherited"><a href="matic#ERC1155._batchTransferFrom(address,address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_batchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="matic#ERC1155._internalBatchTransferFrom(address,address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_internalBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="matic#ERC1155._mint(address,uint256,uint256,bytes,bool)"><code class="function-signature">_mint(address to, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="matic#ERC1155._mintBatch(address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_mintBatch(address to, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="matic#ERC1155._burn(address,uint256,uint256,bytes,bool)"><code class="function-signature">_burn(address account, uint256 id, uint256 value, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="matic#ERC1155._burnBatch(address,uint256[],uint256[],bytes,bool)"><code class="function-signature">_burnBatch(address account, uint256[] ids, uint256[] values, bytes data, bool doAcceptanceCheck)</code></a></li><li class="inherited"><a href="matic#ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes)"><code class="function-signature">_doSafeTransferAcceptanceCheck(address operator, address from, address to, uint256 id, uint256 value, bytes data)</code></a></li><li class="inherited"><a href="matic#ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes)"><code class="function-signature">_doSafeBatchTransferAcceptanceCheck(address operator, address from, address to, uint256[] ids, uint256[] values, bytes data)</code></a></li><li class="inherited"><a href="matic#ERC165.supportsInterface(bytes4)"><code class="function-signature">supportsInterface(bytes4 interfaceId)</code></a></li><li class="inherited"><a href="matic#ERC165._registerInterface(bytes4)"><code class="function-signature">_registerInterface(bytes4 interfaceId)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC1155.TransferSingle(address,address,address,uint256,uint256)"><code class="function-signature">TransferSingle(address operator, address from, address to, uint256 id, uint256 value)</code></a></li><li class="inherited"><a href="#IERC1155.TransferBatch(address,address,address,uint256[],uint256[])"><code class="function-signature">TransferBatch(address operator, address from, address to, uint256[] ids, uint256[] values)</code></a></li><li class="inherited"><a href="#IERC1155.ApprovalForAll(address,address,bool)"><code class="function-signature">ApprovalForAll(address owner, address operator, bool approved)</code></a></li><li class="inherited"><a href="#IERC1155.URI(string,uint256)"><code class="function-signature">URI(string value, uint256 id)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.initialize(contract IAugur,address,address)"></a><code class="function-signature">initialize(contract IAugur _augur, address _cash, address _augurPredicate)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.unsafeTransferFrom(address,address,uint256,uint256)"></a><code class="function-signature">unsafeTransferFrom(address _from, address _to, uint256 _id, uint256 _value)</code><span class="function-visibility">public</span></h4>

Transfers `value` amount of an `id` from the `from` address to the `to` address specified.
Caller must be approved to manage the tokens being transferred out of the `from` account.
Regardless of if the desintation is a contract or not this will not call `onERC1155Received` on `to`




<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.unsafeBatchTransferFrom(address,address,uint256[],uint256[])"></a><code class="function-signature">unsafeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values)</code><span class="function-visibility">public</span></h4>

Transfers `values` amount(s) of `ids` from the `from` address to the
`to` address specified. Caller must be approved to manage the tokens being
transferred out of the `from` account. Regardless of if the desintation is
a contract or not this will not call `onERC1155Received` on `to`




<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.initializeMarket(contract IMarket,uint256,uint256)"></a><code class="function-signature">initializeMarket(contract IMarket _market, uint256 _numOutcomes, uint256 _numTicks)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.publicBuyCompleteSets(contract IMarket,uint256)"></a><code class="function-signature">publicBuyCompleteSets(contract IMarket _market, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.buyCompleteSets(contract IMarket,address,uint256)"></a><code class="function-signature">buyCompleteSets(contract IMarket _market, address _account, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.buyCompleteSetsInternal(contract IMarket,address,uint256)"></a><code class="function-signature">buyCompleteSetsInternal(contract IMarket _market, address _account, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.buyCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address)"></a><code class="function-signature">buyCompleteSetsForTrade(contract IMarket _market, uint256 _amount, uint256 _longOutcome, address _longRecipient, address _shortRecipient) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.publicSellCompleteSets(contract IMarket,uint256)"></a><code class="function-signature">publicSellCompleteSets(contract IMarket _market, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.sellCompleteSets(contract IMarket,address,address,uint256,bytes32)"></a><code class="function-signature">sellCompleteSets(contract IMarket _market, address _holder, address _recipient, uint256 _amount, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.sellCompleteSetsForTrade(contract IMarket,uint256,uint256,address,address,address,address,uint256,address,bytes32)"></a><code class="function-signature">sellCompleteSetsForTrade(contract IMarket _market, uint256 _outcome, uint256 _amount, address _shortParticipant, address _longParticipant, address _shortRecipient, address _longRecipient, uint256 _price, address _sourceAccount, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.claimTradingProceeds(contract IMarket,address,bytes32)"></a><code class="function-signature">claimTradingProceeds(contract IMarket _market, address _shareHolder, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.claimTradingProceedsInternal(contract IMarket,address,bytes32)"></a><code class="function-signature">claimTradingProceedsInternal(contract IMarket _market, address _shareHolder, bytes32 _fingerprint) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.divideUpWinnings(contract IMarket,uint256,uint256)"></a><code class="function-signature">divideUpWinnings(contract IMarket _market, uint256 _outcome, uint256 _numberOfShares) <span class="return-arrow">→</span> <span class="return-type">uint256,uint256,uint256,uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.calculateProceeds(contract IMarket,uint256,uint256)"></a><code class="function-signature">calculateProceeds(contract IMarket _market, uint256 _outcome, uint256 _numberOfShares) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.calculateReportingFee(contract IMarket,uint256)"></a><code class="function-signature">calculateReportingFee(contract IMarket _market, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.calculateCreatorFee(contract IMarket,uint256)"></a><code class="function-signature">calculateCreatorFee(contract IMarket _market, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.getTypeName()"></a><code class="function-signature">getTypeName() <span class="return-arrow">→</span> <span class="return-type">bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.getMarket(uint256)"></a><code class="function-signature">getMarket(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">contract IMarket</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.getOutcome(uint256)"></a><code class="function-signature">getOutcome(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.totalSupplyForMarketOutcome(contract IMarket,uint256)"></a><code class="function-signature">totalSupplyForMarketOutcome(contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.balanceOfMarketOutcome(contract IMarket,uint256,address)"></a><code class="function-signature">balanceOfMarketOutcome(contract IMarket _market, uint256 _outcome, address _account) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.lowestBalanceOfMarketOutcomes(contract IMarket,uint256[],address)"></a><code class="function-signature">lowestBalanceOfMarketOutcomes(contract IMarket _market, uint256[] _outcomes, address _account) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.assertBalances(contract IMarket)"></a><code class="function-signature">assertBalances(contract IMarket _market)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.getTokenId(contract IMarket,uint256)"></a><code class="function-signature">getTokenId(contract IMarket _market, uint256 _outcome) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.getTokenIds(contract IMarket,uint256[])"></a><code class="function-signature">getTokenIds(contract IMarket _market, uint256[] _outcomes) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.unpackTokenId(uint256)"></a><code class="function-signature">unpackTokenId(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">address,uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.onTokenTransfer(uint256,address,address,uint256)"></a><code class="function-signature">onTokenTransfer(uint256 _tokenId, address _from, address _to, uint256 _value)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.onMint(uint256,address,uint256)"></a><code class="function-signature">onMint(uint256 _tokenId, address _target, uint256 _amount)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.onBurn(uint256,address,uint256)"></a><code class="function-signature">onBurn(uint256 _tokenId, address _target, uint256 _amount)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitShareToken.mint(address,contract IMarket,uint256,uint256)"></a><code class="function-signature">mint(address to, contract IMarket market, uint256 outcome, uint256 balance)</code><span class="function-visibility">external</span></h4>







### `ExitZeroXTrade`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#ExitZeroXTrade.initialize(contract IAugur,contract IAugurTrading,contract IExitFillOrder,address,address)"><code class="function-signature">initialize(contract IAugur _augur, contract IAugurTrading _augurTrading, contract IExitFillOrder _fillOrder, address _exitCash, address _exitShareToken)</code></a></li><li><a href="#ExitZeroXTrade.initializeForMatic(address,address,address,address)"><code class="function-signature">initializeForMatic(address _maticZeroXTrade, address _maticCash, address _maticShareToken, address _exchange)</code></a></li><li><a href="#ExitZeroXTrade.getExchange()"><code class="function-signature">getExchange()</code></a></li><li><a href="#ExitZeroXTrade.safeTransferFrom(address,address,uint256,uint256,bytes)"><code class="function-signature">safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes data)</code></a></li><li><a href="#ExitZeroXTrade.safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)"><code class="function-signature">safeBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data)</code></a></li><li><a href="#ExitZeroXTrade.balanceOf(address,uint256)"><code class="function-signature">balanceOf(address owner, uint256 id)</code></a></li><li><a href="#ExitZeroXTrade.totalSupply(uint256)"><code class="function-signature">totalSupply(uint256 id)</code></a></li><li><a href="#ExitZeroXTrade.bidBalance(address,contract IMarket,uint8,uint256)"><code class="function-signature">bidBalance(address _owner, contract IMarket _market, uint8 _outcome, uint256 _price)</code></a></li><li><a href="#ExitZeroXTrade.askBalance(address,contract IMarket,uint8,uint256)"><code class="function-signature">askBalance(address _owner, contract IMarket _market, uint8 _outcome, uint256 _price)</code></a></li><li><a href="#ExitZeroXTrade.cashAvailableForTransferFrom(address,address)"><code class="function-signature">cashAvailableForTransferFrom(address _owner, address _sender)</code></a></li><li><a href="#ExitZeroXTrade.balanceOfBatch(address[],uint256[])"><code class="function-signature">balanceOfBatch(address[] owners, uint256[] ids)</code></a></li><li><a href="#ExitZeroXTrade.setApprovalForAll(address,bool)"><code class="function-signature">setApprovalForAll(address operator, bool approved)</code></a></li><li><a href="#ExitZeroXTrade.isApprovedForAll(address,address)"><code class="function-signature">isApprovedForAll(address owner, address operator)</code></a></li><li><a href="#ExitZeroXTrade.trade(uint256,bytes32,bytes32,uint256,uint256,struct IExchange.Order[],bytes[],address)"><code class="function-signature">trade(uint256 _requestedFillAmount, bytes32 _fingerprint, bytes32 _tradeGroupId, uint256 _maxProtocolFeeDai, uint256 _maxTrades, struct IExchange.Order[] _orders, bytes[] _signatures, address _taker)</code></a></li><li><a href="#ExitZeroXTrade.fillOrderNoThrow(struct IExchange.Order,uint256,bytes,uint256)"><code class="function-signature">fillOrderNoThrow(struct IExchange.Order _order, uint256 _takerAssetFillAmount, bytes _signature, uint256 _protocolFee)</code></a></li><li><a href="#ExitZeroXTrade.coverProtocolFee(uint256,uint256)"><code class="function-signature">coverProtocolFee(uint256 _amountEthRequired, uint256 _maxProtocolFeeDai)</code></a></li><li><a href="#ExitZeroXTrade.estimateProtocolFeeCostInCash(uint256,uint256)"><code class="function-signature">estimateProtocolFeeCostInCash(uint256 _numOrders, uint256 _gasPrice)</code></a></li><li><a href="#ExitZeroXTrade.getAmountIn(uint256,uint256,uint256)"><code class="function-signature">getAmountIn(uint256 amountOut, uint256 reserveIn, uint256 reserveOut)</code></a></li><li><a href="#ExitZeroXTrade.validateOrder(struct IExchange.Order,uint256)"><code class="function-signature">validateOrder(struct IExchange.Order _order, uint256 _fillAmountRemaining)</code></a></li><li><a href="#ExitZeroXTrade.isOrderAmountValid(contract IMarket,uint256)"><code class="function-signature">isOrderAmountValid(contract IMarket _market, uint256 _orderAmount)</code></a></li><li><a href="#ExitZeroXTrade.cancelOrders(struct IExchange.Order[],bytes[],uint256)"><code class="function-signature">cancelOrders(struct IExchange.Order[] _orders, bytes[] _signatures, uint256 _maxProtocolFeeDai)</code></a></li><li><a href="#ExitZeroXTrade.creatorHasFundsForTrade(struct IExchange.Order,uint256)"><code class="function-signature">creatorHasFundsForTrade(struct IExchange.Order _order, uint256 _amount)</code></a></li><li><a href="#ExitZeroXTrade.getTransferFromAllowed()"><code class="function-signature">getTransferFromAllowed()</code></a></li><li><a href="#ExitZeroXTrade.encodeAssetData(address,uint256,uint8,uint8)"><code class="function-signature">encodeAssetData(address _market, uint256 _price, uint8 _outcome, uint8 _type)</code></a></li><li><a href="#ExitZeroXTrade.getTokenId(address,uint256,uint8,uint8)"><code class="function-signature">getTokenId(address _market, uint256 _price, uint8 _outcome, uint8 _type)</code></a></li><li><a href="#ExitZeroXTrade.unpackTokenId(uint256)"><code class="function-signature">unpackTokenId(uint256 _tokenId)</code></a></li><li><a href="#ExitZeroXTrade.decodeAssetData(bytes)"><code class="function-signature">decodeAssetData(bytes _assetData)</code></a></li><li><a href="#ExitZeroXTrade.decodeTradeAssetData(bytes)"><code class="function-signature">decodeTradeAssetData(bytes _assetData)</code></a></li><li><a href="#ExitZeroXTrade.parseOrderData(struct IExchange.Order)"><code class="function-signature">parseOrderData(struct IExchange.Order _order)</code></a></li><li><a href="#ExitZeroXTrade.getZeroXTradeTokenData(bytes)"><code class="function-signature">getZeroXTradeTokenData(bytes _assetData)</code></a></li><li><a href="#ExitZeroXTrade.getTokenIdFromOrder(struct IExchange.Order)"><code class="function-signature">getTokenIdFromOrder(struct IExchange.Order _order)</code></a></li><li><a href="#ExitZeroXTrade.createZeroXOrder(uint8,uint256,uint256,address,uint8,uint256,uint256)"><code class="function-signature">createZeroXOrder(uint8 _type, uint256 _attoshares, uint256 _price, address _market, uint8 _outcome, uint256 _expirationTimeSeconds, uint256 _salt)</code></a></li><li><a href="#ExitZeroXTrade.createZeroXOrderFor(address,uint8,uint256,uint256,address,uint8,uint256,uint256)"><code class="function-signature">createZeroXOrderFor(address _maker, uint8 _type, uint256 _attoshares, uint256 _price, address _market, uint8 _outcome, uint256 _expirationTimeSeconds, uint256 _salt)</code></a></li><li><a href="#ExitZeroXTrade.encodeEIP1271OrderWithHash(struct IExchange.Order,bytes32)"><code class="function-signature">encodeEIP1271OrderWithHash(struct IExchange.Order _zeroXOrder, bytes32 _orderHash)</code></a></li><li><a href="#ExitZeroXTrade.fallback()"><code class="function-signature">fallback()</code></a></li><li class="inherited"><a href="#Initializable.endInitialization()"><code class="function-signature">endInitialization()</code></a></li><li class="inherited"><a href="#Initializable.getInitialized()"><code class="function-signature">getInitialized()</code></a></li></ul><span class="contract-index-title">Events</span><ul><li class="inherited"><a href="#IERC1155.TransferSingle(address,address,address,uint256,uint256)"><code class="function-signature">TransferSingle(address operator, address from, address to, uint256 id, uint256 value)</code></a></li><li class="inherited"><a href="#IERC1155.TransferBatch(address,address,address,uint256[],uint256[])"><code class="function-signature">TransferBatch(address operator, address from, address to, uint256[] ids, uint256[] values)</code></a></li><li class="inherited"><a href="#IERC1155.ApprovalForAll(address,address,bool)"><code class="function-signature">ApprovalForAll(address owner, address operator, bool approved)</code></a></li><li class="inherited"><a href="#IERC1155.URI(string,uint256)"><code class="function-signature">URI(string value, uint256 id)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.initialize(contract IAugur,contract IAugurTrading,contract IExitFillOrder,address,address)"></a><code class="function-signature">initialize(contract IAugur _augur, contract IAugurTrading _augurTrading, contract IExitFillOrder _fillOrder, address _exitCash, address _exitShareToken)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.initializeForMatic(address,address,address,address)"></a><code class="function-signature">initializeForMatic(address _maticZeroXTrade, address _maticCash, address _maticShareToken, address _exchange)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.getExchange()"></a><code class="function-signature">getExchange() <span class="return-arrow">→</span> <span class="return-type">contract IExchange</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.safeTransferFrom(address,address,uint256,uint256,bytes)"></a><code class="function-signature">safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes data)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)"></a><code class="function-signature">safeBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.balanceOf(address,uint256)"></a><code class="function-signature">balanceOf(address owner, uint256 id) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.totalSupply(uint256)"></a><code class="function-signature">totalSupply(uint256 id) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.bidBalance(address,contract IMarket,uint8,uint256)"></a><code class="function-signature">bidBalance(address _owner, contract IMarket _market, uint8 _outcome, uint256 _price) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.askBalance(address,contract IMarket,uint8,uint256)"></a><code class="function-signature">askBalance(address _owner, contract IMarket _market, uint8 _outcome, uint256 _price) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.cashAvailableForTransferFrom(address,address)"></a><code class="function-signature">cashAvailableForTransferFrom(address _owner, address _sender) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.balanceOfBatch(address[],uint256[])"></a><code class="function-signature">balanceOfBatch(address[] owners, uint256[] ids) <span class="return-arrow">→</span> <span class="return-type">uint256[]</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.setApprovalForAll(address,bool)"></a><code class="function-signature">setApprovalForAll(address operator, bool approved)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.isApprovedForAll(address,address)"></a><code class="function-signature">isApprovedForAll(address owner, address operator) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.trade(uint256,bytes32,bytes32,uint256,uint256,struct IExchange.Order[],bytes[],address)"></a><code class="function-signature">trade(uint256 _requestedFillAmount, bytes32 _fingerprint, bytes32 _tradeGroupId, uint256 _maxProtocolFeeDai, uint256 _maxTrades, struct IExchange.Order[] _orders, bytes[] _signatures, address _taker) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.fillOrderNoThrow(struct IExchange.Order,uint256,bytes,uint256)"></a><code class="function-signature">fillOrderNoThrow(struct IExchange.Order _order, uint256 _takerAssetFillAmount, bytes _signature, uint256 _protocolFee) <span class="return-arrow">→</span> <span class="return-type">struct IExchange.FillResults</span></code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.coverProtocolFee(uint256,uint256)"></a><code class="function-signature">coverProtocolFee(uint256 _amountEthRequired, uint256 _maxProtocolFeeDai)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.estimateProtocolFeeCostInCash(uint256,uint256)"></a><code class="function-signature">estimateProtocolFeeCostInCash(uint256 _numOrders, uint256 _gasPrice) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.getAmountIn(uint256,uint256,uint256)"></a><code class="function-signature">getAmountIn(uint256 amountOut, uint256 reserveIn, uint256 reserveOut) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.validateOrder(struct IExchange.Order,uint256)"></a><code class="function-signature">validateOrder(struct IExchange.Order _order, uint256 _fillAmountRemaining)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.isOrderAmountValid(contract IMarket,uint256)"></a><code class="function-signature">isOrderAmountValid(contract IMarket _market, uint256 _orderAmount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.cancelOrders(struct IExchange.Order[],bytes[],uint256)"></a><code class="function-signature">cancelOrders(struct IExchange.Order[] _orders, bytes[] _signatures, uint256 _maxProtocolFeeDai) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.creatorHasFundsForTrade(struct IExchange.Order,uint256)"></a><code class="function-signature">creatorHasFundsForTrade(struct IExchange.Order _order, uint256 _amount) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.getTransferFromAllowed()"></a><code class="function-signature">getTransferFromAllowed() <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.encodeAssetData(address,uint256,uint8,uint8)"></a><code class="function-signature">encodeAssetData(address _market, uint256 _price, uint8 _outcome, uint8 _type) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">public</span></h4>

Encode MultiAsset proxy asset data into the format described in the AssetProxy contract specification.
 @param _market The address of the market to trade on
 @param _price The price used to trade
 @param _outcome The outcome to trade on
 @param _type Either BID == 0 or ASK == 1
 @return AssetProxy-compliant asset data describing the set of assets.



<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.getTokenId(address,uint256,uint8,uint8)"></a><code class="function-signature">getTokenId(address _market, uint256 _price, uint8 _outcome, uint8 _type) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.unpackTokenId(uint256)"></a><code class="function-signature">unpackTokenId(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">address,uint256,uint8,uint8</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.decodeAssetData(bytes)"></a><code class="function-signature">decodeAssetData(bytes _assetData) <span class="return-arrow">→</span> <span class="return-type">bytes4,address,uint256[],uint256[],bytes</span></code><span class="function-visibility">public</span></h4>

Decode MultiAsset asset data from the format described in the AssetProxy contract specification.
 @param _assetData AssetProxy-compliant asset data describing an ERC-1155 set of assets.
 @return The ERC-1155 AssetProxy identifier, the address of this ERC-1155
 contract hosting the assets, an array of the identifiers of the
 assets to be traded, an array of asset amounts to be traded, and
 callback data.  Each element of the arrays corresponds to the
 same-indexed element of the other array.  Return values specified as
 `memory` are returned as pointers to locations within the memory of
 the input parameter `assetData`.



<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.decodeTradeAssetData(bytes)"></a><code class="function-signature">decodeTradeAssetData(bytes _assetData) <span class="return-arrow">→</span> <span class="return-type">bytes4,address,uint256[],uint256[],bytes</span></code><span class="function-visibility">public</span></h4>

Decode ERC-1155 asset data from the format described in the AssetProxy contract specification.
 @param _assetData AssetProxy-compliant asset data describing an ERC-1155 set of assets.
 @return The ERC-1155 AssetProxy identifier, the address of this ERC-1155
 contract hosting the assets, an array of the identifiers of the
 assets to be traded, an array of asset amounts to be traded, and
 callback data.  Each element of the arrays corresponds to the
 same-indexed element of the other array.  Return values specified as
 `memory` are returned as pointers to locations within the memory of
 the input parameter `assetData`.



<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.parseOrderData(struct IExchange.Order)"></a><code class="function-signature">parseOrderData(struct IExchange.Order _order) <span class="return-arrow">→</span> <span class="return-type">struct IZeroXTrade.AugurOrderData</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.getZeroXTradeTokenData(bytes)"></a><code class="function-signature">getZeroXTradeTokenData(bytes _assetData) <span class="return-arrow">→</span> <span class="return-type">contract IERC1155,uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.getTokenIdFromOrder(struct IExchange.Order)"></a><code class="function-signature">getTokenIdFromOrder(struct IExchange.Order _order) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.createZeroXOrder(uint8,uint256,uint256,address,uint8,uint256,uint256)"></a><code class="function-signature">createZeroXOrder(uint8 _type, uint256 _attoshares, uint256 _price, address _market, uint8 _outcome, uint256 _expirationTimeSeconds, uint256 _salt) <span class="return-arrow">→</span> <span class="return-type">struct IExchange.Order,bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.createZeroXOrderFor(address,uint8,uint256,uint256,address,uint8,uint256,uint256)"></a><code class="function-signature">createZeroXOrderFor(address _maker, uint8 _type, uint256 _attoshares, uint256 _price, address _market, uint8 _outcome, uint256 _expirationTimeSeconds, uint256 _salt) <span class="return-arrow">→</span> <span class="return-type">struct IExchange.Order,bytes32</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.encodeEIP1271OrderWithHash(struct IExchange.Order,bytes32)"></a><code class="function-signature">encodeEIP1271OrderWithHash(struct IExchange.Order _zeroXOrder, bytes32 _orderHash) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="ExitZeroXTrade.fallback()"></a><code class="function-signature">fallback()</code><span class="function-visibility">external</span></h4>







### `IAugurCreationDataGetter`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IAugurCreationDataGetter.getMarketCreationData(contract IMarket)"><code class="function-signature">getMarketCreationData(contract IMarket _market)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IAugurCreationDataGetter.getMarketCreationData(contract IMarket)"></a><code class="function-signature">getMarketCreationData(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">struct IAugurCreationDataGetter.MarketCreationData</span></code><span class="function-visibility">public</span></h4>







### `IAugurMarketDataGetter`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IAugurMarketDataGetter.getMarketType(contract IMarket)"><code class="function-signature">getMarketType(contract IMarket _market)</code></a></li><li><a href="#IAugurMarketDataGetter.getMarketOutcomes(contract IMarket)"><code class="function-signature">getMarketOutcomes(contract IMarket _market)</code></a></li><li><a href="#IAugurMarketDataGetter.getMarketRecommendedTradeInterval(contract IMarket)"><code class="function-signature">getMarketRecommendedTradeInterval(contract IMarket _market)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IAugurMarketDataGetter.getMarketType(contract IMarket)"></a><code class="function-signature">getMarketType(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">enum IMarket.MarketType</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugurMarketDataGetter.getMarketOutcomes(contract IMarket)"></a><code class="function-signature">getMarketOutcomes(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">bytes32[]</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IAugurMarketDataGetter.getMarketRecommendedTradeInterval(contract IMarket)"></a><code class="function-signature">getMarketRecommendedTradeInterval(contract IMarket _market) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">public</span></h4>







### `IUniswapV2Factory`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IUniswapV2Factory.feeTo()"><code class="function-signature">feeTo()</code></a></li><li><a href="#IUniswapV2Factory.feeToSetter()"><code class="function-signature">feeToSetter()</code></a></li><li><a href="#IUniswapV2Factory.getPair(address,address)"><code class="function-signature">getPair(address tokenA, address tokenB)</code></a></li><li><a href="#IUniswapV2Factory.allPairs(uint256)"><code class="function-signature">allPairs(uint256)</code></a></li><li><a href="#IUniswapV2Factory.allPairsLength()"><code class="function-signature">allPairsLength()</code></a></li><li><a href="#IUniswapV2Factory.createPair(address,address)"><code class="function-signature">createPair(address tokenA, address tokenB)</code></a></li><li><a href="#IUniswapV2Factory.setFeeTo(address)"><code class="function-signature">setFeeTo(address)</code></a></li><li><a href="#IUniswapV2Factory.setFeeToSetter(address)"><code class="function-signature">setFeeToSetter(address)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li><a href="#IUniswapV2Factory.PairCreated(address,address,address,uint256)"><code class="function-signature">PairCreated(address token0, address token1, address pair, uint256)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Factory.feeTo()"></a><code class="function-signature">feeTo() <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Factory.feeToSetter()"></a><code class="function-signature">feeToSetter() <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Factory.getPair(address,address)"></a><code class="function-signature">getPair(address tokenA, address tokenB) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Factory.allPairs(uint256)"></a><code class="function-signature">allPairs(uint256) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Factory.allPairsLength()"></a><code class="function-signature">allPairsLength() <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Factory.createPair(address,address)"></a><code class="function-signature">createPair(address tokenA, address tokenB) <span class="return-arrow">→</span> <span class="return-type">address</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Factory.setFeeTo(address)"></a><code class="function-signature">setFeeTo(address)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Factory.setFeeToSetter(address)"></a><code class="function-signature">setFeeToSetter(address)</code><span class="function-visibility">external</span></h4>







<h4><a class="anchor" aria-hidden="true" id="IUniswapV2Factory.PairCreated(address,address,address,uint256)"></a><code class="function-signature">PairCreated(address token0, address token1, address pair, uint256)</code><span class="function-visibility"></span></h4>





### `IWETH`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IWETH.deposit()"><code class="function-signature">deposit()</code></a></li><li><a href="#IWETH.balanceOf(address)"><code class="function-signature">balanceOf(address owner)</code></a></li><li><a href="#IWETH.transfer(address,uint256)"><code class="function-signature">transfer(address to, uint256 value)</code></a></li><li><a href="#IWETH.withdraw(uint256)"><code class="function-signature">withdraw(uint256)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IWETH.deposit()"></a><code class="function-signature">deposit()</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IWETH.balanceOf(address)"></a><code class="function-signature">balanceOf(address owner) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IWETH.transfer(address,uint256)"></a><code class="function-signature">transfer(address to, uint256 value) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IWETH.withdraw(uint256)"></a><code class="function-signature">withdraw(uint256)</code><span class="function-visibility">external</span></h4>







### `IZeroXTrade`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#IZeroXTrade.parseOrderData(struct IExchange.Order)"><code class="function-signature">parseOrderData(struct IExchange.Order _order)</code></a></li><li><a href="#IZeroXTrade.unpackTokenId(uint256)"><code class="function-signature">unpackTokenId(uint256 _tokenId)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="IZeroXTrade.parseOrderData(struct IExchange.Order)"></a><code class="function-signature">parseOrderData(struct IExchange.Order _order) <span class="return-arrow">→</span> <span class="return-type">struct IZeroXTrade.AugurOrderData</span></code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="IZeroXTrade.unpackTokenId(uint256)"></a><code class="function-signature">unpackTokenId(uint256 _tokenId) <span class="return-arrow">→</span> <span class="return-type">address,uint256,uint8,uint8</span></code><span class="function-visibility">public</span></h4>







### `LibBytes`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#LibBytes.equals(bytes,bytes)"><code class="function-signature">equals(bytes lhs, bytes rhs)</code></a></li><li><a href="#LibBytes.contentAddress(bytes)"><code class="function-signature">contentAddress(bytes input)</code></a></li><li><a href="#LibBytes.memCopy(uint256,uint256,uint256)"><code class="function-signature">memCopy(uint256 dest, uint256 source, uint256 length)</code></a></li><li><a href="#LibBytes.slice(bytes,uint256,uint256)"><code class="function-signature">slice(bytes b, uint256 from, uint256 to)</code></a></li><li><a href="#LibBytes.sliceDestructive(bytes,uint256,uint256)"><code class="function-signature">sliceDestructive(bytes b, uint256 from, uint256 to)</code></a></li><li><a href="#LibBytes.popLastByte(bytes)"><code class="function-signature">popLastByte(bytes b)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="LibBytes.equals(bytes,bytes)"></a><code class="function-signature">equals(bytes lhs, bytes rhs) <span class="return-arrow">→</span> <span class="return-type">bool</span></code><span class="function-visibility">internal</span></h4>

Tests equality of two byte arrays.
 @param lhs First byte array to compare.
 @param rhs Second byte array to compare.
 @return True if arrays are the same. False otherwise.



<h4><a class="anchor" aria-hidden="true" id="LibBytes.contentAddress(bytes)"></a><code class="function-signature">contentAddress(bytes input) <span class="return-arrow">→</span> <span class="return-type">uint256</span></code><span class="function-visibility">internal</span></h4>

Gets the memory address for the contents of a byte array.
 @param input Byte array to lookup.
 @return memoryAddress Memory address of the contents of the byte array.



<h4><a class="anchor" aria-hidden="true" id="LibBytes.memCopy(uint256,uint256,uint256)"></a><code class="function-signature">memCopy(uint256 dest, uint256 source, uint256 length)</code><span class="function-visibility">internal</span></h4>

Copies `length` bytes from memory location `source` to `dest`.
 @param dest memory address to copy bytes to.
 @param source memory address to copy bytes from.
 @param length number of bytes to copy.



<h4><a class="anchor" aria-hidden="true" id="LibBytes.slice(bytes,uint256,uint256)"></a><code class="function-signature">slice(bytes b, uint256 from, uint256 to) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>

Returns a slices from a byte array.
 @param b The byte array to take a slice from.
 @param from The starting index for the slice (inclusive).
 @param to The final index for the slice (exclusive).
 @return result The slice containing bytes at indices [from, to)



<h4><a class="anchor" aria-hidden="true" id="LibBytes.sliceDestructive(bytes,uint256,uint256)"></a><code class="function-signature">sliceDestructive(bytes b, uint256 from, uint256 to) <span class="return-arrow">→</span> <span class="return-type">bytes</span></code><span class="function-visibility">internal</span></h4>

Returns a slice from a byte array without preserving the input.
 @param b The byte array to take a slice from. Will be destroyed in the process.
 @param from The starting index for the slice (inclusive).
 @param to The final index for the slice (exclusive).
 @return result The slice containing bytes at indices [from, to)
 @dev When `from == 0`, the original array will match the slice. In other cases its state will be corrupted.



<h4><a class="anchor" aria-hidden="true" id="LibBytes.popLastByte(bytes)"></a><code class="function-signature">popLastByte(bytes b) <span class="return-arrow">→</span> <span class="return-type">bytes1</span></code><span class="function-visibility">internal</span></h4>

Pops the last byte off of a byte array by modifying its length.
 @param b Byte array that will be modified.
 @return The byte that was popped off.





### `FeePotPredicate`



<div class="contract-index"><span class="contract-index-title">Functions</span><ul><li><a href="#FeePotPredicate.initialize(contract IWithdrawManager,contract IErc20Predicate,address,contract IAugurPredicate)"><code class="function-signature">initialize(contract IWithdrawManager _withdrawManager, contract IErc20Predicate _erc20Predicate, address _childFeePot, contract IAugurPredicate _augurPredicate)</code></a></li><li><a href="#FeePotPredicate.onTransferOwnership(address,address)"><code class="function-signature">onTransferOwnership(address, address)</code></a></li><li><a href="#FeePotPredicate.setExitorFee(uint256)"><code class="function-signature">setExitorFee(uint256 _fee)</code></a></li><li><a href="#FeePotPredicate.startExitWithBurntFees(bytes)"><code class="function-signature">startExitWithBurntFees(bytes data)</code></a></li><li><a href="#FeePotPredicate.onFinalizeExit(bytes)"><code class="function-signature">onFinalizeExit(bytes data)</code></a></li><li class="inherited"><a href="#Initializable.endInitialization()"><code class="function-signature">endInitialization()</code></a></li><li class="inherited"><a href="#Initializable.getInitialized()"><code class="function-signature">getInitialized()</code></a></li><li class="inherited"><a href="#Ownable.constructor()"><code class="function-signature">constructor()</code></a></li><li class="inherited"><a href="#Ownable.getOwner()"><code class="function-signature">getOwner()</code></a></li><li class="inherited"><a href="#Ownable.transferOwnership(address)"><code class="function-signature">transferOwnership(address _newOwner)</code></a></li></ul><span class="contract-index-title">Events</span><ul><li><a href="#FeePotPredicate.ExitFinalized(uint256,address,uint256,uint256)"><code class="function-signature">ExitFinalized(uint256 exitId, address exitor, uint256 feesDeposited, uint256 exitorReward)</code></a></li></ul></div>



<h4><a class="anchor" aria-hidden="true" id="FeePotPredicate.initialize(contract IWithdrawManager,contract IErc20Predicate,address,contract IAugurPredicate)"></a><code class="function-signature">initialize(contract IWithdrawManager _withdrawManager, contract IErc20Predicate _erc20Predicate, address _childFeePot, contract IAugurPredicate _augurPredicate)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="FeePotPredicate.onTransferOwnership(address,address)"></a><code class="function-signature">onTransferOwnership(address, address)</code><span class="function-visibility">internal</span></h4>





<h4><a class="anchor" aria-hidden="true" id="FeePotPredicate.setExitorFee(uint256)"></a><code class="function-signature">setExitorFee(uint256 _fee)</code><span class="function-visibility">public</span></h4>





<h4><a class="anchor" aria-hidden="true" id="FeePotPredicate.startExitWithBurntFees(bytes)"></a><code class="function-signature">startExitWithBurntFees(bytes data)</code><span class="function-visibility">external</span></h4>





<h4><a class="anchor" aria-hidden="true" id="FeePotPredicate.onFinalizeExit(bytes)"></a><code class="function-signature">onFinalizeExit(bytes data)</code><span class="function-visibility">external</span></h4>







<h4><a class="anchor" aria-hidden="true" id="FeePotPredicate.ExitFinalized(uint256,address,uint256,uint256)"></a><code class="function-signature">ExitFinalized(uint256 exitId, address exitor, uint256 feesDeposited, uint256 exitorReward)</code><span class="function-visibility"></span></h4>





</div>