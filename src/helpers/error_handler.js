/* eslint-disable linebreak-style */
class ErrorHandler extends Error {
  /**
   *
   * @param {number} statusCode
   * @param {String} error
   */
  constructor(statusCode, error) {
    super()
    this.statusCode = statusCode
    this.error = error
  }
}
/**
 *
 * @param {ErrorHandler} err
 * @param {*} res
 */
const errorHandler = (err, res) => {
  const { statusCode, error } = err
  res.status(statusCode || 500).json({ error: error || "Error Connecting to Database." })
}

module.exports = { ErrorHandler, errorHandler }
