// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract USDC is ERC20, ERC20Burnable, Pausable, Ownable {
    constructor() ERC20("USDC", "DS") {}

    mapping (address=>pool) public locked;
    
    struct pool {
    uint256 startTime; 
    uint256 endTime;
    uint256 Poolamount;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(uint256 amount) public onlyOwner {
    
        require(amount>=0,"please mint gratherthan 0 Ether");
        uint256 pAmount = amount *10**18 % 70;
        uint Amount= amount *10**18 % 30;
         _mint(msg.sender,Amount);
        _mint(address(this), pAmount);

        locked[msg.sender]=pool(block.timestamp, block.timestamp+600, pAmount++);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }

    function withdrawToken() external {
        require(locked[msg.sender].Poolamount>0,"you are not add amount");
        require(block.timestamp>locked[msg.sender].endTime,"Some time is remain");
        IERC20 tokenContract = IERC20(address(this));
        tokenContract.transfer(msg.sender, locked[msg.sender].Poolamount);
    }

}