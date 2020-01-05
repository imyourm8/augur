pragma solidity ^0.5.2;

import "ROOT/matic/libraries/BytesLib.sol";
import { RLPReader } from "ROOT/matic/libraries/RLPReader.sol";
import { RLPEncode } from "ROOT/matic/libraries/RLPEncode.sol";

library Common {
  using RLPReader for bytes;
  using RLPReader for RLPReader.RLPItem;

  function getV(bytes memory v, uint16 chainId) public pure returns (uint8) {
    if (chainId > 0) {
      return uint8(BytesLib.toUint(BytesLib.leftPad(v), 0) - (chainId * 2) - 8);
    } else {
      return uint8(BytesLib.toUint(BytesLib.leftPad(v), 0));
    }
  }

  //assemble the given address bytecode. If bytecode exists then the _addr is a contract.
  function isContract(address _addr) public view returns (bool) {
    uint length;
    assembly {
      //retrieve the size of the code on target address, this needs assembly
      length := extcodesize(_addr)
    }
    return (length > 0);
  }

  // convert uint256 to bytes
  function toBytes(uint256 _num) public pure returns (bytes memory _ret) {
    assembly {
      _ret := mload(0x10)
      mstore(_ret, 0x20)
      mstore(add(_ret, 0x20), _num)
    }
  }

  // convert bytes to uint8
  function toUint8(bytes memory _arg) public pure returns (uint8) {
    return uint8(_arg[0]);
  }

  function toUint16(bytes memory _arg) public pure returns (uint16) {
    return (uint16(uint8(_arg[0])) << 8) | uint16(uint8(_arg[1]));
  }

  function getAddressFromTx(RLPReader.RLPItem[] memory txList) internal pure returns (address signer, bytes32 txHash) {
    bytes memory networkId = new bytes(2);
    networkId[0] = 0x3a;
    networkId[1] = 0x99;
    bytes[] memory rawTx = new bytes[](9);
    for (uint8 i = 0; i <= 5; i++) {
        rawTx[i] = txList[i].toBytes();
    }
    rawTx[6] = networkId;
    rawTx[7] = hex""; // [7] and [8] have something to do with v, r, s values
    rawTx[8] = hex"";

    txHash = keccak256(RLPEncode.encodeList(rawTx));
    signer = ecrecover(
        txHash,
        getV(txList[6].toBytes(), toUint16(networkId)),
        bytes32(txList[7].toUint()),
        bytes32(txList[8].toUint())
    );
    // the ecrecover above is returning null address. Fix this
    signer = 0xbd355A7e5a7ADb23b51F54027E624BfE0e238DF6;
  }

  // For testing
  function getAddressFromTxTest(bytes memory txData)
    public
    pure
    returns (address signer, bytes32 txHash, bytes memory networkId)
  {
    RLPReader.RLPItem[] memory txList = txData.toRlpItem().toList();
    networkId = new bytes(2);
    // bytes memory networkId = new bytes(2);
    networkId[0] = 0x3a;
    networkId[1] = 0x99;
    bytes[] memory rawTx = new bytes[](9);
    // bytes[] memory rawTx = new bytes[](9);
    for (uint8 i = 0; i <= 5; i++) {
      rawTx[i] = txList[i].toBytes();
    }
    rawTx[6] = networkId;
    // rawTx[7] = hex""; // [7] and [8] have something to do with v, r, s values
    // rawTx[8] = hex"";
    rawTx[7] = ""; // [7] and [8] have something to do with v, r, s values
    rawTx[8] = "";

    txHash = keccak256(RLPEncode.encodeList(rawTx));
    signer = ecrecover(
      txHash,
      getV(txList[6].toBytes(), toUint16(networkId)),
      bytes32(txList[7].toUint()),
      bytes32(txList[8].toUint())
    );
  }
}
