const { pool, tables } = require("../database/database")
const { ErrorHandler } = require("../helpers/error_handler.js")
module.exports.addTag = async (req, res, next) => {
  try {
    const tag = req.body.tag
    const tag_res = await pool.query(`SELECT tag_id FROM ${tables.tags} WHERE tag_name=?`, [tag])
    if (tag_res.length == 0) {
      await pool.query(`INSERT INTO ${tables.tags} SET tag_name=?`, [tag])
    } else {
      throw new ErrorHandler(404, "Tag already exists")
    }
    return res.json({
      tag: tag
    })
  } catch (error) {
    next(error)
  }
}
module.exports.removeTag = async (req, res, next) => {
  try {
    const { tag_id } = req.params
    const tag_res = await pool.query(`SELECT tag_name FROM ${tables.tags} WHERE tag_id=?`, [tag_id])
    if (tag_res.length > 0) {
      await pool.query(`DELETE FROM ${tables.tags} WHERE tag_id=?`, [tag_id])
    } else {
      throw new ErrorHandler(404, "Tag doesn't exist")
    }
    return res.json({
      tag_id,
      tag_name: tag_res[0].tag_name
    })
  } catch (error) {
    next(error)
  }
}

module.exports.getAllTags = async (req, res, next) => {
  try {
    const page_num = req.query.page
    let tags
    if (page_num) {
      tags = await pool.query(`SELECT * FROM ${tables.tags} ORDER BY tag_name LIMIT 10 OFFSET ? `, [
        (page_num - 1) * 10
      ])
    } else {
      tags = await pool.query(`SELECT * FROM ${tables.tags} ORDER BY tag_name`)
    }
    if (tags.length > 0) {
      tags.forEach(tag => {
        tag.tag_name = tag.tag_name
          .split(" ")
          .map(s => s.charAt(0).toUpperCase() + s.substring(1))
          .join(" ")
          .replace("And", "and")
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
