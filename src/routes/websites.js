const router = require("express").Router()
const websitesController = require("../controller/websitesController")
router.get("/websites", websitesController.getWebsites)
router.post("/websites", websitesController.addWebsite)

module.exports = router
