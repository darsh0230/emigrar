import { StatusCodes } from "http-status-codes";
import postModel from "../models/postModel.js";
import { BadRequestError, UnauthenticatedError } from "../utils/errors.js";

export const createPost = async (req, res) => {
  const { uid, caption, location } = req.body;

  const post = await postModel.create({
    uid,
    imgUrl: `/cdn/${req.file.filename}`,
    caption,
    location: JSON.parse(location.toString()),
  });

  res.status(StatusCodes.CREATED).json({
    result: post,
  });
};

export const getPosts = async (req, res) => {
  const posts = await postModel.find();
  res.status(StatusCodes.OK).json({ result: posts });
};
