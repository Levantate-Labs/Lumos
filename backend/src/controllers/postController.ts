import { PrismaClient } from '@prisma/client';
import { Request, Response, NextFunction } from 'express'
import { postService } from '../services/service-manager';
import { CreatePostParams, EventRegistrationParams } from '../services/PostService/types';


const createPost = async(req: Request, res: Response, next: NextFunction) => {
    try {
        const params: CreatePostParams = req.body;

        let serviceResponse = await postService.createPost(params);
        res.status(serviceResponse.statusCode).send({ message: serviceResponse.message });

    } catch(error: any) {
        res.status(500).send({ error: "Internal Server Error" });
    }
}

const registerForEvent = async(req: Request, res: Response, next: NextFunction) => {
    try {
        const params: EventRegistrationParams = req.body;

        let serviceResponse = await postService.registerForEvent(params);
        res.status(serviceResponse.statusCode).send({ message: serviceResponse.message });

    } catch(error: any) {
        res.status(500).send({ error: "Internal Server Error" });
    }
}

const posts = async(req: Request, res: Response, next: NextFunction) => {
    try {

        let serviceResponse = await postService.posts();
        res.status(200).send({ posts: serviceResponse });

    } catch(error: any) {
        res.status(500).send({ error: "Internal Server Error" });
    }
}

const events = async(req: Request, res: Response, next: NextFunction) => {
    try {

        let serviceResponse = await postService.events();
        res.status(200).send({ events: serviceResponse });

    } catch(error: any) {
        res.status(500).send({ error: "Internal Server Error" });
    }
}

const postsFeedForUser = async(req: Request, res: Response, next: NextFunction) => {
    try {
        const { userID } = req.params;

        let serviceResponse = await postService.postsFeedForUser(userID);
        res.status(200).send({ feed: serviceResponse });

    } catch(error: any) {
        res.status(500).send({ error: "Internal Server Error" });
    }
}

const postsByTags = async(req: Request, res: Response, next: NextFunction) => {
    try {
        const { tag } = req.params;

        let serviceResponse = await postService.postsByTags(tag);
        res.status(200).send({ feed: serviceResponse });

    } catch(error: any) {
        res.status(500).send({ error: "Internal Server Error" });
    }
}

const postsByUser = async(req: Request, res: Response, next: NextFunction) => {
    try {
        const { userID } = req.params;

        let serviceResponse = await postService.postsByTags(userID);
        res.status(200).send({ posts: serviceResponse });

    } catch(error: any) {
        res.status(500).send({ error: "Internal Server Error" });
    }
}

export default {
    createPost,
    registerForEvent,
    posts,
    events,
    postsFeedForUser,
    postsByTags,
    postsByUser
}

