import express from 'express';
import userController from '../controllers/userController';

const router = express.Router();


router.post(`/create`, userController.register);
router.post(`/login`, userController.login);
router.post(`/follow`, userController.follow);

export default router;