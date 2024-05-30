# Assest Manager

This Solidity smart contract, named AssetManager, facilitates the management of assets by allowing users to deposit, transfer, and withdraw funds securely on the Ethereum blockchain.

## Description

* Deposit: Users can deposit Ether into the contract, increasing their balance. The deposited amount must be greater than 5 Ether to be accepted.

* Transfer: Users can transfer Ether from their balance to another address. The sender must have a sufficient balance to initiate the transfer, and transfers to the sender's own address are not allowed.

* Withdraw: Users can withdraw Ether from their balance, sending it to the contract owner's address. The withdrawal amount must be greater than zero, and the sender must have a sufficient balance.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., assest_manager.sol). Copy and paste the following code into the file:

```Solidity
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

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile asset_manager.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "AssetManager" contract from the dropdown menu, and then click on the "Deploy" button.

Once deployed, users can interact with the contract through various functions:

- Deposit: Execute the deposit() function with the desired Ether amount to deposit into the contract.
- Transfer: Use the transfer(address recipient, uint256 amount) function to transfer Ether to another address.
- Withdraw: Execute the withdraw(uint256 amount) function to withdraw Ether from the contract to the owner's address.

## Authors

K Jaidev Shankar Reddy 
jaidevsrk.btech22@rvu.edu.in

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
