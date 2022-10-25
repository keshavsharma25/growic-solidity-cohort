pragma solidity >=0.8.0 <0.9.0;

//SPDX-License-Identifier: MIT

contract Task3 {
    struct User {
        string name;
        uint256 age;
    }

    mapping(address => uint256) public balances;
    mapping(address => User) public userDetails;

    function deposit(uint256 amount) public {
        balances[msg.sender] += amount;
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function setUserDetails(string calldata _name, uint256 _age) public {
        userDetails[msg.sender].name = _name;
        userDetails[msg.sender].age = _age;
    }

    function getUserDetail() public view returns (User memory) {
        return userDetails[msg.sender];
    }
}
