// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// конспект
//инструкции: require, revert, assert. нужны для того, чтобы проверить некое условие, если оно не выполняется, то выполняемая транзакция будет отменена и функция не будет выполнена. 
// require. передаем два аргумента, первый - условное выражение, второй - сообщение об ошибке. 
//revert же принимает только один аргумент - сообщение об ошибке. (if)
//assert используется реже, принимает только условное выражение в качестве аргумента.
// модф. _; для выхода 
// event. события.  даем имя, описываем поля/атрибуты.

contract Demo {
    // require
    // revert
    // assert
    address owner;

    event Paid(address indexed _from, uint _amount, uint _timestamp);

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        pay();
    }

    function pay() public payable {
        emit Paid(msg.sender, msg.value, block.timestamp);
    }

    modifier onlyOwner(address _to) {
        require(msg.sender == owner, "you are not an owner!");
        require(_to != address(0), "incorrect address!");
        _;
        //require(...);
    }

    function withdraw(address payable _to) external onlyOwner(_to) {
        // Panic
        // assert(msg.sender == owner);
        // Error
        // require(msg.sender == owner, "you are not an owner!");
        // if(msg.sender == owner) {
        //     revert("you are not an owner!");
        // } else {}
        
        _to.transfer(address(this).balance);
    }
}
