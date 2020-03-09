const router = require("express").Router()
const tagController = require("../controller/tagController")
const auth = require("../middlewares/auth")
router.post("/tags", auth, tagController.addTags)
router.post("/tag", auth, tagController.addTag)
router.delete("/tags/:tag_id", auth, tagController.removeTag)
router.get("/tags", auth, tagController.getAllTags)
router.get("/tags/top", auth, tagController.getTopTags)

module.exports = router
