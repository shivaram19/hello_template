// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Counter.sol";

contract TestContract is Test {
    Counter c;

    function setUp() public {
        c = new Counter(20);
    }

    function testInc() public{
        c.increment();
        c.increment();
        c.decrement();
        assertEq(c.getNum(), 21);
    }

    
    function testDec() public{
        c.decrement();
        c.decrement();
        c.increment();
        assertEq(c.getNum(), 19);
    }

}
