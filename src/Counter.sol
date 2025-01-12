// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract Counter { 
  uint8 private num;

  constructor(uint8 _num){
    num = _num;
  }

  function increment() public {
    num++;
  }

  function decrement() public {
    require(num>0,"you can't decrement below zero");
    num--;
  }

  function getNum() public view returns (uint8){
    return num;
  }

  function changeNum(uint8 _num) public {
    num = _num;
  }
}

