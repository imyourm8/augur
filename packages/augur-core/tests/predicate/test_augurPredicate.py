#!/usr/bin/env python

from eth_tester.exceptions import TransactionFailed
from utils import longTo32Bytes, longToHexString, fix, AssertLog, stringToBytes, EtherDelta, PrintGasUsed, BuyWithCash, TokenDelta, nullAddress
from constants import ASK, BID, YES, NO, LONG, SHORT
from pytest import raises, mark
from reporting_utils import proceedToNextRound
from decimal import Decimal
from old_eth_utils import ecsign, sha3, normalize_key, int_to_32bytearray, bytearray_to_bytestr, zpad
from math import floor

def signOrder(orderHash, private_key):
    key = normalize_key(private_key.to_hex())
    v, r, s = ecsign(sha3("\x19Ethereum Signed Message:\n32".encode('utf-8') + orderHash), key)
    return "0x" + v.to_bytes(1, "big").hex() + (zpad(bytearray_to_bytestr(int_to_32bytearray(r)), 32) + zpad(bytearray_to_bytestr(int_to_32bytearray(s)), 32)).hex() + "03"

def test_basic_trading(contractsFixture, cash, market, universe):
    AugurPredicate = contractsFixture.contracts['AugurPredicate']
    ZeroXTrade = contractsFixture.contracts['ZeroXTrade']
    expirationTime = contractsFixture.contracts['Time'].getTimestamp() + 10000
    zeroXExchange = contractsFixture.contracts["ZeroXExchange"]
    shareToken = contractsFixture.contracts["ShareToken"]
    salt = 5

    # First we'll create a signed order
    rawZeroXOrderData, orderHash = ZeroXTrade.createZeroXOrder(BID, fix(2), 60, market.address, YES, nullAddress, expirationTime, zeroXExchange.address, salt)
    signature = signOrder(orderHash, contractsFixture.privateKeys[0])

    assert zeroXExchange.isValidSignature(orderHash, contractsFixture.accounts[0], signature)

    # Validate the signed order state
    marketAddress, price, outcome, orderType, kycToken = ZeroXTrade.parseOrderData(rawZeroXOrderData)
    assert marketAddress == market.address
    assert price == 60
    assert outcome == YES
    assert orderType == BID
    assert kycToken == nullAddress

    fillAmount = fix(1)
    affiliateAddress = nullAddress
    tradeGroupId = longTo32Bytes(42)
    orders = [rawZeroXOrderData]
    signatures = [signature]

    # Lets take the order as another user and confirm assets are traded
    assert cash.faucet(fix(1, 60))
    assert cash.faucet(fix(1, 40), sender=contractsFixture.accounts[1])

    exitId = AugurPredicate.initializeForExit(market.address, sender=contractsFixture.accounts[1])
    _shareToken, _cash = AugurPredicate.lookupExit(exitId)
    print("shareToken", _shareToken, _cash)
    # assert cash.faucet(fix(1, 60))
    # assert cash.faucet(fix(1, 40), sender=contractsFixture.accounts[1])

    with TokenDelta(cash, -fix(1, 60), contractsFixture.accounts[0], "Tester 0 cash not taken"):
        with TokenDelta(cash, -fix(1, 40), contractsFixture.accounts[1], "Tester 1 cash not taken"):
            with PrintGasUsed(contractsFixture, "AugurPredicate.trade", 0):
                AugurPredicate.trade(fillAmount, affiliateAddress, tradeGroupId, orders, signatures, contractsFixture.accounts[1], sender=contractsFixture.accounts[1], value=150000)

    # yesShareTokenBalance = shareToken.balanceOfMarketOutcome(market.address, YES, contractsFixture.accounts[0])
    # noShareTokenBalance = shareToken.balanceOfMarketOutcome(market.address, NO, contractsFixture.accounts[1])
    # assert yesShareTokenBalance == fix(1)
    # assert noShareTokenBalance == fix(1)

    # # Another user can fill the rest. We'll also ask to fill more than is available and see that we get back the remaining amount desired
    # assert cash.faucet(fix(1, 60))
    # assert cash.faucet(fix(1, 40), sender=contractsFixture.accounts[2])
    # amountRemaining = ZeroXTrade.trade(fillAmount + 1, affiliateAddress, tradeGroupId, orders, signatures, sender=contractsFixture.accounts[2], value=150000)
    # assert amountRemaining == 1

    # # The order is completely filled so further attempts to take it will not actuall result in any trade occuring
    # assert cash.faucet(fix(1, 60))
    # assert cash.faucet(fix(1, 40), sender=contractsFixture.accounts[1])
    # with TokenDelta(cash, 0, contractsFixture.accounts[0], "Tester 0 cash not taken"):
    #     with TokenDelta(cash, 0, contractsFixture.accounts[1], "Tester 1 cash not taken"):
    #         ZeroXTrade.trade(fillAmount, affiliateAddress, tradeGroupId, orders, signatures, sender=contractsFixture.accounts[1], value=150000)

    # assert yesShareTokenBalance == fix(1)
    # assert noShareTokenBalance == fix(1)
