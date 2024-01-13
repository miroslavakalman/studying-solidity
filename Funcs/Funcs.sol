// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//Краткий конспектик к уроку.

//public - можно обратиться к функции как извне смарт-контракта, так и изнутри смарт-контракта.
//external - внешний. к функции можно обращаться только извне.
//internal - к функции можно обращаться изнутри смарт-контракта, также могут обращаться наследующие контракты
//private - можно обращаться только изнутри контракта.

//view - функция может только читать данные из блокчейна, но не может их модифицировать. вызывается через call. для возврата каких-либо данных дописываем returns.
//pure - функция, объявленная через pure не может читать данные, но вызывается так же, через call.
 
//модификатор payable у функции означает, что в эту функцию можно присылать деньги.

//fallback вызывается в том случае, если относительно смарт-контракта была вызвана транзакция с неизвестным именем функции.
//receive будет вызываться в том случае, если в смарт-контракт поступили денежные средства в транзакции, но в этой транзакции нет информации о том, какую функцию следует выполнить.
contract Demo {
		// SCOPES:
    // public
    // external
    // internal
    // private

    uint public balance;

		// PAYABLE
    fallback() external payable {
        
    }
    receive() external payable {
        //balance += msg.value;
    }

    function pay() external payable {
        balance += msg.value;
    }

    // transaction
    function setMessage(string memory newMessage) external returns(string memory) {
        message = newMessage;
        return message;
    }

    // call
    function getBalance() public view returns(uint _balance) {
        _balance = address(this).balance;
        //return _balance;
    }

		string message = "hello!"; // state
    function getMessage() external view returns(string memory) {
        return message;
    }

    function rate(uint amount) public pure returns(uint) {
        return amount * 3;
    }
}
