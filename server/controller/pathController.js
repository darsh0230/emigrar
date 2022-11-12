import { StatusCodes } from "http-status-codes";
import pathModel from "../models/pathModel.js";
import { BadRequestError, UnauthenticatedError } from "../utils/errors.js";

export const createPath = async (req, res) => {
  const { pathPolyLines } = req.body;

  const path = pathModel.create({
    pathPolyLines,
  });

  res.StatusCodes(StatusCodes.CREATED).json({ result: path });
};

export const getPaths = async (req, res) => {
  const { currLat, currLong } = req.body;

  const paths = pathModel.find();

  var resultPaths = [];

  for (var path in paths) {
    console.log(path);
  }

  res.StatusCodes(StatusCodes.OK).json({ result: resultPaths });
};
