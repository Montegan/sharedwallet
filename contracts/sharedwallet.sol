//SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./settings.sol";

pragma solidity ^0.8.9;
contract sharedWallet is settings {
function SetAllowance( address _myaddress,uint _allowance) public onlyOwner {
  allownces[_myaddress].memberaddress= _myaddress;
  allownces[_myaddress].amount= _allowance;
  emit allowances(Owner,_myaddress,_allowance);
}

function Withdraw(address _myadd,uint _amnt) public {
   require(msg.sender == Owner || msg.sender==allownces[msg.sender].memberaddress);
   require(balances[Owner]>=_amnt);

   if (msg.sender == Owner){

   balances[Owner]-= _amnt;
   address payable useradd1= payable (_myadd);
   useradd1.transfer(_amnt);
   emit withdrawDetails(Owner,_myadd, _amnt);
   }
   
   else if(msg.sender==allownces[msg.sender].memberaddress){
   
   require(_amnt <= allownces[msg.sender].amount, "You cannot withdraw more than your allowance");
   
    balances[Owner]-= _amnt;
    allownces[msg.sender].amount-= _amnt;
    address payable useradd= payable (_myadd);
    useradd.transfer(_amnt);
    emit withdrawDetails(Owner,_myadd, _amnt);
   }
}

function checkBalance(address _myadd) public view returns(uint){
    //emit balance(balances[_myadd]);
    return balances[_myadd];
    
}

receive() external payable{
   balances[msg.sender]+= msg.value;  
   emit Deposits(msg.sender,msg.value);
}

fallback() external payable {
     balances[msg.sender]+= msg.value;
     emit Deposits(msg.sender,msg.value);
}


}

