pragma solidity >=0.8.0 <0.9.0;

//SPDX-License-Identifier: MIT

contract Task2 {
    mapping(address => uint256) public balances;

    function deposit(uint256 amount) public {
        balances[msg.sender] += amount;
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
