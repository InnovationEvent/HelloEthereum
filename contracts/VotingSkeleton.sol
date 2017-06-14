pragma solidity ^0.4.4;

/**
 * SKELETON Code for voting
 * 
 * Contract gets initialized with a string - a question for which answer is Yes & NO
 * Anyone can vote - either yes or no
 * Everyone can vote only once
 * Voting ends after fixed time
 * 
 * Step 2 Generate an event everytime someone votes
 *        event   Voted(address who, bool yesNo);
 *
 * Step 3 Set a time limit to voting
 *
 **/
contract Voting {


  // Constructor
  function  Voting(string quest){
   
  }

  // Vote
  function  vote(bool yesNo){

  }

  // Result
  function  result() returns(string quest, uint yes, uint no){

  }
}
