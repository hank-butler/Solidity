// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

interface HelloWolrdInterface{
function helloWolrd() external view returns (string memory);
function setText(string memory newText) external;
}
