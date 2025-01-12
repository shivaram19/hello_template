// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract KiratCoin is ERC20 {
  address public immutable owner;
  constructor(uint256 _initialSupply) ERC20("hakuna matata","hm"){
    owner = msg.sender;
    _mint(owner, _initialSupply);
  }

  function mint(address to, uint256 amonut) public {
    require(msg.sender == owner,"you are not authorized");
    _mint(to, amonut);
  }
}