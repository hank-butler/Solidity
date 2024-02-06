pragma solidity 0.8.19; // stating our version

contract SimpleStorage {
    // favoriteNumber initialized at 0 if no value given (0 is default value for uint256)
    uint256 public favoriteNumber; 

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        
    }

    function retrieve() public view returns(uint256) {
        return favoriteNumber;
        // view => read state from blockchain
    }

    
}