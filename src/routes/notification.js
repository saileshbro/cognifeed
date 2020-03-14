const router = require("express").Router()
const notificationController = require("../controller/notificationController")
router.post("/notify", notificationController.norify)

module.exports = router
