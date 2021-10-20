// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

contract Caller {
    /// @dev Can use this method to call any other contract's function
    /// @param _contractAddress Address of the contract to call
    /// @param _callData Call data
    /// @return ok is `true` if the call was successful
    /// @return data is the encoded result of the call
    function externalCall(address _contractAddress, bytes calldata _callData)
        external
        returns (bool, bytes memory)
    {
        (bool ok, bytes memory data) = _contractAddress.call(_callData);
        return (ok, data);
    }
}
