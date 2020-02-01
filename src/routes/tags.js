const router = require("express").Router()
const tagController = require("../controller/tagController")

router.post("/tags", tagController.addTag)

module.exports = router
