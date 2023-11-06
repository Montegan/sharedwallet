//SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
pragma solidity ^0.8.9;

contract settings is Ownable{
address payable public Owner;
mapping (address => uint) public balances;
struct memebers {
    address memberaddress ;
    uint amount; 
}
mapping (address => memebers) public allownces;

event Deposits(address _from,uint amnt);
event allowances(address owner, address allowed, uint amount);
event withdrawDetails(address _from, address _to, uint amount );
event balance(uint amount);
constructor (){
   Owner= payable (msg.sender); 
}
}