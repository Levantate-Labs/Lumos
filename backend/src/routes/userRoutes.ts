import express from 'express'
import userController from '../controllers/userController';

const router = express.Router();


router.get(`/`, userController.getUsers);
router.get(`/:id`, () => {});

router.post(`/create`, () => {});

export default router;