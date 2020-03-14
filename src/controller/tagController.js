const { pool, tables } = require("../database/database")
const { ErrorHandler } = require("../helpers/error_handler.js")
module.exports.addTag = async (req, res, next) => {
  const { tag_id } = req.params
  try {
    const exists = await pool.query(
      `SELECT * FROM ${tables.user_tags} WHERE tag_id=? AND user_id=?`,
      [tag_id, req.user.user_id]
    )
    if (exists.length > 0) {
      return res.status(400).json({ error: "Tag already exists" })
    }
    await pool.query(`INSERT INTO ${tables.user_tags} SET tag_id=?,user_id=?`, [
      tag_id,
      req.user.user_id
    ])
    return res.json({
      message: "Successfully added"
    })
  } catch (error) {
    next(error)
  }
}
module.exports.addTags = async (req, res, next) => {
  const { tags } = req.body

  try {
    await pool.query(`DELETE FROM ${tables.user_tags} WHERE user_id=?`, [req.user.user_id])
    for (let i = 0; i < tags.length; i++) {
      const tag_id = tags[i].tag_id
      await pool.query(`INSERT INTO ${tables.user_tags} SET tag_id=?,user_id=?`, [
        tag_id,
        req.user.user_id
      ])
    }
    return res.json({
      message: "Successfully added."
    })
  } catch (error) {
    next(error)
  }
}
module.exports.removeTag = async (req, res, next) => {
  try {
    const { tag_id } = req.params
    const tag_res = await pool.query(
      `SELECT tag_id FROM ${tables.user_tags} WHERE tag_id=? AND user_id=?`,
      [tag_id, req.user.user_id]
    )
    if (tag_res.length > 0) {
      await pool.query(`DELETE FROM ${tables.user_tags} WHERE tag_id=? AND user_id=?`, [
        tag_id,
        req.user.user_id
      ])
    } else {
      throw new ErrorHandler(404, "Tag doesn't exist")
    }
    return res.json({
      message: "Removed successfully"
    })
  } catch (error) {
    next(error)
  }
}

module.exports.getAllTags = async (req, res, next) => {
  try {
    let tags = await pool.query(
      `SELECT tag_id,tag_name,STRCMP(${tables.user_tags}.user_id,?)+1 AS is_selected FROM ${tables.tags} LEFT JOIN ${tables.user_tags} USING(tag_id)`,
      [req.user.user_id]
    )

    if (tags.length > 0) {
      tags.forEach(tag => {
        tag.tag_name = tag.tag_name
          .split(" ")
          .map(s => s.charAt(0).toUpperCase() + s.substring(1))
          .join(" ")
          .replace("And", "and")
        tag.is_selected = tag.is_selected == 1
      })
      return res.json({
        tags
      })
    } else {
      throw new ErrorHandler(404, "Tags not found")
    }
  } catch (error) {
    next(error)
  }
}

module.exports.getTopTags = async (req, res, next) => {
  try {
    const top_tags = await pool.query(
      `SELECT ${tables.tags}.* FROM ${tables.tags} INNER JOIN ${tables.articleTags} INNER JOIN ${tables.articles} ORDER BY ${tables.articles}.view_count DESC lIMIT 10`
    )
    if (top_tags.length > 0) {
      top_tags.forEach(tag => {
        tag.tag_name = tag.tag_name
          .split(" ")
          .map(s => s.charAt(0).toUpperCase() + s.substring(1))
          .join(" ")
          .replace("And", "and")
      })
      res.json({
        top_tags
      })
    } else {
      throw new ErrorHandler(404, "Tags Not Found")
    }
  } catch (error) {
    next(error)
  }
}
exports.addTagToWebsite = async (req, res, next) => {
  try {
    const { tag, website } = req.body
    const tag_id = await pool.query(`SELECT tag_id FROM ${tables.tags} WHERE tag_name=?`, [
      tag.toLowerCase()
    ])
    if (tag_id.length > 0) {
      const website_id = await pool.query(
        `SELECT website_id FROM ${tables.websites} WHERE link_url=?`,
        [website.toLowerCase()]
      )
      if (website_id.length > 0) {
        const ifExists = await pool.query(
          `SELECT * FROM ${tables.tag_website} WHERE tag_id=? AND website_id=?`,
          [tag_id[0].tag_id, website_id[0].website_id]
        )
        if (ifExists.length > 0) {
          return res.status(400).json({ error: "Tag and website already associated!" })
        }
        const result = await pool.query(
          `INSERT INTO ${tables.tag_website} SET tag_id=?,website_id=?`,
          [tag_id[0].tag_id, website_id[0].website_id]
        )
        if (result) {
          return res.send({ message: "Successfully added!" })
        }
      }
    }
  } catch (error) {
    next(error)
  }
}
