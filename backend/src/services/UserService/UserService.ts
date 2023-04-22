import { Prisma, PrismaClient } from "@prisma/client";
import { UserSignInParams, UserRegisterParams, PrismaResponse } from "./types";

export class AuthService {

    prisma: PrismaClient;


    constructor(prisma: PrismaClient) {
        this.prisma = prisma;
    }

    /* Authentication */

    public async registerAuth(params: UserRegisterParams): Promise<PrismaResponse> {
        let user = await this.prisma.auth.findUnique({ where: { ID: params.ID } });

        if(!user) {
            await this.prisma.auth.create({ data: params });
            return {statusCode: 200, message: "User Registered Successfully"};
        }

        return { statusCode: 403, message: "Username already exists" };
    }

    public async loginAuth(params: UserSignInParams): Promise<PrismaResponse> {
        let user = await this.prisma.auth.findUnique({ where: { ID: params.ID } });

        if( user) {
            if(user.passwordHash == params.passwordHash) {
                return {statusCode: 200, message: "Login Successful"}; 
            }

            return {statusCode: 403, message: "Wrong Password"}; 
        }

        return {statusCode: 403, message: "Username does not exist"};   
    }
}