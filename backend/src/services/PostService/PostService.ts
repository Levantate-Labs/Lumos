import { POST_TYPE, PrismaClient } from "@prisma/client";
import { CreatePostParams, Post, PrismaResponse } from "./types";


export class PostService {


    prisma: PrismaClient;

    constructor(prisma: PrismaClient) {
        this.prisma = prisma;
    }

    public async createPost(params: CreatePostParams): Promise<PrismaResponse> {
        let user = await this.prisma.user.findUnique({ where: { ID: params.createdById } });
        let post = await this.prisma.post.findUnique({ where: { ID: params.ID } });
        
        if(post) {
            return { statusCode: 403, message: "Post already exists" };
        }

        if(!user) {
            return { statusCode: 403, message: "User does not exist" };
        }

        post = await this.prisma.post.create({ data: params });
        return { statusCode: 200, message: "Post Created Successfully" };
    }

    public async posts(): Promise<Post[]> {
        return await this.prisma.post.findMany({ where: { postType: POST_TYPE.CONTENT } });
    }

    public async events(): Promise<Post[]> {
        return await this.prisma.post.findMany({ where: { postType: POST_TYPE.EVENT } });
    }

    public async postsFeedForUser(userId: string): Promise<Post[]> {
        let followings = await this.prisma.follows.findMany({ where: { followerId: userId }, select: { followingId: true } });
        let followingIds: string[] = followings.map(Obj => Obj.followingId);
        let posts = await this.prisma.post.findMany({ 
            where: { createdById: { in: followingIds } },
            orderBy: { createdAt: 'desc' }
        });

        return posts;
    }

    public async postsByTags(tag: string): Promise<Post[]> {
        let posts = await this.prisma.post.findMany({
            where: { tags: { has: tag } },
            orderBy: { createdAt: 'desc' }
        })

        return posts;
    }

    public async postsByUser(userId: string): Promise<Post[]> {
        return await this.prisma.post.findMany({
            where: { createdById: userId },
            orderBy: { createdAt: 'desc' }
        });
    }
}