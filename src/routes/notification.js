const router = require("express").Router()
const auth = require("../middlewares/auth")
const notificationController = require("../controller/notificationController")
router.post("/notification/notify", notificationController.notify)
router.get("/notification/status", auth, notificationController.getStatus)
router.post(
  "/notification/toggle",
  auth,
  notificationController.toggleNotification
)
router.post("/notification/set", auth, notificationController.setTime)

module.exports = router
