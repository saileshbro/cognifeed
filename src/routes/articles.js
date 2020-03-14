const router = require("express").Router()
const articleController = require("../controller/articleController")
const auth = require("../middlewares/auth")

router.get("/articles/fav", auth, articleController.getFav)
router.get("/articles/all", auth, articleController.allArticles)
router.get("/articles/hidden", auth, articleController.getHidden)
router.get("/articles", auth, articleController.articles)
router.post("/articles/:article_id/add_fav", auth, articleController.setFav)
router.delete(
  "/articles/:article_id/remove_fav",
  auth,
  articleController.removeFav
)
router.post("/articles/:article_id/hide", auth, articleController.hideArticle)
router.post("/articles/:article_id/show", auth, articleController.showArticle)
router.post("/articles", articleController.addArticle)
router.get(
  "/articles/:article_id/increment",
  auth,
  articleController.incrementView
)

module.exports = router
