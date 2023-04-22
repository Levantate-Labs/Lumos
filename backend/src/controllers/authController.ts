import { PrismaClient } from '@prisma/client';
import { Request, Response, NextFunction } from 'express'


const prisma = new PrismaClient();

const register = async(req: Request, res: Response, next: NextFunction) => {
    const { username, password, privateKeyHash } = req.body;
    try {

        await prisma.auth.create({ 
            data: {
                ID: username,
                passwordHash: password,
                privKeyHash: privateKeyHash
            }
        });
        res.send({ message: "User registered" });

    } catch(error: any) {
        res.send({ error: "Username already exists" });
    }
}

const login = async(req: Request, res: Response, next: NextFunction) => {
    const { username, password } = req.body;

    let auth = await prisma.auth.findUnique({
        where: {
            ID: username
        }
    });

    if(auth) {
        if(auth.passwordHash == password) {
            res.status(200).send({ message: "Login successful" });
        }

        else {
            res.status(403).send({ message: "Wrong Password" });
        }
    } else {
        res.status(403).send({ message: "Username Not Found" });
    }
}

export default {
    register
    ,login
}