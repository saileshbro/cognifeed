const pool = require("../database/database")
const { ExceptionHandler } = require("../helpers/error_handler.js")
module.exports.addTag = async (req, res, next) => {
  try {
    const tag = req.body.tag
    const tag_res = await pool.query("SELECT tag_id FROM tags WHERE tag_name=?", [tag])
    if (tag_res.length == 0) {
      await pool.query("INSERT INTO tags SET tag_name=?", [tag])
    } else {
      throw new ExceptionHandler(400, "Tag alredy exists")
    }
    return res.json({
      tag: tag
    })
  } catch (error) {
    next(error)
  }
}
