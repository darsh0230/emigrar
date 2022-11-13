import mongoose from "mongoose";

const pathSchema = new mongoose.Schema({
  pathPolyLines: [{ latitude: { type: Number }, longitude: { type: Number } }],
  color: { type: String },
});

export default mongoose.model("Path", pathSchema);
