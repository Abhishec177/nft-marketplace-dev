pragma solidity ^0.8.4;


//in solidity, everything is explicitly explained

contract CryptoToken {
    
    // all the code
    
    
    // uint external tokens = 40;
    // uint private tokens = 400;
    // address public minter;
    // uint private totalSupply = 7;
    
    address public minter;
    
    //mapping acts like a dictionary to store data
    //mapping takes a key which which maps to a value: Ex. mapping(key => value) mapName 
    mapping(address => uint) public balances;
    
    //events allow clients to react to specific contracts
    //changes that you declare (one way logging of transactions)
    //types of events: Sent, Transfer, Allow
    
    //events come with preconditioned arguments (inputs)
    //two steps of events: 1. Setting it up, 2. Emitting the event
    
    event Sent(address _from, address _to, uint _amount);
    
    // constructor is a special type of function that gets called immediately upon deployment
    // consructor can be called only one time
    
    constructor() {
        minter = msg.sender;
    }
    
    
    //build a minting function to mint-
    
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }
    
    function send(address _receiver, uint _amount) public {
 
        balances[msg.sender] -= _amount;
        balances[_receiver] += _amount;
        emit Sent(msg.sender,_receiver,_amount);
    }
     

}