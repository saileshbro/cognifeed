const router = require("express").Router()
const purifierController = require("../controller/purifierController.js")
router.post("/purifier/persist", purifierController.persistPurifier)
module.exports = router
