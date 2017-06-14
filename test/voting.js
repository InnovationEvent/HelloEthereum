var Voting = artifacts.require("./Voting.sol");

contract('Voting', function(accounts) {
  it("should assert true", function() {
      var  voting_instance;
      return Voting.deployed().then(function(instance){
        voting_instance = instance;
        return voting_instance.result.call();
    }).then(function(result){
      printResult(result);
      // Lets send 3 yes votes - effectively there should be only 2
      voting_instance.vote(true, {from:accounts[0]});
      voting_instance.vote(true, {from:accounts[0]});
      voting_instance.vote(true, {from:accounts[1]});
      // Lets send 3 no votes
      voting_instance.vote(false, {from:accounts[2]});
      voting_instance.vote(false, {from:accounts[3]});
      voting_instance.vote(false, {from:accounts[4]});
      // Lets get vote count
      return voting_instance.result.call();
    }).then(function(result){
      printResult(result);
    });
  });
});

// Console log print the result
function printResult(result){
  console.log(result[0],result[1].toNumber(), result[2].toNumber());
}
