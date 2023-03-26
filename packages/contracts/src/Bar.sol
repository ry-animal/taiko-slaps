// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

contract Bar {
    string public myString = "Hello, bar!";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}
