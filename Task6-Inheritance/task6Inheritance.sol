// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RubyToken is ERC20 {
    constructor() ERC20("RubyToken", "RBT") {
        _mint(msg.sender, 1000 * 10**18);
    }
}

// https://mumbai.polygonscan.com/address/0x1b58b06847d6c78d689466151acccbacf283bae3
