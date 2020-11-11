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

import "ROOT/0x/utils/contracts/src/Ownable.sol";
import "ROOT/0x/utils/contracts/src/LibBytes.sol";
import "ROOT/0x/utils/contracts/src/LibRichErrors.sol";
import "ROOT/0x/exchange-libs/contracts/src/LibExchangeRichErrors.sol";
import "ROOT/0x/exchange/contracts/src/interfaces/IAssetProxy.sol";
import "ROOT/0x/exchange/contracts/src/interfaces/IAssetProxyDispatcher.sol";


contract ExitMixinAssetProxyDispatcher is
    Ownable,
    IAssetProxyDispatcher
{
    using LibBytes for bytes;

    address internal _exitAssetProxy;

    // Mapping from Asset Proxy Id's to their respective Asset Proxy
    // mapping (bytes4 => address) internal _assetProxies;

    /// @dev Registers an asset proxy to its asset proxy id.
    ///      Once an asset proxy is registered, it cannot be unregistered.
    /// @param assetProxy Address of new asset proxy to register.
    function registerAssetProxy(address assetProxy)
        external
    {
        // Ensure that no asset proxy exists with current id.
        revert();
    }

    /// @dev Gets an asset proxy.
    /// @param assetProxyId Id of the asset proxy.
    /// @return assetProxy The asset proxy address registered to assetProxyId. Returns 0x0 if no proxy is registered.
    function getAssetProxy(bytes4 assetProxyId)
        external
        view
        returns (address assetProxy)
    {
        revert();
    }

    /// @dev Forwards arguments to assetProxy and calls `transferFrom`. Either succeeds or throws.
    /// @param orderHash Hash of the order associated with this transfer.
    /// @param assetData Byte array encoded for the asset.
    /// @param from Address to transfer token from.
    /// @param to Address to transfer token to.
    /// @param amount Amount of token to transfer.
    function _dispatchTransferFrom(
        bytes32 orderHash,
        bytes memory assetData,
        address from,
        address to,
        uint256 amount
    )
        internal
    {
        // Do nothing if no amount should be transferred.
        if (amount > 0) {

            // Ensure assetData is padded to 32 bytes (excluding the id) and is at least 4 bytes long
            if (assetData.length % 32 != 4) {
                revert("BAD ASSET DATA PADDING");
            }

            // Construct the calldata for the transferFrom call.
            bytes memory proxyCalldata = abi.encodeWithSelector(
                IAssetProxy(address(0)).transferFrom.selector,
                assetData,
                from,
                to,
                amount
            );

            // Call the asset proxy's transferFrom function with the constructed calldata.
            (bool didSucceed, bytes memory returnData) = _exitAssetProxy.call(proxyCalldata);

            // If the transaction did not succeed, revert with the returned data.
            if (!didSucceed) {
                LibRichErrors.rrevert(LibExchangeRichErrors.AssetProxyTransferError(
                    orderHash,
                    assetData,
                    returnData
                ));
            }
        }
    }
}
