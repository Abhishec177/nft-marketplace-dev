pragma solidity >=0.7.0 < 0.9.0;

interface IERC165 {
    
    // this is an interface because we have statically declared it as an interface
    // and contains only unimplemented functions
    
    //what is the calculation for this function?
    function supportsInterface(bytes4 interfaceId) external view returns (bool);

}

contract ERC165 is IERC165 {
    
    //write a vyte calculation interface function algorithm
    function calcFingerPrint() public view returns(bytes4) {
        
        return bytes4(keccak256('supportsInterface(bytes4)'));
        // return bytes4(keccak256('supportsInterface(bytes4)')^keccak256('balanceOf(bytes4)'));
        
        //function supports interface value: 0x01ffc9a7
    }
    
    //registering the interface (comes from within)
    
    function _registerInterface(bytes4 interfaceId) public {
        require(interfaceId != 0xffffffff,"ERC165: Invalid Interface");
        _supportedInterfaces[interfaceId] = true;
    }

    //hash table to keep track of contract figerprint data of byte function conversions
    mapping(bytes4 => bool) private _supportedInterfaces;
    
    function supportsInterface(bytes4 interfaceId) external view override returns (bool){
        return _supportedInterfaces[interfaceId];
    }
    
    constructor() {
        _registerInterface(0x01ffc9a7);
    }
}

