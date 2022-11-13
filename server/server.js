import express from "express";
import bodyParser from "body-parser";
import mongoose from "mongoose";
import cors from "cors";
import dotenv from "dotenv";
dotenv.config();
import "express-async-errors";
import morgan from "morgan";
import fs from "fs";

// route imports
import cdnRoutes from "./routes/cdnRoutes.js";
import authRouter from "./routes/auth_route.js";
import postRoutes from "./routes/postRoutes.js";
import pathRoutes from "./routes/pathRoutes.js";

//middlewares
import notFoundMiddleware from "./middlewares/not_found.js";
import errorHandlerMiddleware from "./middlewares/error_handler.js";

const BASE_URL_PATH = "/api/v1/";
const CONNECTION_URL = process.env.EXPAPP_MONGO_URL;
const PORT = process.env.EXPAPP_PORT || 5000;

if (!fs.existsSync("/uploads")) {
  fs.mkdirSync("/uploads");
}

const app = express();

if (process.env.NODE_ENV !== "production") {
  app.use(morgan("dev"));
}

app.use(bodyParser.json({ limit: "30mb", extended: true }));
app.use(bodyParser.urlencoded({ limit: "30mb", extended: true }));
app.use(cors());

app.use(`${BASE_URL_PATH}auth`, authRouter);
app.use(`${BASE_URL_PATH}post`, postRoutes);
app.use(`${BASE_URL_PATH}path`, pathRoutes);

app.use("/cdn", cdnRoutes);

app.use(notFoundMiddleware);
app.use(errorHandlerMiddleware);

mongoose
  .connect(CONNECTION_URL, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() =>
    app.listen(PORT, () => console.log(`Server running on port ${PORT}`))
  )
  .catch((error) => console.log(error.message));
