const router = require("express").Router()
const tagController = require("../controller/tagController")

router.post("/tags", tagController.addTag)
router.delete("/tags/:tag_id", tagController.removeTag)
router.get("/tags", tagController.getAllTags)

module.exports = router
