// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/drafts/Counters.sol";

contract Token is ERC20 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string public name;
    address public owner;
    bool public paused;

    constructor(
        string memory tokenName,
        uint256 initialSupply,
        address payable beneficiaryAddress
    ) public ERC20() {
        name = tokenName;
        owner = msg.sender;
        _mint(beneficiaryAddress, initialSupply);
    }

    function mint(uint256 quantity) public payable {
        require(quantity <= 10, "Can't mint more than 10" );
        require(quantity != 0, "Cannot min zero");
        require(paused == false, "Contract paused");
        uint256 supply = totalSupply();

        _tokenIds.increment();
        for(uint256 i; i < quantity; i++){
          _mint(msg.sender, supply + i);
        }
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == owner);
        require(amount < 1e60);
        _mint(receiver, amount);
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
