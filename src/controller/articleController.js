const { pool, tables } = require("../database/database")
const { ErrorHandler } = require("../helpers/error_handler")
const url = require("url")
module.exports.allArticles = async (req, res, next) => {
  const { searchby, query } = req.query
  let articles

  try {
    if (!searchby) {
      articles = await pool.query(
        `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id)  JOIN ${tables.tags} using(tag_id) LEFT JOIN ${tables.user_tags} USING(tag_id)`
      )
    } else {
      if (searchby == "title") {
        articles = await pool.query(
          `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id) JOIN ${tables.tags} using(tag_id) LEFT JOIN ${tables.user_tags} USING(tag_id) WHERE title LIKE ?`,
          [`%${query}%`]
        )
      } else if (searchby == "website") {
        articles = await pool.query(
          `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id) JOIN ${tables.tags} using(tag_id) LEFT JOIN ${tables.user_tags} USING(tag_id) WHERE website LIKE ?`,
          [`%${query}%`]
        )
      } else if (searchby == "tag") {
        articles = await pool.query(
          `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id)  JOIN ${tables.tags} using(tag_id) LEFT JOIN ${tables.user_tags} USING(tag_id) WHERE tag_name LIKE ?`,
          [`%${query}%`]
        )
      }
    }

    articles.forEach(article => {
      article.is_fav = false
      article.is_selected = article.user_id == req.user.user_id
      article.all = true
      if (article.tag_name)
        article.tag_name = article.tag_name
          .split(" ")
          .map(s => s.charAt(0).toUpperCase() + s.substring(1))
          .join(" ")
      if (article.image_url.includes("imagenotfound.png")) {
        article.image_url =
          req.protocol + "://" + req.get("host") + "/" + article.image_url
      }
      if (
        !article.image_url.includes("http://") &&
        !article.image_url.includes("https://")
      ) {
        article.image_url = "http://" + article.image_url
      }
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
module.exports.articles = async (req, res, next) => {
  const { searchby, query } = req.query
  let articles

  try {
    if (!searchby) {
      articles = await pool.query(
        `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id)  JOIN ${tables.tags} using(tag_id) join ${tables.user_tags} using(tag_id) WHERE user_id=? AND article_id NOT IN (SELECT article_id FROM ${tables.favourites}) AND article_id NOT IN (SELECT article_id FROM ${tables.hidden})`,
        [req.user.user_id]
      )
    } else {
      if (searchby == "title") {
        articles = await pool.query(
          `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id)  JOIN ${tables.tags} using(tag_id) join ${tables.user_tags} using(tag_id) WHERE user_id=? AND article_id NOT IN (SELECT article_id FROM ${tables.favourites}) AND article_id NOT IN (SELECT article_id FROM ${tables.hidden}) AND title LIKE ?`,
          [req.user.user_id, `%${query}%`]
        )
      } else if (searchby == "website") {
        articles = await pool.query(
          `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id)  JOIN ${tables.tags} using(tag_id) join ${tables.user_tags} using(tag_id) WHERE user_id=? AND article_id NOT IN (SELECT article_id FROM ${tables.favourites}) AND article_id NOT IN (SELECT article_id FROM ${tables.hidden}) AND website LIKE ?`,
          [req.user.user_id, `%${query}%`]
        )
      } else if (searchby == "tag") {
        articles = await pool.query(
          `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id)  JOIN ${tables.tags} using(tag_id) join ${tables.user_tags} using(tag_id) WHERE user_id=? AND article_id NOT IN (SELECT article_id FROM ${tables.favourites}) AND article_id NOT IN (SELECT article_id FROM ${tables.hidden}) AND tag LIKE ?`,
          [req.user.user_id, `%${query}%`]
        )
      }
    }

    articles.forEach(article => {
      article.is_fav = false
      article.is_selected = true
      if (article.tag_name)
        article.tag_name = article.tag_name
          .split(" ")
          .map(s => s.charAt(0).toUpperCase() + s.substring(1))
          .join(" ")
      if (article.image_url.includes("imagenotfound.png")) {
        article.image_url =
          req.protocol + "://" + req.get("host") + "/" + article.image_url
      }
      if (
        !article.image_url.includes("http://") &&
        !article.image_url.includes("https://")
      ) {
        article.image_url = "http://" + article.image_url
      }
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
    const article = await pool.query(
      `SELECT * FROM ${tables.articles} where article_id=?`,
      [article_id]
    )
    if (article.length == 0) {
      throw new ErrorHandler(404, "article not found")
    } else {
      await pool.query(
        `UPDATE ${tables.articles} SET view_count=view_count+1 WHERE article_id=?`,
        [article_id]
      )
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
  const { searchby, query } = req.query
  let articles
  try {
    if (!searchby) {
      articles = await pool.query(
        `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id)  JOIN ${tables.tags} using(tag_id) join ${tables.user_tags} using(tag_id) WHERE user_id=? AND article_id IN (SELECT article_id FROM ${tables.favourites}) AND article_id NOT IN (SELECT article_id FROM ${tables.hidden})`,
        [req.user.user_id]
      )
    } else {
      if (searchby == "title") {
        articles = await pool.query(
          `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id)  JOIN ${tables.tags} using(tag_id) join ${tables.user_tags} using(tag_id) WHERE user_id=? AND article_id IN (SELECT article_id FROM ${tables.favourites}) AND article_id NOT IN (SELECT article_id FROM ${tables.hidden}) AND title LIKE ?`,
          [req.user.user_id, `%${query}%`]
        )
      } else if (searchby == "website") {
        articles = await pool.query(
          `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id)  JOIN ${tables.tags} using(tag_id) join ${tables.user_tags} using(tag_id) WHERE user_id=? AND article_id IN (SELECT article_id FROM ${tables.favourites}) AND article_id NOT IN (SELECT article_id FROM ${tables.hidden}) AND website LIKE ?`,
          [req.user.user_id, `%${query}%`]
        )
      } else if (searchby == "tag") {
        articles = await pool.query(
          `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id)  JOIN ${tables.tags} using(tag_id) join ${tables.user_tags} using(tag_id) WHERE user_id=? AND article_id IN (SELECT article_id FROM ${tables.favourites}) AND article_id NOT IN (SELECT article_id FROM ${tables.hidden}) AND tag_name LIKE ?`,
          [req.user.user_id, `%${query}%`]
        )
      }
    }
    if (articles.length == 0) {
      throw new ErrorHandler(404, "articles not found")
    }
    articles.forEach(article => {
      article.is_fav = true
      article.is_selected = true
      if (article.tag_name)
        article.tag_name = article.tag_name
          .split(" ")
          .map(s => s.charAt(0).toUpperCase() + s.substring(1))
          .join(" ")
      if (article.image_url.includes("imagenotfound.png")) {
        article.image_url =
          req.protocol + "://" + req.get("host") + "/" + article.image_url
      }
      if (
        !article.image_url.includes("http://") &&
        !article.image_url.includes("https://")
      ) {
        article.image_url = "http://" + article.image_url
      }
    })
    return res.json({
      articles
    })
  } catch (error) {
    next(error)
  }
}
module.exports.getHidden = async (req, res, next) => {
  const { searchby, query } = req.query
  let articles
  try {
    if (!searchby) {
      articles = await pool.query(
        `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id)  JOIN ${tables.tags} using(tag_id) join ${tables.user_tags} using(tag_id) WHERE user_id=? AND article_id NOT IN (SELECT article_id FROM ${tables.favourites}) AND article_id  IN (SELECT article_id FROM ${tables.hidden})`,
        [req.user.user_id]
      )
    } else {
      if (searchby == "title") {
        articles = await pool.query(
          `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id)  JOIN ${tables.tags} using(tag_id) join ${tables.user_tags} using(tag_id) WHERE user_id=? AND article_id NOT IN (SELECT article_id FROM ${tables.favourites}) AND article_id  IN (SELECT article_id FROM ${tables.hidden}) AND title LIKE ?`,
          [req.user.user_id, `%${query}%`]
        )
      } else if (searchby == "website") {
        articles = await pool.query(
          `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id)  JOIN ${tables.tags} using(tag_id) join ${tables.user_tags} using(tag_id) WHERE user_id=? AND article_id NOT IN (SELECT article_id FROM ${tables.favourites}) AND article_id  IN (SELECT article_id FROM ${tables.hidden}) AND website LIKE ?`,
          [req.user.user_id, `%${query}%`]
        )
      } else if (searchby == "tag") {
        articles = await pool.query(
          `SELECT user_id,article_id,tag_id,tag_name,title,website,description,image_url,link_url,view_count FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id)  JOIN ${tables.tags} using(tag_id) join ${tables.user_tags} using(tag_id) WHERE user_id=? AND article_id NOT IN (SELECT article_id FROM ${tables.favourites}) AND article_id  IN (SELECT article_id FROM ${tables.hidden}) AND tag_name LIKE ?`,
          [req.user.user_id, `%${query}%`]
        )
      }
    }
    articles.forEach(article => {
      article.is_fav = false
      article.is_hidden = true
      article.is_selected = true

      if (article.tag_name)
        article.tag_name = article.tag_name
          .split(" ")
          .map(s => s.charAt(0).toUpperCase() + s.substring(1))
          .join(" ")
      if (article.image_url.includes("imagenotfound.png")) {
        article.image_url =
          req.protocol + "://" + req.get("host") + "/" + article.image_url
      }
      if (
        !article.image_url.includes("http://") &&
        !article.image_url.includes("https://")
      ) {
        article.image_url = "http://" + article.image_url
      }
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
    await pool.query(
      `INSERT INTO ${tables.favourites} SET user_id=?,article_id=?`,
      [user_id, article_id]
    )
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
    await pool.query(
      `DELETE FROM ${tables.favourites} WHERE user_id=? and article_id=?`,
      [user_id, article_id]
    )
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
    await pool.query(
      `INSERT INTO ${tables.hidden} SET user_id=?,article_id=?`,
      [user_id, article_id]
    )
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
    await pool.query(
      `DELETE FROM ${tables.hidden} WHERE user_id=? AND article_id=?`,
      [user_id, article_id]
    )
    return res.json({
      message: "Removed from hidden"
    })
  } catch (error) {
    next(error)
  }
}

module.exports.addArticle = async (req, res, next) => {
  try {
    const { title, description, image_url, link_url, website } = req.body
    const baseURL = url.parse(link_url).host

    const tagForLink = await pool.query(
      `SELECT distinct * FROM ${tables.tag_website} JOIN ${tables.websites} USING(website_id) WHERE link_url LIKE ?`,
      [`%${baseURL}%`]
    )
    const tagId = tagForLink[0].tag_id || 10
    const article = await pool.query(
      `SELECT article_id FROM ${tables.articles} WHERE link_url=?`,
      [link_url]
    )
    if (article.length == 0) {
      const insert = await pool.query(
        `INSERT INTO ${tables.articles} SET title=?,description=?,image_url=?,link_url=?,website=?`,
        [
          title,
          description,
          image_url || "public/images/imagenotfound.png",
          link_url,
          website
        ]
      )
      if (insert.insertId) {
        await pool.query(
          `INSERT INTO ${tables.articleTags} SET article_id=?,tag_id=?`,
          [insert.insertId, tagId]
        )
        return res.send({ message: "Added successfully" })
      }
    } else {
      throw new ErrorHandler(409, "Article already exists")
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
