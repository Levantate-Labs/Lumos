import { PrismaClient } from '@prisma/client';
import { Request, Response, NextFunction } from 'express'
import { userService } from '../services/service-manager';
import { FollowParams, UserRegisterParams, UserSignInParams } from '../services/UserService/types';


const prisma = new PrismaClient();

const register = async(req: Request, res: Response, next: NextFunction) => {
    try {
        const params: UserRegisterParams = req.body;

        let serviceResponse = await userService.registerUser(params);
        res.status(serviceResponse.statusCode).send({ message: serviceResponse.message });

    } catch(error: any) {
        res.status(500).send({ error: error.message });
    }
}

const login = async(req: Request, res: Response, next: NextFunction) => {

    try {
        const params: UserSignInParams = req.body;

        let serviceResponse = await userService.loginUser(params);
        res.status(serviceResponse.response.statusCode).send(serviceResponse.user ? serviceResponse.user : serviceResponse.response.statusCode);
    
    } catch(error: any) {
        res.status(500).send({ error: error.message });
    }

}

const follow =async (req: Request, res: Response, next: NextFunction) => {

    try {
        const params: FollowParams = req.body;

        let serviceResponse = await userService.follow(params);
        res.status(serviceResponse.statusCode).send({ message: serviceResponse.message });        
    } catch(error: any) {
        res.status(500).send({ error: "Internal Server Error" });
    } 

}


export default {
    register,
    login,
    follow
}