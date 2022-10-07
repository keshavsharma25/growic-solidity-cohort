pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

contract YourContract is Ownable {
    struct Student {
        string studentName;
        uint256 percentage;
        uint256 totalMarks;
        bool isValue;
    }

    // address public owner;
    mapping(address => Student) studentMapper;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not Owner");
        _;
    }

    function register(
        address studentId,
        string memory _studentName,
        uint256 _percentage,
        uint256 _totalMarks
    ) public onlyOwner returns (bool) {
        require(
            !studentMapper[studentId].isValue,
            "Student is already Registered"
        );
        if (!studentMapper[studentId].isValue) {
            studentMapper[studentId].studentName = _studentName;
            studentMapper[studentId].percentage = _percentage;
            studentMapper[studentId].totalMarks = _totalMarks;
            studentMapper[studentId].isValue = true;

            return true;
        }

        return false;
    }

    function getStudentDetails(address studentId)
        public
        view
        returns (
            string memory studentName,
            uint256 percentage,
            uint256 totalMarks
        )
    {
        if (studentMapper[studentId].isValue) {
            return (
                studentMapper[studentId].studentName,
                studentMapper[studentId].percentage,
                studentMapper[studentId].totalMarks
            );
        }
    }
}
