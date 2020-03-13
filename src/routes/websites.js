const router = require("express").Router()
const websitesController = require("../controller/websitesController")
router.get("/websites", websitesController.getWebsites)

module.exports = router
