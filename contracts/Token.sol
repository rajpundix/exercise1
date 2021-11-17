// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC721/ERC721Full.sol";
import "@openzeppelin/contracts/drafts/Counters.sol";

contract Token is ERC721Full {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string public name;
    address public owner;
    bool public paused;

    constructor () public ERC721Full("Raj", "RAJ") {
    }

    function mint(uint256 quantity) public payable {
        require(quantity <= 10, "Can't mint more than 10" );
        require(quantity != 0, "Cannot min zero");
        require(paused == false, "Contract paused");

        for(uint256 i; i < quantity; i++){
          mint(msg.sender);
        }
    }

    function mint(address recipient) private {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
    }

    function burn(uint256 _value) public returns (bool success) {
        require(paused == false, "Contract paused");
        require(balanceOf(msg.sender) >= _value);

        _burn(msg.sender, _value);
        return true;
    }

    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        require(paused == false, "Contract paused");
        require(balanceOf(_from) >= _value);

        _burn(_from, _value);
        return true;
    }

    function pause(bool _paused) public {
       require(msg.sender == owner, "You are not the owner");
        paused = _paused;
    }
}
