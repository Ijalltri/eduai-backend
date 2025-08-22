import express from 'express';
import { loginUser, signinUser } from '../control/logincontrol.js';

const router = express.Router();

// POST /api/auth/login
router.post('/login', loginUser);
// POST /api/auth/signin
router.post('/signin', signinUser);


export default router;