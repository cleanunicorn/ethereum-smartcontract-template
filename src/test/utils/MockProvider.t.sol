// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "ds-test/test.sol";

import {MockProvider} from "./MockProvider.sol";

contract MockProviderTest is DSTest {
    MockProvider internal mockProvider;

    function setUp() public {
        mockProvider = new MockProvider();
    }

    function test_DefaultCalldata_Returns_SetResponse(bytes memory query) public {
        bytes memory response = "0x1234";
        mockProvider.setDefaultResponse(
            MockProvider.ReturnData({success: true, data: response})
        );

        (bool okReceived, bytes memory responseReceived) = address(mockProvider)
            .call(abi.encode(query));

        assertTrue(okReceived, "Should not fail doing a call");
        assertEq(
            keccak256(response),
            keccak256(responseReceived),
            "Returned response should match set default"
        );

        emit log_bytes(responseReceived);
    }

    function test_SetResponse_For_Query() public {
        bytes memory query = "0x1234";
        bytes memory response = "0x5678";
        mockProvider.setResponse(query, response);

        (bool okReceived, bytes memory responseReceived) = address(mockProvider)
            .call(abi.encode(query));

        assertTrue(okReceived, "Should not fail doing a call");
        assertEq(
            keccak256(response),
            keccak256(responseReceived),
            "Returned response should match"
        );
    }
}
