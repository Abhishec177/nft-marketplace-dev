pragma solidity ^0.8.4;


// keyword abstract must be used on contracts to be able to use virtual functions (functions with no definition)

// base contract
abstract contract X {
    function y() public view virtual returns(string memory);
}

// derived contract
contract Z is X {
    function y() public override view returns(string memory) {
        return 'hello';
    }
}

// to write a new deifintion for y in derived contract, it had to be overridden (as y already exists) by using 'override'

