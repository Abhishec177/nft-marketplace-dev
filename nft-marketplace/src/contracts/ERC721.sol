// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
a. nft to point to an address
b. keep track of token ids
c. keep track of token owner addresses to token ids
d. keep track of how many tokens an owner address has
e. create an event that emits a transfer log - contract address, where it is being minted to and the id
*/

contract ERC721 {
    
    mapping(uint256 => address) private _tokenOwner;
    mapping(address => uint256) private _ownedTokensCount;



}