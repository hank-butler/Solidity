// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

interface HelloWolrdInterface{
function helloWolrd() external view returns (string memory);
function setText(string memory newText) external;
}

contract HelloWorld is HelloWolrdInterface {
  string private text;

  constructor() {
    text = "Hello World";
  }

  function helloWolrd() public view override returns (string memory) {
    return text;
  }

  function setText(string memory newText) public override {
    text = newText;
  }
}
