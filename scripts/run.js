const main = async()=>{
    const money = {value: hre.ethers.utils.parseEther("100")};
    try{
        const nosDogFactory = await hre.ethers.getContractFactory("Nosdog")
        const nosDog = await nosDogFactory.deploy(money)
        await nosDog.deployed()
        console.log("contract deployed to: ",nosDog.address)
        process.exit(0)
    }catch(error){
        console.log(error)
        process.exit(1)
    }
}

main()