import { StatusCodes } from "http-status-codes";
import pathModel from "../models/pathModel.js";
import { BadRequestError, UnauthenticatedError } from "../utils/errors.js";

export const createPath = async (req, res) => {
  const { pathPolyLines, color } = req.body;

  const path = await pathModel.create({
    pathPolyLines,
    color,
  });

  res.status(StatusCodes.CREATED).json({ result: path });
};

export const getPaths = async (req, res) => {
  // const { currLat, currLong } = req.body;

  const paths = await pathModel.find();
  // console.log(paths);

  // var resultPaths = paths;

  // for (var path in paths) {
  //   console.log(path);
  // }

  res.status(StatusCodes.OK).json({ result: paths });
};
