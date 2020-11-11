/*

  Copyright 2019 ZeroEx Intl.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

*/ 

pragma solidity 0.5.15;
pragma experimental ABIEncoderV2;

// import "ROOT/0x/exchange/contracts/src/MixinTransferSimulator.sol";

import "ROOT/matic/0x/ExitMixinAssetProxyDispatcher.sol";
import "ROOT/matic/0x/ExitMixinMatchOrders.sol";
import "ROOT/matic/0x/ExitMixinWrapperFunctions.sol";
import "ROOT/matic/0x/ExitLibEIP712ExchangeDomain.sol";


// solhint-disable no-empty-blocks
/// @dev The 0x Exchange contract.
contract ExitExchange is
    ExitLibEIP712ExchangeDomain,
    ExitMixinMatchOrders,
    ExitMixinWrapperFunctions
{
    /// @dev Mixins are instantiated in the order they are inherited
    /// @param chainId Chain ID of the network this contract is deployed on.
    /// @param verifyingContractAddressIfExists Matic Exchange address.
    /// @param exitErc1155Proxy ExitZeroXTrade address
    constructor (uint256 chainId, address verifyingContractAddressIfExists, address exitErc1155Proxy)
        public
        ExitLibEIP712ExchangeDomain(chainId, verifyingContractAddressIfExists)
    {
      _exitAssetProxy = exitErc1155Proxy;
    }
    
    // For testing purposes
    function isValidSignature(LibOrder.Order memory order, bytes32 orderHash, bytes memory signature) public view returns (bool) {
        return _isValidOrderWithHashSignature(order, orderHash, signature);
    }
}
