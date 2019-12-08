const router = require("express").Router()
const spiderController = require("../controller/spiderController")
router.post("/spider/persist", spiderController.persistHtml)
module.exports = router
