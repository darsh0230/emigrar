import User from "../models/user.js";
import { StatusCodes } from "http-status-codes";
import { BadRequestError, UnauthenticatedError } from "../utils/errors.js";

export const Register = async (req, res) => {
  const { name, email, password } = req.body;

  if (!name || !email || !password) {
    throw new BadRequestError("Please provide all Values");
  }

  const userAlreadyExists = await User.findOne({ email });
  if (userAlreadyExists) {
    throw new BadRequestError("Email already exists");
  }
  const user = await User.create({ name, email, password });
  const token = user.createJWT();
  res
    .status(StatusCodes.CREATED)
    .json({
      user: { email: user.email, name: user.name, uid: user._id },
      token,
    });
};

export const Login = async (req, res) => {
  const { email, password } = req.body;
  if (!email || !password) {
    throw new BadRequestError("Please provide all Values");
  }

  //check email
  const user = await User.findOne({ email }).select("+password");
  if (!user) {
    throw new UnauthenticatedError("Invalid Credentials");
  }

  //check password
  const isPasswordCorrect = await user.comparePassword(password);
  if (!isPasswordCorrect) {
    throw new UnauthenticatedError("Invalid Credentials");
  }

  const token = user.createJWT();
  user.password = undefined;

  res.status(StatusCodes.OK).json({ user, token });
};

export const UpdateUser = async (req, res) => {
  res.json("update user");
};
