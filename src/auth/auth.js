/* eslint-disable require-atomic-updates */
const jwt = require("jsonwebtoken")
const { pool, tables } = require("../database/database")
const { ErrorHandler } = require("../helpers/error_handler")
module.exports = async (req, res, next) => {
  try {
    if (!req.header("Authorization") || req.header("Authorization") === "Bearer null") {
      throw new ErrorHandler(401, "Please authenticate.")
    }
    const token = req.header("Authorization").replace("Bearer ", "")
    const decoded = jwt.verify(token, process.env.JWT_SECRET)
    let user = await pool.query(`SELECT * FROM ${tables.user} WHERE user_id=?`, [decoded.user_id])
    if (user.length == 0) {
      throw new ErrorHandler(401, "Please authenticate.")
    }
    req.token = token
    user = user[0]
    delete user.password
    delete user.created_at
    delete user.updated_at
    req.user = user
    next()
  } catch (error) {
    next(error)
  }
}
