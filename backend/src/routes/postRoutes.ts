import express from 'express';
import postController from '../controllers/postController';

const router = express.Router();


router.get(`/`, postController.posts);
router.get(`/events`, postController.events);
router.get(`/feed/:userID`, postController.postsFeedForUser);
router.get(`/:tag`, postController.postsByTags);
router.get(`/:userID`, postController.postsByUser);

router.post(`/create`, postController.createPost);
router.post('/register', postController.registerForEvent);

export default router;