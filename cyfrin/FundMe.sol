// Get funds from users
// Withdraw funds
// Set minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// interface AggregatorV3Interface {

//   function decimals()
//     external
//     view
//     returns (
//       uint8
//     );

//   function description()
//     external
//     view
//     returns (
//       string memory
//     );

//   function version()
//     external
//     view
//     returns (
//       uint256
//     );

//   function getRoundData(
//     uint80 _roundId
//   )
//     external
//     view
//     returns (
//       uint80 roundId,
//       int256 answer,
//       uint256 startedAt,
//       uint256 updatedAt,
//       uint80 answeredInRound
//     );

//   function latestRoundData()
//     external
//     view
//     returns (
//       uint80 roundId,
//       int256 answer,
//       uint256 startedAt,
//       uint256 updatedAt,
//       uint80 answeredInRound
//     );

// }

contract FundMe {

    uint256 public minimumUsd = 5;

    function fund() public payable {
        // Minimum funding amt.
        // payable makes function accept eth
        // makes contract function like a wallet
        // msg.value is global
        require(msg.value >= minimumUsd, "Insufficient funds");
        // reverts if require condition not met (returns variable back to original state)
        
    }


    // function withdraw() public {}

    function getPrice() public {
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        
        // ABI
    }

    function getConversionRate() public {}

    function getVersion() public view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}