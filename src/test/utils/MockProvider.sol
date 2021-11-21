// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

contract MockProvider {
    struct CallData {
        address caller;
        bytes4 functionSelector;
        bytes data;
        uint256 value;
    }

    CallData[] internal callData;

    function getCallData(uint256 index_) public view returns (CallData memory) {
        if (index_ >= callData.length) {
            return CallData({caller: address(0), functionSelector: bytes4(0), data: "", value: uint256(0)});
        }
        return callData[index_];
    }

    struct ReturnData {
        bool success;
        bytes data;
    }

    /// @dev Define fallback response for all calls.
    ReturnData internal defaultReturnData;

    mapping(bytes32 => ReturnData) public givenQueryReturn;

    function setDefaultResponse(ReturnData memory returnData_) external {
        defaultReturnData = returnData_;
    }

    // prettier-ignore
    fallback(bytes calldata) external payable returns (bytes memory){
        // Check if any set query matches the current query


        // Default to sending the default response
        CallData memory newCallData = CallData({
            caller: msg.sender,
            functionSelector: msg.sig,
            data: msg.data,
            value: msg.value
        });

        callData.push(newCallData);

        ReturnData memory returnData = defaultReturnData;
        return returnData.data;
    }
}