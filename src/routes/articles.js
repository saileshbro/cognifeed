const router = require("express").Router()
const articleController = require("../controller/articleController")
const auth = require("../middlewares/auth")

router.get("/articles/fav", auth, articleController.getFav)
router.get("/articles", auth, articleController.articles)
router.post("/articles/:article_id/add_fav", auth, articleController.setFav)
router.delete("/articles/:article_id/remove_fav", auth, articleController.removeFav)
router.post("/articles", articleController.addArticle)
router.get("/articles/:article_id", articleController.showArticle)

module.exports = router
