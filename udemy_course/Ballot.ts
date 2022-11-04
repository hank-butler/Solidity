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

  import { ethers } from "hardhat";

  const PROPOSALS = ["Proposal 1", "Proposal 2", "Proposal 3"];
  
  function convertStringArrayToBytes32(array: string[]) {
    const bytes32Array = [];
    for (let index = 0; index < array.length; index++) {
      bytes32Array.push(ethers.utils.formatBytes32String(array[index]));
    }
    return bytes32Array;
  }
  
  async function main() {
    console.log("Deploying Ballot contract");
    console.log("Proposals: ");
    PROPOSALS.forEach((element, index) => {
      console.log(`Proposal N. ${index + 1}: ${element}`);
    });
    const ballotContractFactory = await ethers.getContractFactory("Ballot");
    const ballotContract = await ballotContractFactory.deploy(
      convertStringArrayToBytes32(PROPOSALS)
    );
    await ballotContract.deployed();
    console.log(`The ballot smart contract was deployed at ${ballotContract.address}`)
  }
  
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });

// Development.ts

async function main() {
  console.log("Deploying Ballot contract");
  console.log("Proposals: ");
  const proposals = process.argv.slice(2);
  proposals.forEach((element, index) => {
    console.log(`Proposal N. ${index + 1}: ${element}`);
  });
  const provider = ethers.getDefaultProvider("goerli");
  const wallet = ethers.Wallet.createRandom();
  const signer = wallet.connect(provider);
  const balance = await signer.getBalance();
  console.log(`This address has a balance of ${balance} wei`);
  if (balance.eq(0)) throw new Error("I'm too poor");
  const ballotContractFactory = new Ballot__factory(signer);
  const ballotContract = await ballotContractFactory.deploy(
    convertStringArrayToBytes32(proposals)
  );
  await ballotContract.deployed();
  console.log(`The ballot smart contract was deployed at ${ballotContract.address}`)
}

// Adding main() function
async function main() {
  console.log("Deploying Ballot contract");
  console.log("Proposals: ");
  const proposals = process.argv.slice(2);
  proposals.forEach((element, index) => {
    console.log(`Proposal N. ${index + 1}: ${element}`);
  });
  const provider = ethers.getDefaultProvider("goerli");
  const wallet = ethers.Wallet.fromMnemonic(process.env.MNEMONIC ?? "");
  const signer = wallet.connect(provider);
  console.log(`Connected to the wallet ${signer.address}`);
  const balance = await signer.getBalance();
  console.log(`This address has a balance of ${balance} wei`);
  if (balance.eq(0)) throw new Error("I'm too poor");
  const ballotContractFactory = new Ballot__factory(signer);
  const ballotContract = await ballotContractFactory.deploy(
    convertStringArrayToBytes32(proposals)
  );
  await ballotContract.deployed();
  console.log(`The ballot smart contract was deployed at ${ballotContract.address}`)
}