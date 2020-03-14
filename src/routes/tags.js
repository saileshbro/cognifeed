const router = require("express").Router()
const tagController = require("../controller/tagController")
const auth = require("../middlewares/auth")
router.post("/tags/website", tagController.addTagToWebsite)
router.post("/tags", auth, tagController.addTags)
router.post("/tags/:tag_id/add", auth, tagController.addTag)
router.delete("/tags/:tag_id/remove", auth, tagController.removeTag)
router.get("/tags", auth, tagController.getAllTags)
router.get("/tags/top", auth, tagController.getTopTags)

module.exports = router
