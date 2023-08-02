# Getting Started with the web3 modal dapp
This is the development of the contract in the web3modal dapp, i will explain explicitly my smart contract design choices, functionalities, issues and solutions.



## Deploying contract
all these will work after the correct installation of this project , if you dont have this project locally
input `git clone https://github.com/Riocodex/web3modalsmartcontracts.git NAMEOFYOURDIRECTORY` in your terminal and then cd into the directory and input the command `npm i`
- first ensure you have mumbai because this contract is deployed in the mumbai testnet to get mumbai you can go [here](https://mumbaifaucet.com/), to deploy on another blockchain you can simply get and setup an rpc on [alchemy](https://dashboard.alchemy.com/)
- create a .env file in the project directory and put in your private key and rpc testnet in the variables like this `PRIVATE_KEY` `TESTNET_RPC_KEY `
- when you set that up you add it to the hardhat.config.js file,i already input the syntax
- next go to the terminal and input the command `npx hardhat compile` then run `npx hardhat run scripts/deployBusd.js --network yourtestnetnetwork` example `npx hardhat run scripts/deployBusd.js --network goerli` and copy the address of the busd address and add to the deployFaucetBusd.js script and then input `npx hardhat run scripts/deployFaucetBusd.js --network yourtestnetnetwork` to you terminal
- copy the address and view on respective networks etherscan





## Overview
First the desired function is to develop a contract to enable the transfer of BUSD tokens to a specified address. To this there are 2steps
- develop a BUSD token contract
- develop a contract to send BUSD from the token contract
i will discuss how i went through all this along with the issues and solutions i faced
  
## Developing the BUSD token contract
i developed the BUSD token contract that can send and receive tokens along with several other basic token contract features.

### issues and solutions
with just the BUSD token contract with solidity, i can send and transfer tokens to any address, but the problem is its going to be only me the one who deployed it, now normally i can adjust the contract to make it anyone but that isnt wise in my persepctive nor recommended so instead i created another contract, i send BUSD to the contract and it sends it to whoever wants it.

## Developing the Faucet Contract
i created the faucet contract with solidity and enabled it to receive and send tokens and unlike the token contract it can be anyone, it musnt be me. 

## SUMMARY
I had fun doing this, wasnt really challenging as i have deployed lots of token contracts and im very proficient in smart contract development. Hope you enjoyed and understood the documentation. Cant wait to work with you.




