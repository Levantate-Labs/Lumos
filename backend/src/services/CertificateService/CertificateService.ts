import { PrismaClient } from '@prisma/client';
import { ethers, Event } from 'ethers'
import { PrismaResponse } from '../PostService';
import { CertCollectionCreateParams } from './types';
import { CERT_ABI, CERT_BYTECODE, FACTORY_ABI } from './utils/abiProvider';


export class CertificateService {

    provider: ethers.providers.JsonRpcProvider;

    adminWallet: ethers.Wallet;

    factory: ethers.Contract;

    cert: ethers.ContractFactory;

    prisma: PrismaClient;

    constructor(
        providerUrl: string,
        adminWalletPrivKey: string,
        prisma: PrismaClient
    ) {
        this.provider = new ethers.providers.JsonRpcProvider(providerUrl);
        this.adminWallet = new ethers.Wallet(adminWalletPrivKey, this.provider);
        this.factory = new ethers.Contract("0x1AE80bD4b9921a9D267e856bCFA8CF72688a8D6e", FACTORY_ABI, this.provider);
        this.cert = new ethers.ContractFactory(CERT_ABI, CERT_BYTECODE)
        this.prisma = new PrismaClient();
    }


    async createCertCollection(
        eventID: string,
        owner: string,
        name: string,
        symbol: string,
        collectionParams: CertCollectionCreateParams
    ): Promise<PrismaResponse> {
        let tx = await this.factory.connect(this.adminWallet).createToken(name, symbol);
        await tx.wait();

        // Get the address of the new token
        const filter = this.factory.filters.TokenCreated(null);
        const events = await this.factory.queryFilter(filter);
        if(events[0].args) {
            collectionParams.ID = events[0].args[0];
            await this.prisma.post.update({ data: { certAddress:  events[0].args[0]}, where: { ID: eventID } });
            await this.prisma.certCollection.create({ data: collectionParams });
            return { statusCode: 200, message: `${events[0].args[0]}` };
        }

        return { statusCode: 403, message: `Phone ed` };
    }

    async allotCertificate(
        eventID: string,
        userID: string,
    ): Promise<PrismaResponse> {
        let event = await this.prisma.post.findUnique({ where: { ID: eventID } });
        let user = await this.prisma.user.findUnique({ where: { ID: userID } });

        if(user && event && event.certAddress) {
            let certCollection = await this.prisma.certCollection.findUnique({ where: { ID: event.certAddress } });
            let wallet = new ethers.Wallet(user?.privKeyHash, this.provider);
            await (await this.cert.connect(wallet).attach(event.certAddress).safeMint(user?.pubAddress, certCollection?.currentTokenId)).wait();
            if(certCollection) {
                let cert = await this.prisma.certs.create({ data: {
                    ID: `${certCollection?.currentTokenId}_${event.certAddress}`,
                    tokenId: certCollection?.currentTokenId,
                    collectionId: certCollection.ID,
                    userId: user.ID,
                    eventId: event.ID
    
                } })

                return { statusCode: 200, message: "Certificate has been alloted" };
            } 
        }
        return { statusCode: 403, message:"Not user/event" };
    }


}