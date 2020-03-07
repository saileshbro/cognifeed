const router = require("express").Router()
const userController = require("../controller/userController")
const auth = require("../auth/auth")
router.post("/users/signup", userController.signup)
router.post("/users/login", userController.login)
router.get("/users/profile", auth, userController.profile)
router.patch("/users/profile", auth, userController.updateProfile)
module.exports = router
