pragma solidity 0.8.7;

contract Greeter {
	string value;

	constructor() {
		value = 'Buenos dias!';
	}

	function get() public view returns(string memory) {
        return value;
    }
    function set(string memory _value) public {
        value = _value; // underscore is a convention for differentiating state and local variables
    }
}