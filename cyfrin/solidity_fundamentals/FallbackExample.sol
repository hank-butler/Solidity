// SPDX-License-Identifier: MIT

contract FallbackExample {
    uint256 public result;

    receive() external payable {
        // receive doesn't need function keyword since it's special
        // as long as there's no data, receive fucntion is triggered
        result = 1;
    }

    fallback() external payable {
        result = 2;
        // don't need function selector
    }
}