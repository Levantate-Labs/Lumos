import { POST_TYPE } from "@prisma/client";

export type CreatePostParams = {
    ID: string;
    name?: string;
    dateOfEvent?: string;
    location?: string;
    tags: string[];
    content: string;
    postType: POST_TYPE;
    createdById: string;
}

export type PrismaResponse = {
    statusCode: number;
    message: string;
}

export type Post = {
    ID: string;
    content: string;
    postType: POST_TYPE;
    tags: string[];
    createdById: string; 
}