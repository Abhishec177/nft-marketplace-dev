// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import './interfaces/IERC165.sol';
import './ERC165.sol';
import './interfaces/IERC721.sol';

/*
a. nft to point to an address
b. keep track of token ids
c. keep track of token owner addresses to token ids
d. keep track of how many tokens an owner address has
e. create an event that emits a transfer log - contract address, where it is being minted to and the id
*/

contract ERC721 is ERC165, IERC721 {
    
    // event Transfer(
    //     address indexed from, 
    //     address indexed to, 
    //     uint256 indexed tokenId
    // );

    // event Approval(
    //     address indexed owner,
    //     address indexed approved,
    //     uint256 indexed tokenId
    // );

    mapping(uint256 => address) private _tokenOwner;
    mapping(address => uint256) private _ownedTokensCount;

    mapping(uint256 => address) private _tokenApprovals;

    constructor() {
        _registerInterface(bytes4(keccak256('balanceOf(bytes4)')^keccak256('ownerOf(bytes4)')^keccak256('transferFrom(bytes4)')));
    }

    function balanceOf(address _owner) public override view returns(uint256) {
        require(_owner != address(0),'owner query for non-existent address');
        return _ownedTokensCount[_owner];
    }

    function ownerOf(uint256 _tokenId) public override view returns (address) {
        address owner = _tokenOwner[_tokenId];
        require(owner != address(0),'owner query for non-existent token');
        return owner;
    }


    //checks whether or not if the token already exists and is owned by another user
    function _exists(uint256 tokenId) internal view returns(bool) {
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

    function _mint(address to, uint tokenId) internal virtual {
        require(to != address(0), 'ERC721: minting to the zero address');
        require(!_exists(tokenId), 'Token already minted and owned by different user');
        // minting the token
        _tokenOwner[tokenId] = to;
        _ownedTokensCount[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }

    function _transferFrom(address _from, address _to, uint256 _tokenId) internal {
        require(_to != address(0), 'Error - ERC721 Transfer to the zero address');
        require(ownerOf(_tokenId) == _from, 'Trying to transfer a token the address does not own!');

        _ownedTokensCount[_from] -= 1;
        _ownedTokensCount[_to] += 1;

        _tokenOwner[_tokenId] = _to;

        emit Transfer(_from, _to, _tokenId);
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) override public {
        require(isApprovedOrOwner(msg.sender, _tokenId));
        _transferFrom(_from, _to, _tokenId);

    }

    // //1. Require that the person approving is the owner
    // //2. We are approving an address to a token (tokenId)
    // 3. require that we can't approve sending tokens of the owner 
    // 4. update the map of the approval addresses

    function approve(address _to, uint256 tokenId) public {
        address owner = ownerOf(tokenId);
        require(_to != owner,"Error - approval to current owner");
        require(msg.sender == owner, "Cuurent caller is not the owner of the token.");
        _tokenApprovals[tokenId] = _to;
        emit Approval(owner, _to, tokenId);
    }

    function isApprovedOrOwner(address spender, uint256 tokenId) internal view returns(bool) {
        require(_exists(tokenId), "token does not exist");
        address owner = ownerOf(tokenId);
        return (spender == owner );
    }
}