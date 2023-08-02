const hre = require("hardhat");

async function main(){
    const BusdToken = await hre.ethers.getContractFactory("BusdToken");
    const busdToken = await BusdToken.deploy(100000000, 50);

    await busdToken.deployed();

    console.log("Busd Token deployed @ ",busdToken.address);
 

    
}


main().catch((error) =>{
    console.error(error);
    process.exitCode=1;
  });