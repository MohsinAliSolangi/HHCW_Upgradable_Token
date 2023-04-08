// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

error totalSupplyExceed();
error waitForStartSale();
error SaleSupplyExced();
error pleaseSendTokenPrice();
contract MyToken is Initializable, ERC20Upgradeable, OwnableUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    uint256 public supply = 20_000_000 ether;
    uint256 public preSale = 5_000_000 ether;
    uint256 public Sale = 5_000_000 ether;
    uint256 public mintPrice = 1;
    
    bool public sale;
    bool public presale;

 
    constructor() {
        _disableInitializers();
    }

    function initialize() initializer public {
        __ERC20_init("HHCWToken", "HHCWToken");
        __Ownable_init();
      
    }
    
    function startSale()public onlyOwner{
        presale=false;
        sale=true;
    }

    function startPreSale()public onlyOwner{
        sale=false;
        presale=true;
    }

    function increaseTotalSupply(uint256 _supply) public onlyOwner {
       supply +=_supply;
    }

    function increaseMintPrice(uint256 _mintPrice) public onlyOwner {
       mintPrice +=_mintPrice;
    }
    
    function mint(address to, uint256 _amount) public payable onlyOwner {
    if(sale == false && presale == false){
        revert waitForStartSale();
    }
    if ((totalSupply() + _amount) > supply) {
        revert totalSupplyExceed();
    }

    if(presale!=false){
    if((totalSupply() + _amount)>(Sale)){
        revert SaleSupplyExced();
    }
    if(msg.value < (_amount*mintPrice)) {
        revert pleaseSendTokenPrice();   
    }
     
      _mint(to, _amount);
    }

    if(sale!=false){
    if((totalSupply() + _amount)>(Sale)){
        revert SaleSupplyExced();
    }
    if(msg.value < (_amount*mintPrice)) {
        revert pleaseSendTokenPrice();   
    }
     
      _mint(to, _amount);
    }

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
