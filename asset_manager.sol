// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssetManager {
    mapping(address => uint256) public balances;
    address public owner=msg.sender;

    function deposit() public payable {
        require(msg.value > 5, "Deposit amount must be greater than 5");
        balances[msg.sender] += msg.value;
    }

    function transfer(address recipient, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        if(recipient == msg.sender){
            revert( "Cannot transfer to self");
        }
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        payable(recipient).transfer(amount);
    }

    function withdraw(uint256 amount) public {
    assert(amount > 0 && balances[msg.sender] >= amount);
    balances[msg.sender] -= amount;
    payable(owner).transfer(amount);
}
}
