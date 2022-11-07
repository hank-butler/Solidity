// SPDX-Licence-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// Plain ERC20 reference
contract MyToken is ERC20 {
    constructor() ERC20("MyToken", "MTK"){}
}

