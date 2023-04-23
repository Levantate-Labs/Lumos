import { EventRegInvitationParams, EventRegistrationParams, Post } from "../../PostService";

export type UserRegisterParams = {
    ID: string;
    name: string | null;
    passwordHash: string;
    pubAddress: string;
    privKeyHash: string;
}

export type User = {
    ID: string;
    name: string | null;
    passwordHash: string;
    privKeyHash: string;
    pubAddress: string;
    posts: Post[];
    followers: FollowParams[];
    followings: FollowParams[];
    eventRegistrations: EventRegistrationParams[];
    eventRegInvites: EventRegInvitationParams[];
}

export type UserSignInParams = {
    ID: string;
    passwordHash: string;
}

export type FollowParams = {
    ID: string;
    followerId: string;
    followingId: string;
}

export type PrismaResponse = {
    statusCode: number;
    message: string;
}

export type UserResponse = {
    user?: User,
    response: PrismaResponse
}