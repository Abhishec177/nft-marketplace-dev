pragma solidity ^0.8.4;

contract LearnArrays {
    
    //writing arrays in solidity
    // operations: pop, push and length
    // remove elements from array
    
    uint[] public myArray;
    uint[] public myArray2;
    uint[200] public myFixedSizedArray;
    
    //push() method adds one or more elements to the end of the array and returns the new length of the array
    //pop() removes the last element and returns the new length
    
    function push(uint number) public {
        myArray.push(number);
    }
    
    function pop() public {
        myArray.pop();
    }
    
    //length is a string property that is used to determine the length of the string
    
    function getLength() public view returns(uint) {
        return myArray.length;
    }
    
    //deleting elements from array (not just last element): delete method
    //it doesnt change length, it just changes the value of element on the given index to default value (0).
    
    
    function remove(uint i) public {
        delete myArray[i];
    }
    
    
}