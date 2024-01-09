// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyShop{

    //0x692a70D2e424a56D2C6C27aA97D1a86395877b3A
    address public owner;
    mapping(address => uint) public payments;

    constructor(){
        owner = msg.sender;
    }

    function payForItem() public payable {
        payments[msg.sender] = msg.value;
    }

    function withDrawAll() public {
        address payable _to = payable(owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);
        
    }
}
