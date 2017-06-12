var HelloEthereum = artifacts.require("./HelloEthereum.sol");

contract('HelloEthereum', function(accounts) {
  it("should assert true", function() {
    // This var will hold reference to the contract instance
    var hello_ethereum;
    
    // Passed function receives the instance reference
    return HelloEthereum.deployed().then(function(instance){
      hello_ethereum = instance;

      // Set the name
      // accounts[0] used by default for this transaction
      return hello_ethereum.hello("John Doe");
    }).then(function(result){
      //console.log(result.logs[0].event);
      // The events emitted by contract is in the result json
      assert.equal(result.logs[0].event, "HelloInvoked", "Bad Event Receieved");

      // Check if the last caller name = John Doe
      return hello_ethereum.lastCallerName.call();
    }).then(function(name){
      // convert bytes32 received to a JS string
      assert.equal(convertToAscii(name), "John Doe","Bad name received");

      // Now simulate a different caller - accounts[1]
      return hello_ethereum.hello("Jane", {from:accounts[1]});
    }).then(function(result){
      // Now using account[0] invoke the getNames() function
      return hello_ethereum.getNames.call();
    }).then(function(result){
      // Result is an array of bytes32
      // console.log("Last Caller=",convertToAscii(result[0]));
      // console.log("Caller Name=",convertToAscii(result[1]));

      assert.equal(convertToAscii(result[0]), "Jane","Bad name received");
      assert.equal(convertToAscii(result[1]), "John Doe","Bad name received");
    });
  });
});

// Utility function for converting the bytes32 to string
function  convertToAscii(bytes32Name){
  var name = web3.toAscii(bytes32Name);
  name = name.replace(/\0/g, '');
  return name;
}
