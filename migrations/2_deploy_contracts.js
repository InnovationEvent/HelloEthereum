
var HelloEthereum = artifacts.require("./HelloEthereum.sol");
var Voting = artifacts.require("./Voting.sol");

module.exports = function(deployer) {
  deployer.deploy(HelloEthereum);
  deployer.deploy(Voting,"Do you believe in Ghosts?");
};

