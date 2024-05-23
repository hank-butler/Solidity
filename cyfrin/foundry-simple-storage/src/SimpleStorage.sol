// SPDX-License-Identifier: MIT

pragma solidity 0.8.19; // solidity version, tells compiler what version to use

contract SimpleStorage {
    uint256 myFavoriteNumber; // declaring a unsigned integer of 256 bits

    struct Person {
        uint256 favoriteNumber;
        string name;
    } // structs are like classes, custom data type

    Person[] public listOfPeople; // making an array of Person structs

    mapping(string => uint256) public nameToFavoriteNumber; // creating a mapping, think python dict or js object

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber; // function to set myFavoriteNumber
    }

    function retrieve() public view returns (uint256){
        return myFavoriteNumber; // view functions don't cost gas, simply returning myFavoriteNumber
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}