// SPDX-License-Identifier: MIT 
pragma solidity 0.8.19; // stating our version

contract SimpleStorage {
    // favoriteNumber initialized at 0 if no value given (0 is default value for uint256)
    // automatically storage due to being outside function scope
    uint256 myFavoriteNumber; 

    // uint256[] listOfFavoriteNumbers; // array of uint256's, [0, 78,90]

    // create custom data type with struct
    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    
    //type [] to empty array, visibility, name of array
    // array is dynamic 
    Person[] public listOfPeople;
    // static array Person[3] => max 3 people in array

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
        
    }

    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
        // view => read state from blockchain
    }

    // calldata, memory, storage
    // calldata, memory are temporary variables
    // strings are special type, thus specifying calldata or memory
    // memory can be changed, calldata CANNOT be modified that are tempory
    // storage is permanent variables that can be changed
    // uint256 is primitive type, knows where to put it
    // string is array of bytes, hence memory
    // storage won't work because of function scope
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
    }
    
}

// Deployed on Sepolia!
// 'https://sepolia.etherscan.io/tx/0x7ec66eb6e12a17e166e8d307bb46f73fc45349d0a038db483d3bc6c4825dae3d'