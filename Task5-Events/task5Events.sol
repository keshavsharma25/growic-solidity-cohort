pragma solidity >=0.8.0 <0.9.0;

//SPDX-License-Identifier: MIT

contract YourContract {
    struct User {
        string name;
        uint256 age;
    }

    event FundsDeposited(address user, uint256 amount);
    event ProfileUpdated(address user);

    mapping(address => uint256) public balances;
    mapping(address => User) public userDetails;

    uint256 private Fee = 0.01 ether;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Not the owner. Only owner allowed!");
        _;
    }

    modifier value(uint256 _amount) {
        require(_amount > Fee, "Amount too small");
        _;
    }

    function deposit(uint256 _amount) public payable {
        require(_amount > 0, "Enter valid amount > 0");
        balances[msg.sender] += _amount;
        (bool sent, ) = payable(address(this)).call{value: _amount}("");
        require(sent, "Transaction failed!");
        emit FundsDeposited(msg.sender, _amount);
    }

    function withdraw() public onlyOwner {
        (bool sent, ) = payable(msg.sender).call{value: address(this).balance}(
            ""
        );
        require(sent, "Transaction failed!");
    }

    function addFund(uint256 _amount) public payable value(_amount) {
        require(
            balances[msg.sender] >= 0,
            "Use the deposit() first as you are new"
        );
        balances[msg.sender] += _amount;
        (bool sent, ) = payable(address(this)).call{value: _amount}("");
        require(sent, "Transaction failed!");

        emit FundsDeposited(msg.sender, _amount);
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function setUserDetails(string calldata _name, uint256 _age) public {
        userDetails[msg.sender].name = _name;
        userDetails[msg.sender].age = _age;

        emit ProfileUpdated(msg.sender);
    }

    function getUserDetail() public view returns (User memory) {
        return userDetails[msg.sender];
    }
}
