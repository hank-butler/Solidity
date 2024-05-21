// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

// Imports
import "../lib/forge-std/src/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage {
    // create function to run
    function run() external returns(SimpleStorage){
        vm.startBroadcast(); // related to cheatcodes, but something imported from Foundry
        // everything after this, send to rpc
        SimpleStorage simpleStorage = new SimpleStorage(); // new creates new contract
        vm.stopBroadcast();
        return simpleStorage;
    }
}