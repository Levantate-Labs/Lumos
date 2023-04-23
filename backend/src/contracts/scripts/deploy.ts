import { ethers } from "hardhat";

async function main() {

  const Cert = await ethers.getContractFactory("Cert");
  const Factory = await ethers.getContractFactory("CertFactory");

  const cert = await Cert.deploy();
  await cert.deployed();

  const factory = await Factory.deploy(cert.address);
  await factory.deployed();

  const newCert = await factory.createToken(
    "HackAthena v1",
    "HAv1"
  );

  console.log(`Cert: ${cert.address}`);
  console.log(`Factory: ${factory.address}`);
  console.log(`newCert: ${newCert.address}`)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
