// SPDX-License-Identifier: MIT
// Get funds from users
// Withdraw funds
// Set minimum funding value in USD

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

error NotOwner(); // custom error, new since 0.8.4;

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 5e18; // constant no longer takes storage, follow naming convention

    address[] public funders;
    mapping(address funder => uint256 amountFunder) public addressToAmountFunded;

    // global variable for owner of contract
    address public immutable i_owner; //immutable similar to constant for gas savings.

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        // Minimum funding amt.
        // payable makes function accept eth
        // makes contract function like a wallet
        // msg.value is global
        // First input variable is type you're importing from library
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Insufficient funds");
        // reverts if require condition not met (returns variable back to original state)
        

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
        
    }


    function withdraw() public onlyOwner {
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

    modifier onlyOwner() {
        // require(msg.sender == i_owner, "Must be owner");
        if(msg.sender != i_owner){
            revert NotOwner(); // saves gas since you don't have to emit string
        }
        _; // execute function after require is met
    }

    // What happens if someone sends contract ETH without calling fund function?
    // if somebody sends ETH to contract w/out calling fund, recieve and fallback route it to fund()
    receive() external payable {
        // if someone sends contract ETH without calling function, receive special function call
        // then route to fund()
        fund();
    }
    fallback() external payable {
        // fallback is like receive except it has data associated with it
        fund();
    }
    // special functions

    

}