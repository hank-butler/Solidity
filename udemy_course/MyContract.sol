pragma solidity 0.8.7;

contract MyContract {
    string value; // "state variable that is stored on chain"

    constructor() {
        value = "Hello, World!";
    }

    
    function get() public view returns(string memory) {
        return value;
    }
    function set(string memory _value) public {
        value = _value; // underscore is a convention for differentiating state and local variables
    }
}

