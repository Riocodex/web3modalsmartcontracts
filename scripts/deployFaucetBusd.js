


const hre = require("hardhat");

async function main() {
  const Faucet = await hre.ethers.getContractFactory("FaucetBusd");
  const faucet = await Faucet.deploy("your busd token contract address");

  await faucet.deployed();

  console.log("Faucet contract deployed: ", faucet.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});