const sharedWallet= artifacts.require("sharedWallet");

module.exports=function (deployer) {
    deployer.deploy(sharedWallet);
  };