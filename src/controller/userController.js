const bcrypt = require("bcryptjs")
const validator = require("validator").default
const jwt = require("jsonwebtoken")
const pool = require("../database/database")
const { ErrorHandler } = require("../helpers/error_handler")
const { nameValidator, passwordValidator } = require("../helpers/customValidators")

exports.signup = async (req, res, next) => {
  const { email, name } = req.body
  let { password } = req.body
  try {
    if (!name) {
      throw new ErrorHandler(406, "Empty name provided")
    }
    if (!email) {
      throw new ErrorHandler(406, "Empty email provided")
    }
    if (!password) {
      throw new ErrorHandler(406, "Empty password provided")
    }
    if (!validator.isEmail(email)) {
      throw new ErrorHandler(406, "Invalid email provided")
    }
    if (!nameValidator(name)) {
      throw new ErrorHandler(406, "Invalid name provided")
    }
    if (!passwordValidator(password)) {
      throw new ErrorHandler(
        406,
        "Required: Minimum eight characters, at least one letter, one number and one special character."
      )
    }
    const users = await pool.query("SELECT * FROM users WHERE email=?", [email])

    if (users.length !== 0) {
      throw new ErrorHandler(409, "Email already registered")
    }
    password = await bcrypt.hash(password, parseInt(process.env.SALT_ROUNDS, 10))
    const result = await pool.query("INSERT INTO users SET name=?,email=?,password=?", [
      name,
      email,
      password
    ])
    const token = jwt.sign({ user_id: result.insertId }, process.env.JWT_SECRET)

    return res.json({
      user_id: result.insertId,
      name,
      email,
      token
    })
  } catch (error) {
    return next(error)
  }
}
exports.login = async (req, res, next) => {
  const { email, password } = req.body
  try {
    if (!email) {
      throw new ErrorHandler(406, "Empty email provided")
    }
    if (!password) {
      throw new ErrorHandler(406, "Empty password provided")
    }
    const result = await pool.query("SELECT user_id,email,name,password FROM users WHERE email=?", [
      email
    ])

    if (result.length === 0) {
      throw new ErrorHandler(401, "Invalid email or password")
    }
    const isMatch = await bcrypt.compare(password, result[0].password)
    if (!isMatch) {
      throw new ErrorHandler(401, "Invalid email or password.")
    }
    const token = jwt.sign({ user_id: result[0].user_id }, process.env.JWT_SECRET)
    delete result[0].password
    return res.json({
      ...result[0],
      token
    })
  } catch (error) {
    return next(error)
  }
}
