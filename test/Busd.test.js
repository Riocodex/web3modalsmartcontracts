const { expect } = require("chai");

describe("BUSDToken", function () {
  let BUSDToken;
  let busd;
  let owner;
  let recipient;
  const totalSupply = BigInt(1000000000); // 1 billion tokens

  beforeEach(async () => {
    BUSDToken = await ethers.getContractFactory("BUSDToken");
    [owner, recipient] = await ethers.getSigners();
    busd = await BUSDToken.deploy(totalSupply);
    await busd.deployed();
  });

  it("should have the correct name", async function () {
    const name = await busd.name();
    expect(name).to.equal("BUSD");
  });

  it("should have the correct symbol", async function () {
    const symbol = await busd.symbol();
    expect(symbol).to.equal("BUSD");
  });

  it("should emit Transfer event when tokens are transferred", async function () {
    const amountToTransfer = 1000;

    await expect(busd.transfer(recipient.address, amountToTransfer))
      .to.emit(busd, "Transfer")
      .withArgs(owner.address, recipient.address, amountToTransfer);
  });

  it("should decrease allowance after transferFrom", async function () {
    const amountToTransfer = 1000;

    await busd.approve(recipient.address, amountToTransfer);
    const initialAllowance = await busd.allowance(owner.address, recipient.address);

    await busd.connect(recipient).transferFrom(owner.address, recipient.address, amountToTransfer);

    const finalAllowance = await busd.allowance(owner.address, recipient.address);
    expect(finalAllowance).to.equal(initialAllowance - amountToTransfer);
  });
});
