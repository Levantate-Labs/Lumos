export type UserRegisterParams = {
    ID: string;
    passwordHash: string;
    privKeyHash: string;
}

export type UserSignInParams = {
    ID: string;
    passwordHash: string;
}

export type PrismaResponse = {
    statusCode: number;
    message: string;
}