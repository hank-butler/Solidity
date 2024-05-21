// SPDX-License-Identifier: MIT
pragma solidity 0.8.19; // version

// anvil to 
// start running local network on foundry
// forge create <name_of_contract> --interactive
// to deploy on local network after inputing private key


contract SimpleStorage {
    uint256 myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve () public view returns(uint256){
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name)); //.push is how you add to an array, think .append() in python
    }
}