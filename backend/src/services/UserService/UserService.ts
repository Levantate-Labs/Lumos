import { Prisma, PrismaClient } from "@prisma/client";
import { IUserService } from "./interfaces";
import { UserSignInParams, UserRegisterParams, PrismaResponse, FollowParams, User, UserResponse } from "./types";

export class UserService implements IUserService {

    prisma: PrismaClient;


    constructor(prisma: PrismaClient) {
        this.prisma = prisma;
    }

    /** AUTH-METHODS */

    public async registerUser(params: UserRegisterParams): Promise<PrismaResponse> {
        let user = await this.prisma.user.findUnique({ where: { ID: params.ID } });

        if(!user) {
            await this.prisma.user.create({ data: params });
            return {statusCode: 200, message: "User Registered Successfully"};
        }

        return { statusCode: 403, message: "Username already exists" };
    }

    public async loginUser(params: UserSignInParams): Promise<UserResponse> {
        let user = await this.prisma.user.findUnique({ 
            where: { ID: params.ID },
            include: {
                posts: true,
                followers: true,
                followings: true,
                eventRegistrations: true,
                eventRegInvites: true
            } 
        });

        if( user) {
            if(user.passwordHash == params.passwordHash) {
                return { user, response: { statusCode: 200, message: "Login Successful" } };
            }

            return { response: { statusCode: 403, message: "Wrong Password" } };
        }

        return { response: { statusCode: 403, message: "Wrong Password" } }; 
    }

    /** USER-METHODS */
    public async follow(params: FollowParams): Promise<PrismaResponse> {

        let follow = await this.prisma.follows.findUnique({ where: { ID: params.ID } })

        if(follow) {
            return { statusCode: 403, message: "Already Following" }
        }

        let follower = await this.prisma.user.findUnique({ where: { ID: params.followerId } });
        let following = await this.prisma.user.findUnique({ where: { ID: params.followingId } });

        if( follower && following ) {
            await this.prisma.follows.create({
                data: params
            })
            return { statusCode: 200, message: "User Followed " }
        }

        return { statusCode: 403, message: "User does not exist" };
    }
}