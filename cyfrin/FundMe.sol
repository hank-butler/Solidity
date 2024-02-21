// Get funds from users
// Withdraw funds
// Set minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunder) public addressToAmountFunded;

    function fund() public payable {
        // Minimum funding amt.
        // payable makes function accept eth
        // makes contract function like a wallet
        // msg.value is global
        // First input variable is type you're importing from library
        require(msg.value.getConversionRate() >= minimumUsd, "Insufficient funds");
        // reverts if require condition not met (returns variable back to original state)
        

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
        
    }


    function withdraw() public {
        // reset mappings after all money is withdrawn
        // showing for loop in solidity
        // for(/* starting index, ending index, step*/)
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset array and withdraw funds
        funders = new address[](0);
        // withdraw the funds
        // transfer: automatically reverts if transactions fails
        // msg.sender is type address, payable(msg.sender) is payable which is how to interact with ETH
        // type casted
        // payable(msg.sender).transfer(address(this).balance);
        // // Issues with transfer?
        // // send returns a bool
        // bool sendSuccess = payable(msg.sender).send(address(this).balance); 
        // require(sendSuccess, "Send failed");
        // // call, first lower level commands we use
        // // virtually any function in all of Ethereum without ABI!
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}(""/* any function information from other contracts*/);
        // call function returns two variables, can place in ()
        require(callSuccess, "Call  failed"); // CALL IS RECOMMENDED FOR ETH OR ERC20


    }

    // function getPrice() public view returns(uint256){
    //     // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        
    //     // ABI
    //     AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    //     (, int256 price,,,) = priceFeed.latestRoundData();
    //     // Price of ETH in terms of USD
    //     return uint256(price * 1e10);
    // }

    // function getConversionRate(uint256 ethAmount) public view returns (uint256) {
    //     uint256 ethPrice = getPrice();
    //     // multiply before dividing because of whole nums in solidity
    //     // will make sense in foundry section
    //     uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
    //     return ethAmountInUsd;
    // }

    // function getVersion() public view returns(uint256){
    //     return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    // }
}