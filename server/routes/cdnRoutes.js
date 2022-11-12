import express from "express";
import { getDocs } from "../controller/cdnController.js";

const router = express.Router();

router.get("/:id", getDocs);

export default router;
