// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "ds-test/test.sol";

import "./test/utils/Caller.sol";

import {OnlyAuthorized} from "./OnlyAuthorized.sol";

contract OnlyAuthorizedTest is DSTest {
    OnlyAuthorized private oa;

    function setUp() public {
        oa = new OnlyAuthorized();
    }

    function testOtherUsersCannotChangeOwner() public {
        Caller u1 = new Caller();

        (bool ok, ) = u1.externalCall(
            address(oa),
            abi.encodeWithSelector(oa.changeOwner.selector, (address(1)))
        );

        assertTrue(!ok, "Only the owner can change owner");
    }
}
