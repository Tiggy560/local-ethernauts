import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  // Helper creates a for loop which counts how many times we win
  for (let i = 0; i < 10; i++) await attacker.hackContract();
};

export default helper;
