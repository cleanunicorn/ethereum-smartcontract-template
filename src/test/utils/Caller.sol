// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

contract Caller {
    /// @dev Can use this method to call any other contract's function
    /// @param contractAddress_ Address of the contract to call
    /// @param callData_ Call data
    /// @return ok is `true` if the call was successful
    /// @return data is the encoded result of the call
    function externalCall(address contractAddress_, bytes calldata callData_)
        external
        returns (bool, bytes memory)
    {
        (bool ok, bytes memory data) = contractAddress_.call(callData_); // solhint-disable-line
        return (ok, data);
    }
}
