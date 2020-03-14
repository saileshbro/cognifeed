const fs = require("fs")
const path = require("path")
const multer = require("multer")
const storage = multer.diskStorage({
  destination: function(req, file, cb) {
    cb(null, "public/uploads/")
  },
  filename: function(req, file, cb) {
    cb(
      null,
      file.fieldname +
        Date.now() +
        "." +
        file.originalname.toLowerCase().split(".")[file.originalname.split(".").length - 1]
    )
  }
})
const upload = multer({
  storage: storage,
  fileFilter: function(req, file, callback) {
    const ext = path.extname(file.originalname.toLowerCase())
    if (ext !== ".png" && ext !== ".jpg" && ext !== ".jpeg") {
      return callback({
        error: "Only images are allowed"
      })
    }
    callback(null, true)
  }
}).single("profile")

module.exports = upload
