// Get funds from users
// Withdraw funds
// Set minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract FundMe {
    function fund() public payable {
        // Minimum funding amt.
        // payable makes function accept eth
        // makes contract function like a wallet
        // msg.value is global
        require(msg.value > 1e18, "Insufficient eth");
        
    }


    // function withdraw() public {}
}