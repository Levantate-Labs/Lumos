import { CreatePostParams, EventRegInvitationParams, EventRegistrationParams, Post, PrismaResponse } from "../types";

export interface IPostService {

    createPost(params: CreatePostParams): Promise<PrismaResponse>;
    registerForEvent(params: EventRegistrationParams, invites?: EventRegInvitationParams[]): Promise<PrismaResponse>;
    posts(): Promise<Post[]>;
    events(): Promise<Post[]>;
    postsFeedForUser(userId: string): Promise<Post[]>;
    postsByTags(tag: string): Promise<Post[]>;
    postsByUser(userId: string): Promise<Post[]>;
    
}