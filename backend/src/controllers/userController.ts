import { PrismaClient } from '@prisma/client';
import { Request, Response, NextFunction } from 'express';

const prisma = new PrismaClient();

const getUsers = async(req: Request, res: Response, next: NextFunction) => {
    const users = await prisma.user.findMany({});
    res.send({ users: users });
}


export default {
    getUsers
};