pragma solidity ^0.5.2;

import './BytesLib.sol';

library Common {
    function getV(bytes memory v, uint16 chainId)
        internal
        pure
        returns (uint8)
    {
        // BytesLib.toUint() reverts for some reason, copy paste of that code works here just fine.
        // uint256 tempUint;
        // bytes memory _bytes = new bytes(32);
        // uint256 _diff = 32 - v.length;
        // for (uint256 i = 0; i < v.length; i++) {
        //     _bytes[i + _diff] = v[i];
        // }

        // assembly {
        //     tempUint := mload(add(_bytes, 0x20))
        // }

        // if (chainId > 0) {
        //     return uint8(tempUint - (chainId * 2) - 8);
        // }

        // return uint8(tempUint);
        if (chainId > 0) {
            return
                uint8(
                    BytesLib.toUint(BytesLib.leftPad(v), 0) - (chainId * 2) - 8
                );
        } else {
            return uint8(BytesLib.toUint(BytesLib.leftPad(v), 0));
        }
    }

    //assemble the given address bytecode. If bytecode exists then the _addr is a contract.
    function isContract(address _addr) internal view returns (bool) {
        uint256 length;
        assembly {
            //retrieve the size of the code on target address, this needs assembly
            length := extcodesize(_addr)
        }
        return (length > 0);
    }

    // convert bytes to uint8
    function toUint8(bytes memory _arg) internal pure returns (uint8) {
        return uint8(_arg[0]);
    }

    function toUint16(bytes memory _arg) internal pure returns (uint16) {
        return (uint16(uint8(_arg[0])) << 8) | uint16(uint8(_arg[1]));
    }
}
