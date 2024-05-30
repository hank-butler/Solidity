// SPDX-License-Identifier: MIT
// forge script <filepath/to/Script.s.sol> 
// Run the above in the terminal, reference foundry docs if needed.

pragma solidity 0.8.19;

// imports!
import {Script} from "forge-std/Script.sol"; // still worked when ran script!
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        vm.startBroadcast();
        // have to bookend deployment of contract with these commands
        SimpleStorage simpleStorage = new SimpleStorage();


        vm.stopBroadcast();

        return simpleStorage;
    }
}