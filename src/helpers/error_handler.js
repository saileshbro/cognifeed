class ErrorHandler extends Error {
  constructor(statusCode, error) {
    super()
    this.statusCode = statusCode
    this.error = error
  }
}
const errorHandler = (err, res) => {
  const { statusCode, error } = err
  res.status(statusCode || 500).json({ error })
}

module.exports = { ErrorHandler, errorHandler }
