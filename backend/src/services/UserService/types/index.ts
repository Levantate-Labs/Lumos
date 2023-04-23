export type UserRegisterParams = {
    ID: string;
    name: string | null;
    passwordHash: string;
    pubAddress: string;
    privKeyHash: string;
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