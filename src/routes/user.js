const router = require("express").Router()
const userController = require("../controller/userController")
const auth = require("../middlewares/auth")
const upload = require("../middlewares/uploadImage")
router.post("/users/signup", userController.signup)
router.post("/users/login", userController.login)
router.get("/users/forgot/getcode", userController.getForgotCode)
router.post("/users/forgot/changepw", userController.setForgotPassword)
router.post("/users/reset/changepw", auth, userController.changepw)
router.get("/users/profile", auth, userController.profile)
router.patch("/users/profile/image", auth, upload, userController.uploadPicture)
router.patch("/users/profile", auth, userController.updateProfile)

module.exports = router
