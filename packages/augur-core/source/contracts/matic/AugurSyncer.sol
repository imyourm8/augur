pragma solidity 0.5.10;

import 'ROOT/reporting/IMarket.sol';
import 'ROOT/reporting/IUniverse.sol';
import 'ROOT/reporting/Universe.sol';
import "ROOT/libraries/Ownable.sol";
import 'ROOT/matic/plasma/IStateSender.sol';
import 'ROOT/matic/plasma/IRegistry.sol';
import 'ROOT/matic/libraries/BytesLib.sol';

contract AugurSyncer is Ownable {
    uint256 private constant SYNC_MARKET_INFO_CMD = 1;
    uint256 private constant SYNC_REPORTING_FEE_CMD = 2;
    uint256 private constant SYNC_MARKET_MIGRATION_CMD = 3;

    // copy from Universe.sol
    uint256 constant public DEFAULT_NUM_OUTCOMES = 2;
    uint256 constant public DEFAULT_NUM_TICKS = 100;

    IStateSender public stateSender;
    IRegistry public registry;
    address public marketRegistry;

    constructor(IRegistry _registry, address _marketRegistry) public {
        registry = _registry;
        marketRegistry = _marketRegistry;
        updateChildChainAndStateSender();
    }

    function updateChildChainAndStateSender() public {
        (, address _stateSender) = registry.getChildChainAndStateSender();
        stateSender = IStateSender(_stateSender);
    }

    function createYesNoMarket(
        Universe _universe,
        uint256 _endTime,
        uint256 _feePerCashInAttoCash,
        uint256 _affiliateFeeDivisor,
        address _designatedReporterAddress,
        string memory _extraInfo
    ) public returns (IMarket) {
        IMarket market = _universe.createYesNoMarket(
            _endTime,
            _feePerCashInAttoCash,
            _affiliateFeeDivisor,
            _designatedReporterAddress,
            _extraInfo
        );

        _syncWithCommand(
            SYNC_MARKET_INFO_CMD,
            _encodeMarketArguments(
                _universe,
                _endTime,
                1, // TODO
                DEFAULT_NUM_TICKS,
                DEFAULT_NUM_OUTCOMES
            )
        );

        return market;
    }

    function createCategoricalMarket(
        Universe _universe,
        uint256 _endTime,
        uint256 _feePerCashInAttoCash,
        uint256 _affiliateFeeDivisor,
        address _designatedReporterAddress,
        bytes32[] memory _outcomes,
        string memory _extraInfo
    ) public returns (IMarket) {
        IMarket market = _universe.createCategoricalMarket(
            _endTime,
            _feePerCashInAttoCash,
            _affiliateFeeDivisor,
            _designatedReporterAddress,
            _outcomes,
            _extraInfo
        );

        _syncWithCommand(
            SYNC_MARKET_INFO_CMD,
            _encodeMarketArguments(
                _universe,
                _endTime,
                1, // TODO
                DEFAULT_NUM_TICKS,
                uint256(_outcomes.length)
            )
        );

        return market;
    }

    function createScalarMarket(
        Universe _universe,
        uint256 _endTime,
        uint256 _feePerCashInAttoCash,
        uint256 _affiliateFeeDivisor,
        address _designatedReporterAddress,
        int256[] memory _prices,
        uint256 _numTicks,
        string memory _extraInfo
    ) public returns (IMarket) {
        IMarket market = _universe.createScalarMarket(
            _endTime,
            _feePerCashInAttoCash,
            _affiliateFeeDivisor,
            _designatedReporterAddress,
            _prices,
            _numTicks,
            _extraInfo
        );

        _syncWithCommand(
            SYNC_MARKET_INFO_CMD,
            _encodeMarketArguments(
                _universe,
                _endTime,
                1, // TODO
                _numTicks,
                DEFAULT_NUM_OUTCOMES
            )
        );

        return market;
    }

    function migrateMarketIn(
        IUniverse _universe,
        IMarket _market,
        uint256 _cashBalance,
        uint256 _marketOI
    ) public onlyOwner {
        _universe.migrateMarketIn(_market, _cashBalance, _marketOI);
        _syncWithCommand(
            SYNC_MARKET_MIGRATION_CMD,
            abi.encode(_universe, _market)
        );
    }

    function syncReportingFee(IUniverse _universe) public onlyOwner {
        uint256 newFee = _universe.getOrCacheReportingFeeDivisor();
        _syncWithCommand(
            SYNC_REPORTING_FEE_CMD,
            abi.encode(_universe, newFee)
        );
    }

    function _syncWithCommand(uint256 cmd, bytes memory data) private {
        stateSender.syncState(marketRegistry, abi.encode(cmd, data));
    }

    function _encodeMarketArguments(
        IUniverse universe,
        uint256 endTime,
        uint256 creatorFee,
        uint256 numTicks,
        uint256 numberOfOutcomes
    ) private pure returns (bytes memory) {
        return abi.encode(universe, endTime, creatorFee, numTicks, numberOfOutcomes);
    }
}
