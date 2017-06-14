pragma solidity ^0.4.4;

contract HelloEthereum {

  // Storage variable for holding last caller
  // Declaring a storage variable public leads to
  // Automatic generation of getter lastCallerName()
  bytes32 public  lastCallerName;

  // Storage variable for holding the 
  mapping(address => bytes32)  addressNames;

  // Event gets emitted everytime someone calls the hello function
  event HelloInvoked(bytes32 indexed name);

  function HelloEthereum() {
    // constructor
    lastCallerName = 'not-set';
  }

  /**
   * Receives a string of 32 bytes
   * 1. Generates an event 
   * 2. Adds the address-name to the mapping
   * 3. Set the last caller name
   **/
  function  hello(bytes32 name){
    // Invoke the event
    HelloInvoked(name);

    // Add to mapping
    addressNames[msg.sender] = name;

    // Set the last caller name
    lastCallerName = name;
  }

  /**
   * Return 2 values
   * 1. Last Caller Name
   * 2. Caller's name if it is there in the mapping
   **/
  function  getNames() constant returns (bytes32 lastCaller, bytes32 callerName){
    lastCaller = lastCallerName;
    callerName = addressNames[msg.sender];
    
    // optional
    return (lastCaller, callerName);
  }
}
