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
            return
                CallData({
                    caller: address(0),
                    functionSelector: bytes4(0),
                    data: "",
                    value: uint256(0)
                });
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
    mapping(bytes32 => bool) public givenQuerySet;

    function setDefaultResponse(ReturnData memory returnData_) external {
        defaultReturnData = returnData_;
    }

    function givenQueryReturnResponse(
        bytes memory query_,
        ReturnData memory returnData_
    ) external {
        givenQueryReturn[keccak256(query_)] = returnData_;
        givenQuerySet[keccak256(query_)] = true;
    }

    // prettier-ignore
    fallback(bytes calldata query_) external payable returns (bytes memory){
        // Check if any set query matches the current query
        if (givenQuerySet[keccak256(query_)]) {
            ReturnData memory returnData = givenQueryReturn[keccak256(query_)];
            if (returnData.success) {
                return returnData.data;
            } else {
                require(false);
            }
        } else {
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
}
