pragma solidity 0.5.10;
import "ROOT/libraries/Ownable.sol";

contract PredicateRegistry is Ownable {
    struct Market {
        address rootMarket;
        uint256 numOutcomes;
        uint256 numTicks;
    }

    enum ContractType {
        Unknown,
        ZeroXTrade,
        ShareToken,
        Cash
    }

    mapping(address => Market) public childToRootMarket;
    mapping(address => address) public zeroXExchange;

    // matic contracts
    address public zeroXTrade;
    address public oiCash;
    address public defaultExchange;
    address public cash;
    address public shareToken;

    // predicate contracts
    address public rootZeroXTrade;


    function mapMarket(address childMarket, address rootMarket, uint256 numOutcomes, uint256 numTicks) public onlyOwner {
        childToRootMarket[childMarket] = Market(rootMarket, numOutcomes, numTicks);
    }

    function setZeroXTrade(address _zeroXTrade) public onlyOwner{
        zeroXTrade = _zeroXTrade;
    }

    function setRootZeroXTrade(address _zeroXTrade) public onlyOwner {
        rootZeroXTrade = _zeroXTrade;
    }

    function setZeroXExchange(address childExchange, address rootExchange, bool isDefaultExchange) public onlyOwner {
        zeroXExchange[childExchange] = rootExchange;
        if (isDefaultExchange) {
            defaultExchange = childExchange;
        }
    }

    function setOICash(address _oiCash) public onlyOwner  {
        oiCash = _oiCash;
    }

    function setCash(address _cash) public onlyOwner  {
        cash = _cash;
    }

    function setShareToken(address _shareToken) public onlyOwner {
        shareToken = _shareToken;
    }

    function belongsToStateDeprecationContractSet(address _address) public view returns(bool) {
        return _address == zeroXTrade || _address == defaultExchange;
    }

    function getContractType(address addr) public view returns(ContractType) {
        if (addr == cash) {
            return ContractType.Cash;
        } else if (addr == shareToken) {
            return ContractType.ShareToken;
        } else if (addr == zeroXTrade) {
            return ContractType.ZeroXTrade;
        }

        return ContractType.Unknown;
    }

    function onTransferOwnership(address, address) internal {}
}
