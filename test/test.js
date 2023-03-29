const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Defi contract", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  let USDC
  let USDT
 
it("Deploy the contract ", async function(){
  
  [  per1, otherAccount ] = await ethers.getSigners();

  USDC = await hre.ethers.getContractFactory("USDC");
  USDT = await USDC.deploy();
  
  await USDT.deployed();
  
  console.log("smart contract deploy here ",USDT.address);

 }),


it("this is call to mint function ", async function(){

const mint= await USDT.mint(10);
const balance = await USDT.balanceOf(per1.address);
const Contractbalance = await USDT.balanceOf(USDT.address);
//const balanceInEth= ethers.utils.formatEther(Contractbalance);
console.log("this is Contractbalance &&: ",Contractbalance);
console.log("this is owner balance ## ",balance.toString());

})

it("this is call to mint function ", async function(){

  const mint= await USDT.mint(1);
  const balance = await USDT.balanceOf(per1.address);
  const Contractbalance = await USDT.balanceOf(USDT.address);
  console.log("this is Contractbalance && : ",Contractbalance);
  console.log("this is owner balance ## ",balance.toString());
  
  })




it("This is withdraw test",async function(){
await network.provider.send("evm_increaseTime", [3600])
await network.provider.send("evm_mine")
const withdraw= await USDT.withdrawToken();
const balance = await USDT.balanceOf(per1.address);
const Contractbalance = await USDT.balanceOf(USDT.address);
console.log("after withdraw Contractbalance && : ",Contractbalance.toString());
console.log("after withdraw owner balance ## ",balance.toString());




});
  

it("This is withdraw test",async function(){
  await network.provider.send("evm_increaseTime", [3600])
  await network.provider.send("evm_mine")
  const withdraw= await USDT.withdrawToken();
  const balance = await USDT.balanceOf(per1.address);
  const Contractbalance = await USDT.balanceOf(USDT.address);
  console.log("after withdraw Contractbalance && : ",Contractbalance.toString());
  console.log("after withdraw owner balance ## ",balance.toString());
  
  
  
  
  });

    
    

    
  });
