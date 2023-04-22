import express, { Express, Request, Response, NextFunction } from 'express';
import http from 'http';
import { config } from './config'

import userRoutes from './routes/userRoutes';
import postRoutes from './routes/postRoutes';

const router: Express = express();


const StartServer = async() => {

    router.use(express.urlencoded({ extended: true }));
    router.use(express.json());

    /** API-RULE-MODIFIERS */
    router.use((req, res, next) => {
        res.header('Access-Control-Allow-Origin', '*');
        res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization');

        if (req.method == 'OPTIONS') {
            res.header('Access-Control-Allow-Methods', 'PUT, POST, PATCH, DELETE, GET');
            return res.status(200).json({});
        }

        next();
    });

    // Routes to use
    router.use(`/user`, userRoutes);
    router.use(`/post`, postRoutes);

    /** Healthcheck */
    router.get('/healthcheck', (req, res, next) => res.status(200).json({ message: 'Still Alive!' }));
    http.createServer(router).listen(config.server.port, () => console.log(`Server is running on port ${config.server.port}`));
}

StartServer();