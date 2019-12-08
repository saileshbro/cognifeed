const pool = require("../database/database")
const { ErrorHandler } = require("../helpers/error_handler")
module.exports.persistPurifier = async (req, res, next) => {
  const { title, description, image_url, link_url } = req.body

  try {
    const result = await pool.query("SELECT * FROM article WHERE link_url", [link_url])
    if (result.length > 0) {
      throw new ErrorHandler(401, "This url has already been purified")
    } else {
      const resolve = await pool.query("INSERT INTO article SET title=?,description=?,image_url=?,link_url=?", [title, description,image_url,link_url])
      return res.json({
        id: resolve.insertId,
        title:title
      })
    }
  } catch (error) {
    next(error)
  }
}
