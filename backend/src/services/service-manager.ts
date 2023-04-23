import { PrismaClient } from "@prisma/client";
import { PostService } from "./PostService";
import { UserService } from "./UserService";

const prisma = new PrismaClient();

export const userService = new UserService(prisma);
export const postService = new PostService(prisma);
