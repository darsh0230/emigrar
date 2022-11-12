import express from "express";
import multer from "multer";
import crypto from "crypto";
import { createPost, getPosts } from "../controller/postController.js";

const router = express.Router();

const storage = multer.diskStorage({
  destination: (req, file, callBack) => {
    callBack(null, "uploads");
  },
  filename: (req, file, callBack) => {
    callBack(
      null,
      `${crypto.randomBytes(8).toString("hex")}_${file.originalname}`
    );
  },
});
let upload = multer({ storage: storage });

router.post("/createPost", upload.single("file"), createPost);
router.get("/getPost", getPosts);
// router.patch("/updateUser", authenticateUser, UpdateUser);

export default router;
