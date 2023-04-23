import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomiclabs/hardhat-etherscan";

const config: HardhatUserConfig = {
  solidity: "0.8.18",
  networks: {
    mumbai: {
      url: "https://polygon-mumbai.g.alchemy.com/v2/KWo03EtX54m_F8Hfarz6xYA3Jv-G9UGi",
      accounts: ["ef5f89db5778eaa0f16353b7cc2c9ad35c6f9da8acdc4bd1ff008da5e2c3f9f6"]
    }
  },
  etherscan: {
    apiKey: "56ZH6N3N1B1XGU8YBN7GFUP16T3IR3N9U3"
  }
};

export default config;
