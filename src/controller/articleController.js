const { pool, tables } = require("../database/database")
const { ErrorHandler } = require("../helpers/error_handler")
module.exports.articles = async (req, res, next) => {
  try {
    const articles = await pool.query(
      `SELECT article_id,title,description,image_url,link_url,view_count,STRCMP(${tables.favourites}.user_id,?)+1 AS is_fav FROM ${tables.articles} LEFT JOIN ${tables.favourites} USING(article_id) WHERE article_id NOT IN (SELECT article_id FROM ${tables.hidden} WHERE user_id=?)`,
      [req.user.user_id, req.user.user_id]
    )

    const result2 = await pool.query(
      `select * from ${tables.articles} left join ${tables.articleTags}  using(article_id) left join ${tables.tags} using(tag_id) left join ${tables.user_tags} using(tag_id)`,
      [req.user.user_id]
    )
    for (let i = 0; i < result2.length; i++) {
      for (let j = 0; j < articles.length; j++) {
        if (result2[i].article_id === articles[j].article_id) {
          articles[j].tag_name = result2[i].tag_name
          articles[j].tag_id = result2[i].tag_id
          articles[j].is_selected = result2[i].user_id == req.user.user_id
        }
      }
    }
    articles.forEach(article => {
      article.is_fav = article.is_fav == 1
    })
    if (articles.length == 0) {
      throw new ErrorHandler(404, "articles not found")
    }
    return res.json({
      articles
    })
  } catch (error) {
    next(error)
  }
}

module.exports.showArticle = async (req, res, next) => {
  try {
    const article_id = req.params.article_id
    const article = await pool.query(`SELECT * FROM ${tables.articles} where article_id=?`, [
      article_id
    ])
    if (article.length == 0) {
      throw new ErrorHandler(404, "article not found")
    } else {
      await pool.query(`UPDATE ${tables.articles} SET view_count=view_count+1 WHERE article_id=?`, [
        article_id
      ])
    }
    article[0].view_count += 1
    return res.json({
      article: article[0]
    })
  } catch (error) {
    next(error)
  }
}

module.exports.getFav = async (req, res, next) => {
  try {
    const articles = await pool.query(
      `SELECT article_id,title,description,image_url,link_url,view_count FROM ${tables.articles} join ${tables.favourites} using(article_id) WHERE ${tables.favourites}.user_id=? AND article_id NOT IN (SELECT article_id FROM ${tables.hidden} WHERE user_id=?)`,
      [req.user.user_id, req.user.user_id]
    )

    const result2 = await pool.query(
      `select * from ${tables.articles} left join ${tables.articleTags}  using(article_id) left join ${tables.tags} using(tag_id) left join ${tables.user_tags} using(tag_id)`,
      [req.user.user_id]
    )
    for (let i = 0; i < result2.length; i++) {
      for (let j = 0; j < articles.length; j++) {
        if (result2[i].article_id === articles[j].article_id) {
          articles[j].tag_name = result2[i].tag_name
          articles[j].tag_id = result2[i].tag_id
          articles[j].is_selected = result2[i].user_id == req.user.user_id
        }
      }
    }
    if (articles.length == 0) {
      throw new ErrorHandler(404, "articles not found")
    }
    articles.forEach(article => {
      article.is_fav = true
    })
    return res.json({
      articles
    })
  } catch (error) {
    next(error)
  }
}
module.exports.getHidden = async (req, res, next) => {
  try {
    const articles = await pool.query(
      `SELECT article_id,title,description,image_url,link_url,view_count,STRCMP(${tables.favourites}.user_id,?)+1 AS is_fav FROM ${tables.articles} LEFT JOIN ${tables.favourites} USING(article_id) WHERE article_id IN (SELECT article_id FROM ${tables.hidden} WHERE user_id=?)`,
      [req.user.user_id, req.user.user_id]
    )

    const result2 = await pool.query(
      `select * from ${tables.articles} left join ${tables.articleTags}  using(article_id) left join ${tables.tags} using(tag_id) left join ${tables.user_tags} using(tag_id)`,
      [req.user.user_id]
    )
    for (let i = 0; i < result2.length; i++) {
      for (let j = 0; j < articles.length; j++) {
        if (result2[i].article_id === articles[j].article_id) {
          articles[j].tag_name = result2[i].tag_name
          articles[j].tag_id = result2[i].tag_id
          articles[j].is_selected = result2[i].user_id == req.user.user_id
        }
      }
    }
    articles.forEach(article => {
      article.is_fav = article.is_fav == 1
      article.is_hidden = true
    })
    if (articles.length == 0) {
      throw new ErrorHandler(404, "articles not found")
    }
    return res.json({
      articles
    })
  } catch (error) {
    next(error)
  }
}
module.exports.setFav = async (req, res, next) => {
  try {
    const user_id = req.user.user_id
    const article_id = req.params.article_id
    await pool.query(`INSERT INTO ${tables.favourites} SET user_id=?,article_id=?`, [
      user_id,
      article_id
    ])
    return res.json({
      message: "Added to favourite"
    })
  } catch (error) {
    next(error)
  }
}

module.exports.removeFav = async (req, res, next) => {
  try {
    const user_id = req.user.user_id
    const article_id = req.params.article_id
    await pool.query(`DELETE FROM ${tables.favourites} WHERE user_id=? and article_id=?`, [
      user_id,
      article_id
    ])
    return res.json({
      message: "Removed from favourite"
    })
  } catch (error) {
    next(error)
  }
}
module.exports.hideArticle = async (req, res, next) => {
  try {
    const user_id = req.user.user_id
    const article_id = req.params.article_id
    await pool.query(`INSERT INTO ${tables.hidden} SET user_id=?,article_id=?`, [
      user_id,
      article_id
    ])
    return res.json({
      message: "Article hidden"
    })
  } catch (error) {
    next(error)
  }
}
module.exports.showArticle = async (req, res, next) => {
  try {
    const user_id = req.user.user_id
    const article_id = req.params.article_id
    await pool.query(`DELETE FROM ${tables.hidden} WHERE user_id=? AND article_id=?`, [
      user_id,
      article_id
    ])
    return res.json({
      message: "Removed from hidden"
    })
  } catch (error) {
    next(error)
  }
}

module.exports.addArticle = async (req, res, next) => {
  try {
    const { title, description, image_url, link_url } = req.body
    const article = await pool.query(`SELECT article_id FROM ${tables.articles} WHERE link_url=?`, [
      link_url
    ])
    if (article.length == 0) {
      await pool.query(
        `INSERT INTO ${tables.articles} SET title=?,description=?,image_url=?,link_url=?`,
        [title, description, image_url, link_url]
      )
    } else {
      throw new ErrorHandler(400, "Article already exists")
    }

    return res.json({
      article: {
        title,
        description,
        image_url,
        link_url
      }
    })
  } catch (error) {
    next(error)
  }
}
