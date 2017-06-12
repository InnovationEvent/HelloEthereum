pragma solidity ^0.4.4;

/**
 * Logically SAME as HelloEthereum
 * Except that it uses the string instead of string
 * Use it in Wallet to see it in action
 **/

contract HelloEthereumString {

  // Storage variable for holding last caller
  // Declaring a storage variable public leads to
  // Automatic generation of getter lastCallerName()
  string public  lastCallerName;

  // Storage variable for holding the 
  mapping(address => string)  addressNames;

  // Event gets emitted everytime someone calls the hello function
  event HelloInvoked(string indexed name);

  function HelloEthereumString() {
    // constructor
    lastCallerName = 'not-set';
  }

  /**
   * Receives a string of 32 bytes
   * 1. Generates an event 
   * 2. Adds the address-name to the mapping
   * 3. Set the last caller name
   **/
  function  hello(string name){
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
  function  getNames() constant returns (string lastCaller, string callerName){
    lastCaller = lastCallerName;
    callerName = addressNames[msg.sender];
    
  }
}
