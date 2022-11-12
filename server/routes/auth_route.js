import express from "express";
import { Login, Register } from "../controller/auth_controller.js";

const router = express.Router();

router.post("/register", Register);
router.post("/login", Login);
// router.patch("/updateUser", authenticateUser, UpdateUser);

export default router;
