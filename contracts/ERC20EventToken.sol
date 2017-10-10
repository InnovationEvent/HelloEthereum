pragma solidity ^0.4.8;

contract ERC20EventToken {

    uint256 public  totalSupply = 1000;
    uint256 public decimals = 2;
    string public  symbol = "EVT";
    string public  name = "This is Hartford Event Token";

    // This is the address of the creator
    address owner;

    // Maintain all balances
     mapping(address => uint256)  balances;

    function ERC20EventToken() {
        owner = msg.sender;
        balances[owner] = totalSupply;
    }

    /// returns balance of the _owner
    /// @param _owner The address from which the balance will be retrieved
    /// @return The balance
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }

    /// transfers specified number of tokens from=msg.sender to=_to
    /// @notice send `_value` token to `_to` from `msg.sender`
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    /// @return Whether the transfer was successful or not
    function transfer(address _to, uint256 _value) returns (bool success) {
        // Return false if specified value is less than the balance available
        if(_value > 0 && balances[msg.sender] < _value) {
        return false;
        }

        // Reduce the balance by _value
        balances[msg.sender] -= _value;

        // Increase the balance of the receiever that is account with address _to
        balances[_to] += _value;

        // Declare & Emit the transfer event
        Transfer(msg.sender, _to, _value);

        return true;
    }

    /// this requires implementation of the allowance & approve
    /// @notice send `_value` token to `_to` from `_from` on the condition it is approved by `_from`
    /// @param _from The address of the sender
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    /// @return Whether the transfer was successful or not
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success){
        // This token does not support this
        // do it on your own
        return false;
    }

    /// msg.sender approves _spender for spending _value of his tokens
    /// @notice `msg.sender` approves `_spender` to spend `_value` tokens
    /// @param _spender The address of the account able to transfer the tokens
    /// @param _value The amount of tokens to be approved for transfer
    /// @return Whether the approval was successful or not
    function approve(address _spender, uint256 _value) returns (bool success){
        return false;
    }

    /// checks the max _spender can spend _owner tokens
    /// @param _owner The address of the account owning tokens
    /// @param _spender The address of the account able to transfer the tokens
    /// @return Amount of remaining tokens allowed to spent
    function allowance(address _owner, address _spender) constant returns (uint256 remaining){
        return 0;
    }

    /// emit the events for transfer and transferFrom
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    
    /// emit from approve event
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
