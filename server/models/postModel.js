import mongoose from "mongoose";

const PostSchema = new mongoose.Schema(
  {
    uid: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
    imgUrl: { type: String },
    caption: { type: String },
    location: { latitude: { type: Number }, longitude: { type: Number } },
  },
  { timestamps: true }
);

export default mongoose.model("Post", PostSchema);
