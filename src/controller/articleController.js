const { pool, tables } = require("../database/database")
const { ErrorHandler } = require("../helpers/error_handler")
const url = require("url")
module.exports.articles = async (req, res, next) => {
  const { searchby, query } = req.query
  let articles
  console.log(req.query)

  try {
    if (!searchby || searchby == "") {
      console.log(searchby)
      articles = await pool.query(
        `SELECT DISTINCT article_id,title,website,description,image_url,link_url,view_count,STRCMP(${tables.favourites}.user_id,?)+1 AS is_fav FROM ${tables.articles} LEFT JOIN ${tables.favourites} USING(article_id)  WHERE ${tables.favourites}.user_id=? AND article_id NOT IN (SELECT DISTINCT article_id FROM ${tables.hidden} WHERE user_id=?)`,
        [req.user.user_id, req.user.user_id, req.user.user_id]
      )
    } else {
      if (searchby == "title") {
        articles = await pool.query(
          `SELECT DISTINCT article_id,title,website,description,image_url,link_url,view_count,STRCMP(${tables.favourites}.user_id,?)+1 AS is_fav FROM ${tables.articles} LEFT JOIN ${tables.favourites} USING(article_id) WHERE ${tables.favourites}.user_id=? AND article_id NOT IN (SELECT DISTINCT article_id FROM ${tables.hidden} WHERE user_id=?) AND title LIKE ?`,
          [req.user.user_id, req.user.user_id, req.user.user_id, "%" + query + "%"]
        )
      } else if (searchby == "website") {
        articles = await pool.query(
          `SELECT DISTINCT article_id,title,website,description,image_url,link_url,view_count,STRCMP(${tables.favourites}.user_id,?)+1 AS is_fav FROM ${tables.articles} LEFT JOIN ${tables.favourites} USING(article_id) WHERE ${tables.favourites}.user_id=? AND article_id NOT IN (SELECT DISTINCT article_id FROM ${tables.hidden} WHERE user_id=?) AND website LIKE ?`,
          [req.user.user_id, req.user.user_id, req.user.user_id, "%" + query + "%"]
        )
      } else if (searchby == "tag") {
        articles = await pool.query(
          `SELECT DISTINCT article_id,title,website,description,image_url,link_url,view_count,STRCMP(${tables.favourites}.user_id,?)+1 AS is_fav FROM ${tables.articles} LEFT JOIN ${tables.favourites} USING(article_id) LEFT JOIN ${tables.articleTags} USING(article_id) LEFT JOIN ${tables.tags} USING(tag_id) WHERE tag_name LIKE ? AND ${tables.favourites}.user_id=? AND article_id NOT IN (SELECT DISTINCT article_id FROM ${tables.hidden} WHERE user_id=?)`,
          [req.user.user_id, "%" + query + "%", req.user.user_id, req.user.user_id]
        )
      }
    }

    const result2 = await pool.query(
      `select DISTINCT * from ${tables.articles} left join ${tables.articleTags}  using(article_id) left join ${tables.tags} using(tag_id) left join ${tables.user_tags} using(tag_id)`,
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
      if (article.tag_name)
        article.tag_name = article.tag_name
          .split(" ")
          .map(s => s.charAt(0).toUpperCase() + s.substring(1))
          .join(" ")
    })
    if (articles.length == 0) {
      throw new ErrorHandler(404, "articles not found")
    }
    console.log(articles)
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
  const { searchby, query } = req.query
  let articles
  try {
    if (!searchby || searchby == "") {
      articles = await pool.query(
        `SELECT DISTINCT article_id,title,description,website,image_url,link_url,view_count FROM ${tables.articles} join ${tables.favourites} using(article_id) WHERE ${tables.favourites}.user_id=? AND article_id NOT IN (SELECT DISTINCT article_id FROM ${tables.hidden} WHERE user_id=?)`,
        [req.user.user_id, req.user.user_id]
      )
    } else {
      if (searchby == "title") {
        articles = await pool.query(
          `SELECT DISTINCT article_id,title,description,website,image_url,link_url,view_count FROM ${tables.articles} join ${tables.favourites} using(article_id) WHERE ${tables.favourites}.user_id=? AND article_id NOT IN (SELECT DISTINCT article_id FROM ${tables.hidden} WHERE user_id=?) AND title LIKE ?`,
          [req.user.user_id, req.user.user_id, "%" + query + "%"]
        )
      } else if (searchby == "website") {
        articles = await pool.query(
          `SELECT DISTINCT article_id,title,description,website,image_url,link_url,view_count FROM ${tables.articles} join ${tables.favourites} using(article_id) WHERE ${tables.favourites}.user_id=? AND article_id NOT IN (SELECT DISTINCT article_id FROM ${tables.hidden} WHERE user_id=?) AND website LIKE ?`,
          [req.user.user_id, req.user.user_id, "%" + query + "%"]
        )
      } else if (searchby == "tag") {
        articles = await pool.query(
          `SELECT DISTINCT article_id,title,description,website,image_url,link_url,view_count FROM ${tables.articles} join ${tables.favourites} using(article_id) LEFT JOIN ${tables.articleTags} USING(article_id) LEFT JOIN ${tables.tags} USING(tag_id) WHERE tag_name LIKE ? AND ${tables.favourites}.user_id=? AND article_id NOT IN (SELECT DISTINCT article_id FROM ${tables.hidden} WHERE user_id=?) `,
          ["%" + query + "%", req.user.user_id, req.user.user_id]
        )
      }
    }
    const result2 = await pool.query(
      `select DISTINCT * from ${tables.articles} left join ${tables.articleTags}  using(article_id) left join ${tables.tags} using(tag_id) left join ${tables.user_tags} using(tag_id)`,
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
      if (article.tag_name)
        article.tag_name = article.tag_name
          .split(" ")
          .map(s => s.charAt(0).toUpperCase() + s.substring(1))
          .join(" ")
    })
    return res.json({
      articles
    })
  } catch (error) {
    next(error)
  }
}
module.exports.getHidden = async (req, res, next) => {
  // SELECT DISTINCT article_id,title,description,image_url,link_url,view_count,STRCMP(${tables.favourites}.user_id,?)+1 AS is_fav FROM ${tables.articles} LEFT JOIN ${tables.favourites} USING(article_id) WHERE article_id IN (SELECT article_id FROM ${tables.hidden} WHERE user_id=?)
  const { searchby, query } = req.query
  console.log(req.query)
  let articles
  try {
    if (!searchby || searchby == "") {
      articles = await pool.query(
        `SELECT DISTINCT article_id,title,website,description,image_url,link_url,view_count,STRCMP(${tables.favourites}.user_id,?)+1 AS is_fav FROM ${tables.articles} LEFT JOIN ${tables.favourites} USING(article_id) WHERE ${tables.favourites}.user_id=? AND article_id IN (SELECT DISTINCT article_id FROM ${tables.hidden} WHERE user_id=?)`,
        [req.user.user_id, req.user.user_id, req.user.user_id]
      )
    } else {
      if (searchby == "title") {
        articles = await pool.query(
          `SELECT DISTINCT article_id,title,website,description,image_url,link_url,view_count,STRCMP(${tables.favourites}.user_id,?)+1 AS is_fav FROM ${tables.articles} LEFT JOIN ${tables.favourites} USING(article_id) WHERE ${tables.favourites}.user_id=? AND article_id IN (SELECT DISTINCT article_id FROM ${tables.hidden} WHERE user_id=?) AND title LIKE ?`,
          [req.user.user_id, req.user.user_id, req.user.user_id, "%" + query + "%"]
        )
      } else if (searchby == "website") {
        articles = await pool.query(
          `SELECT DISTINCT article_id,title,website,description,image_url,link_url,view_count,STRCMP(${tables.favourites}.user_id,?)+1 AS is_fav FROM ${tables.articles} LEFT JOIN ${tables.favourites} USING(article_id) WHERE ${tables.favourites}.user_id=? AND article_id IN (SELECT DISTINCT article_id FROM ${tables.hidden} WHERE user_id=?) AND website LIKE ?`,
          [req.user.user_id, req.user.user_id, req.user.user_id, "%" + query + "%"]
        )
      } else if (searchby == "tag") {
        articles = await pool.query(
          `SELECT DISTINCT article_id,title,website,description,image_url,link_url,view_count,STRCMP(${tables.favourites}.user_id,?)+1 AS is_fav FROM ${tables.articles} LEFT JOIN ${tables.favourites} USING(article_id) LEFT JOIN ${tables.articleTags} USING(article_id) LEFT JOIN ${tables.tags} USING(tag_id) WHERE ${tables.favourites}.user_id=? AND tag_name LIKE ? AND article_id IN (SELECT article_id FROM ${tables.hidden} WHERE user_id=?)`,
          [req.user.user_id, req.user.user_id, "%" + query + "%", req.user.user_id]
        )
      }
    }

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
      if (article.tag_name)
        article.tag_name = article.tag_name
          .split(" ")
          .map(s => s.charAt(0).toUpperCase() + s.substring(1))
          .join(" ")
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
    const { title, description, image_url, link_url, website } = req.body
    const baseURL = url.parse(link_url).host

    const tagForLink = await pool.query(
      `SELECT distinct * FROM ${tables.tag_website} JOIN ${tables.websites} USING(website_id) WHERE link_url LIKE ?`,
      [`%${baseURL}%`]
    )
    const tagId = tagForLink[0].tag_id || 10
    const article = await pool.query(`SELECT article_id FROM ${tables.articles} WHERE link_url=?`, [
      link_url
    ])
    if (article.length == 0) {
      const insert = await pool.query(
        `INSERT INTO ${tables.articles} SET title=?,description=?,image_url=?,link_url=?,website=?`,
        [title, description, image_url, link_url, website]
      )
      if (insert.insertId) {
        await pool.query(`INSERT INTO ${tables.articleTags} SET article_id=?,tag_id=?`, [
          insert.insertId,
          tagId
        ])
        return res.send({ message: "Added successfully" })
      }
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
