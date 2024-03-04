// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Tech} from "../src/Tech.sol";

contract TechTest is Test {
    Tech public tech;

    function setUp() public {
        tech = new Tech();
    }

    function test_setLubricating() public {
        assertEq(tech.lubricating(), true);
        tech.setLubricating(false);
        assertEq(tech.lubricating(), false);
    }

    function testFuzz_setLubricating_fuzz(bool x) public {
        tech.setLubricating(x);
        assertEq(tech.lubricating(), x);
    }

    function test_renounce() public {
        assertEq(tech.owner(), address(this));
        tech.renounceTokenOwnership();
        assertEq(tech.owner(), address(0));
    }
}
