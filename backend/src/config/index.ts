import dotenv from 'dotenv';
dotenv.config();



const SERVER_PORT = process.env.PORT || 3000;


export const config = {
    server: {
        port: SERVER_PORT
    }
};