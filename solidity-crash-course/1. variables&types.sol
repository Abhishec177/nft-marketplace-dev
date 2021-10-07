pragma solidity ^0.8.4;

contract LearnVariables {
    
    // major datatypes: Boolean, Integers, Strings
    // Boolean - true or false
    // Integers - uint, uint256
    // strings - Ex. error message texts (Bytes datatype are less cost expensive tho)
    
    uint chocolateBar = 10;
    uint storeOwner = 300;
    bool lieDetector = true;
    string errorMessageText = "There has been a mistake";    
    
}

contract DecisionMaking {
    
    //if else is a fundamental decision making statement
    //if user enters right password, else don't
    
    uint oranges = 5;
    
    function validateOranges() public view returns (bool) {
        
        if(oranges == 5){ //whatever goes into the parantheses gets evaluated for truth
            return true;
        } else {
            return false;
        }
        
    }
    
    uint stakingWallet = 8;
    
    function airDrop() public view returns(uint) {
        if(stakingWallet == 10){
            return stakingWallet + 10;
        }else{
            return stakingWallet + 1;
        }
    }
    
}