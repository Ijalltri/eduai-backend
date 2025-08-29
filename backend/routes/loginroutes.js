import express from 'express';
import { loginUser,
  signinUser,
  getUserById,
  listUsers,
  updateUser,
  updatePassword,
  deleteUser } from '../control/logincontrol.js';

const router = express.Router();

// POST /api/auth/login
router.post('/login', loginUser);
// POST /api/auth/signin
router.post('/signin', signinUser);


export default router;