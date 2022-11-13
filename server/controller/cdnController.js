import { StatusCodes } from "http-status-codes";
// import { BadRequestError, UnAuthenticatederror } from "../utils/errors.js";
import fs from "fs";

export const getDocs = async (req, res) => {
  // ${req.params}
  console.log(process.cwd());
  const docToSend = fs.readFileSync(`/app/uploads/${req.params.id}`);
  const extension = req.params.id.split(".").at(-1);
  res.contentType(`image/${extension}`);
  res.send(docToSend);
  //   res.status(StatusCodes.OK).json({ file });
};
