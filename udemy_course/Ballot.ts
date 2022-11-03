describe("Ballot", () => {
    let ballotContract: Ballot;
    let accounts: SignerWithAddress[];
    beforeEach(async () => {
      accounts = await ethers.getSigners();
      const ballotContractFactory = await ethers.getContractFactory("Ballot");
      ballotContract = (await ballotContractFactory.deploy(
        convertStringArrayToBytes32(PROPOSALS)
      )) as Ballot;
      await ballotContract.deployed();
    });
    describe("when the contract is deployed", () => {
      it("has the provided proposals", async () => {
        // TODO
        throw Error("Not implemented");
      });
      it("sets the deployer address as chairperson", async () => {
        const chairperson = await ballotContract.chairperson();
        expect(chairperson).to.eq(accounts[0].address);
      });
    });
  });