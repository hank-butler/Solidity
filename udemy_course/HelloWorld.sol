// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract HelloWorld{
  string private text;


  constructor() {
    text = pureText();
  }

  function helloWorld() public view returns (string memory) {
    return text;
  }

  function setText(string calldata newText) public {
    text = newText;
  }
}
