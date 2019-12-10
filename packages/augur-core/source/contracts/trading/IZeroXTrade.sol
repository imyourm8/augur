
pragma solidity 0.5.10;
pragma experimental ABIEncoderV2;

import "ROOT/external/IExchange.sol";


contract IZeroXTrade {

    struct AugurOrderData {
        address marketAddress;                  // Market Address
        uint256 price;                          // Price
        uint8 outcome;                          // Outcome
        uint8 orderType;                        // Order Type
        address kycToken;                       // KYC Token
    }

    function parseOrderData(IExchange.Order memory _order) public view returns (AugurOrderData memory _data);
    function unpackTokenId(uint256 _tokenId) public pure returns (address _market, uint256 _price, uint8 _outcome, uint8 _type);
    function trade(
        uint256 _requestedFillAmount,
        address _affiliateAddress,
        bytes32 _tradeGroupId,
        IExchange.Order[] memory _orders,
        bytes[] memory _signatures,
        address _taker,
        bytes memory _extraData
    ) public payable returns (uint256);
}