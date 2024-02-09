// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

// inhertis simple storage, AddFive is child
contract AddFiveStorage is SimpleStorage {
    // function override
    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    }
}