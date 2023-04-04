

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

error totalSupplyExceed();

contract hhcwToken is ERC20 , Ownable {
    constructor() ERC20("HHCWToken", "HHCWToken") {}
    uint256 public supply = 20_000_000 ether;

    function increaseTotalSupply(uint256 _supply) public onlyOwner {
       supply +=_supply;
    }
    
    function mint(address to, uint256 _amount) public onlyOwner {
    if ((totalSupply() + _amount) > supply) {
            revert totalSupplyExceed();
        }
        _mint(to,_amount);
    }

    function airdrop(address[] memory recipients, uint256[] memory amounts) public onlyOwner {
        require(recipients.length == amounts.length, "Recipients and amounts arrays must have same length");
        for (uint256 i = 0; i < recipients.length; i++) {
            address recipient = recipients[i];
            uint256 amount = amounts[i];
            require(recipient != address(0), "Recipient cannot be zero address");
            require(amount > 0, "Amount must be greater than zero");
            if ((totalSupply() + amount) > supply) {
            revert totalSupplyExceed();
            }
            _mint(recipient,amount);
        }
    }

}
