
const express = require("express");
const router = express.Router();

const postCtrl = require("../controllers/post");

const auth = require("../middleware/auth"); 
const multer = require("../middleware/multer-config"); 

router.get("/", auth, postCtrl.getAllPosts);
router.get("/:id", auth, postCtrl.getOnePost);
router.post("/", auth, multer, postCtrl.createPost);
router.delete("/:id", auth, postCtrl.deletePost);
router.post("/:id/comment", auth, postCtrl.createComment);
router.post("/:id/reaction", auth, postCtrl.reactPost);

module.exports = router;