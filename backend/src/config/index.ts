import dotenv from 'dotenv';
dotenv.config();



const SERVER_PORT = process.env.PORT || 8080;


export const config = {
    server: {
        port: SERVER_PORT
    }
};