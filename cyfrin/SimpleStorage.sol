pragma solidity 0.8.19; // stating our version

contract SimpleStorage {
    // favoriteNumber initialized at 0 if no value given (0 is default value for uint256)
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

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
    }
    
}