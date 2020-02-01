const router = require("express").Router()
const articleController = require("../controller/articleController")
const auth = require("../auth/auth")

router.get("/articles/fav", auth, articleController.getFav)
router.post("/articles/:article_id/add_fav", auth, articleController.setFav)
router.get("/articles", articleController.articles)
router.get("/articles/:article_id", articleController.showArticle)

module.exports = router
