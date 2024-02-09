// SPDX-License-Indentifier: MIT

pragma solidity ^0.8.19;

// Named imports! Remember these, esp. when multiple contracts in import file.
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }
}