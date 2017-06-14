pragma solidity ^0.4.4;

/**
 * Contract gets initialized with a string - a question for which answer is Yes & NO
 * Anyone can vote - either yes or no
 * Everyone can vote only once
 * Voting ends after fixed time
 * 
 * Step 2 Set a time limit to voting
 **/
contract Voting {

  string  public                question;
  mapping(address => address)   addressVoted;
  // count of votes
  uint    yesVotes = 0;
  uint    noVotes = 0;

  // Constructor
  function  Voting(string quest){
    question = quest;
  }

  // Vote
  function  vote(bool yesNo){
    // check if the caller has already voted
    if(addressVoted[msg.sender] == address(0x00)){
      if(yesNo) yesVotes++;
      else noVotes++;
      // Add to the mapping
      addressVoted[msg.sender] = msg.sender;
    } else {
      // do nothing
    }
  }

  // Result
  function  result() returns(string quest, uint yes, uint no){
    quest = question;
    yes = yesVotes;
    no  = noVotes;
  }
}
