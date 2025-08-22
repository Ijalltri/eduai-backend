import express from 'express';
import { getBabAndProgresByPelajaran } from '../control/babcontrol.js';

const router = express.Router();

// GET /api/bab-progres?id_pelajaran=2
router.get("/bab-progres", getBabAndProgresByPelajaran);

export default router;