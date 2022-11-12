import express from "express";
import { createPath, getPaths } from "../controller/pathController.js";

const router = express.Router();

router.post("/createPath", createPath);
router.get("/getPaths", getPaths);

export default router;
