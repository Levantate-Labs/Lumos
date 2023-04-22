import { PrismaClient } from "@prisma/client";
import { PostService } from "./PostService/PostService";
import { UserService } from "./UserService/UserService";


const prisma = new PrismaClient();

export const userService = new UserService(prisma);
export const postService = new PostService(prisma);
