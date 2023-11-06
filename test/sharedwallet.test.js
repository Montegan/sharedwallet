const sharedWallet= artifacts.require("sharedWallet");

contract("sharedWallet",(accounts)=>{

    before(async()=>{
        shared= await sharedWallet.deployed();
     }  
     )

     it("should deposit the contract a certain amount of money",async()=>{

    // enables to deposite money to the contract
       await shared.sendTransaction({from:accounts[0], value:2000000000000000000})
       assert.equal(await shared.checkBalance(accounts[0]),2000000000000000000)
       //console.log(await shared.checkBalance(accounts[0]))
       const events = await shared.getPastEvents('Deposits', {
        fromBlock: 0,
        toBlock: 'latest'
      });
      console.log(events)
    // enables to add allowed users to the allowance mapping
      await shared.SetAllowance(accounts[1],100)
     const evente = await shared.getPastEvents('allowances', {
        fromBlock: 0,
        toBlock: 'latest'
        });
     console.log(evente)

     // should withdraw based on the permisions
     await shared.Withdraw(accounts[3],2000000000)
     console.log( await web3.eth.getBalance(accounts[3]));
     //assert.equal(balance,0)
     })     
})