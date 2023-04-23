import { ethers, Event } from 'ethers'
import { CERT_ABI, CERT_BYTECODE, FACTORY_ABI } from './utils/abiProvider';


export class CertificateService {

    provider: ethers.providers.JsonRpcProvider;

    adminWallet: ethers.Wallet;

    factory: ethers.Contract;

    cert: ethers.ContractFactory;

    constructor(
        providerUrl: string,
        adminWalletPrivKey: string
    ) {
        this.provider = new ethers.providers.JsonRpcProvider(providerUrl);
        this.adminWallet = new ethers.Wallet(adminWalletPrivKey, this.provider);
        this.factory = new ethers.Contract("0x1AE80bD4b9921a9D267e856bCFA8CF72688a8D6e", FACTORY_ABI, this.provider);
        this.cert = new ethers.ContractFactory(CERT_ABI, CERT_BYTECODE)
    }


    async createCertCollection(
        owner: string,
        name: string,
        symbol: string
    ): Promise<string> {
        let tx = await this.factory.connect(this.adminWallet).createToken(name, symbol);
        await tx.wait();

        // Get the address of the new token
        const filter = this.factory.filters.TokenCreated(null);
        const events = await this.factory.queryFilter(filter);
        if(events[0].args) {
            return events[0].args[0];
        }

        return "0x";
    }


}