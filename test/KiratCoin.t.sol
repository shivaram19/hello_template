// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/KiratCoin.sol";

error Unauthorized();
contract TestKiratCoin is Test {
  KiratCoin public c;

  function setUp() public {
    c = new KiratCoin(0);
  }

  function test_Mint() public {
    c.mint(address(this), 100);
    assertEq(c.balanceOf(address(this)), 100);
  }
  
  function test_Transfer() public {
    c.mint(address(this), 100);
    c.transfer(0x89199FeF648326a39eF9cC46aadfb3f886717B37, 1);
    assertEq(c.balanceOf(address(this)), 99,"ok");
  }

  function test_Approvals() public {
    c.mint(address(this), 100);
    
    c.approve(0x89199FeF648326a39eF9cC46aadfb3f886717B37, 100);
    assertEq(c.balanceOf(0x89199FeF648326a39eF9cC46aadfb3f886717B37), 0,"the balance is not zero");
    assertEq(c.balanceOf(address(this)), 100);
    uint256 amount = c.allowance(address(this), 0x89199FeF648326a39eF9cC46aadfb3f886717B37);
    assertEq(amount, 100);
    vm.prank(0x89199FeF648326a39eF9cC46aadfb3f886717B37);
    c.transferFrom(address(this), 0x89199FeF648326a39eF9cC46aadfb3f886717B37, 100);
    assertEq(c.balanceOf(address(this)), 0);
    assertEq(c.balanceOf(0x89199FeF648326a39eF9cC46aadfb3f886717B37), 100);
  }

  function test_RevertWhen_userDontHaveTokens() public {
    // c.mint(to, amonut);
    // assertEq(uint256(1), uint256(1));
    vm.expectRevert();
    c.transferFrom(address(this),0x89199FeF648326a39eF9cC46aadfb3f886717B37,1);
  }

  function test_RevertWhen_MintisnotOwner() public{
    vm.expectRevert();
    vm.prank(0x89199FeF648326a39eF9cC46aadfb3f886717B37);
    c.mint(address(this), 100);
  }

  function test_howPrankWorks() public {
    vm.startPrank(0x89199FeF648326a39eF9cC46aadfb3f886717B37);
    c.mint(0x89199FeF648326a39eF9cC46aadfb3f886717B37, 100);
    vm.stopPrank();
    assertEq(c.balanceOf(0x89199FeF648326a39eF9cC46aadfb3f886717B37), 100);
  }

}