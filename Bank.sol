// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract Bank {
    mapping (address => uint256) public balances;

    constructor() payable {

    }
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        if(balances[msg.sender] != 0){
            (bool success, ) = msg.sender.call{value: balances[msg.sender] }("");
            require(success, "Failed");
            balances[msg.sender] = 0; // bug
        }
    }
}