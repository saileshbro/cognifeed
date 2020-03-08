const bcrypt = require("bcryptjs")
const moment = require("moment")
const validator = require("validator").default
const jwt = require("jsonwebtoken")
const { pool, tables } = require("../database/database")
const { ErrorHandler } = require("../helpers/error_handler")
const { nameValidator, passwordValidator } = require("../helpers/customValidators")

exports.signup = async (req, res, next) => {
  const { email, name, phone } = req.body
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
    if (!phone) {
      throw new ErrorHandler(406, "Empty phone provided")
    }
    if (!validator.isEmail(email)) {
      throw new ErrorHandler(406, "Invalid email provided")
    }
    if (!nameValidator(name)) {
      throw new ErrorHandler(406, "Invalid name provided")
    }
    if (!validator.isMobilePhone(phone) || phone.length < 10) {
      throw new ErrorHandler(406, "Invalid number provided")
    }
    if (!passwordValidator(password)) {
      throw new ErrorHandler(
        406,
        "Required: Minimum eight characters, at least one letter, one number and one special character."
      )
    }
    const users = await pool.query(`SELECT * FROM ${tables.user} WHERE email=?`, [email])

    if (users.length !== 0) {
      throw new ErrorHandler(409, "Email already registered")
    }
    password = await bcrypt.hash(password, parseInt(process.env.SALT_ROUNDS, 10))
    const result = await pool.query(`INSERT INTO ${tables.user} SET email=?,password=?`, [
      email,
      password,
      name
    ])
    if (result.affectedRows) {
      await pool.query(`INSERT INTO ${tables.profile} SET user_id=?,name=?,phone=?`, [
        result.insertId,
        name,
        phone
      ])
    }
    const token = jwt.sign({ user_id: result.insertId }, process.env.JWT_SECRET)

    return res.json({
      user_id: result.insertId,
      name,
      email,
      phone,
      token,
      image_url: "default.png"
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
    const result = await pool.query(
      `SELECT * FROM ${tables.user} JOIN ${tables.profile} USING(user_id) WHERE email=? LIMIT 1`,
      [email]
    )

    if (result.length === 0) {
      throw new ErrorHandler(401, "Invalid email or password")
    }
    const isMatch = await bcrypt.compare(password, result[0].password)
    if (!isMatch) {
      throw new ErrorHandler(401, "Invalid email or password.")
    }
    const token = jwt.sign({ user_id: result[0].user_id }, process.env.JWT_SECRET)
    delete result[0].password
    let joined_date = moment(result[0].joined_date).format("MMMM Do YY")
    delete result[0].created_at
    delete result[0].updated_at
    delete result[0].reset_token
    return res.json({
      ...result[0],
      joined_date,
      token
    })
  } catch (error) {
    return next(error)
  }
}
exports.profile = async (req, res, next) => {
  const userId = req.user.user_id
  try {
    const userProfile = await pool.query(
      `SELECT name, email, phone, bio, address,about, website, image_url, ${tables.user}.created_at as joined_date FROM ${tables.user} JOIN ${tables.profile} USING(user_id) WHERE user_id=?`,
      [userId]
    )
    console.log(userProfile)
    userProfile[0].joined_date = moment(userProfile[0].joined_date).format("MMMM Do YY")

    userProfile[0].image_url =
      req.protocol + "://" + req.get("host") + "/" + userProfile[0].image_url
    if (userProfile) {
      return res.json(userProfile[0])
    }
  } catch (error) {
    return next(error)
  }
}

exports.updateProfile = async (req, res, next) => {
  console.log(req.body)
  const userId = req.user.user_id
  const { name, email, phone, bio, address, website, about } = req.body
  try {
    if (!name) {
      throw new ErrorHandler(406, "Empty name provided")
    }
    if (!email) {
      throw new ErrorHandler(406, "Empty email provided")
    }
    if (!phone) {
      throw new ErrorHandler(406, "Empty phone provided")
    }
    if (!validator.isEmail(email)) {
      throw new ErrorHandler(406, "Invalid email provided")
    }
    if (!nameValidator(name)) {
      throw new ErrorHandler(406, "Invalid name provided")
    }
    if (!validator.isMobilePhone(phone) || phone.length < 10) {
      throw new ErrorHandler(406, "Invalid number provided")
    }
    const emailExists = await pool.query(
      `SELECT email FROM ${tables.user} WHERE email=? AND user_id!=?`,
      [email, userId]
    )
    if (emailExists.length > 0) {
      throw new ErrorHandler(400, "Email aready registered!")
    }
    const oldValues = await pool.query(
      `SELECT bio,address,website,about FROM ${tables.user} INNER JOIN ${tables.profile} USING(user_id) WHERE user_id=?`,
      [userId]
    )

    if (oldValues[0].phone == phone) {
      throw new ErrorHandler(400, "Phone aready registered!")
    }
    const update = await pool.query(
      `UPDATE ${tables.user} INNER JOIN ${tables.profile} USING(user_id) SET name=?,email=?,phone=?,bio=?,address=?,website=?,about=? WHERE user_id=?`,
      [
        name,
        email,
        phone,
        bio || oldValues[0].bio,
        address || oldValues[0].address,
        website || oldValues[0].website,
        about || oldValues[0].about,
        userId
      ]
    )
    if (update) {
      return res.json({ message: "Successfully Updated" })
    } else {
      throw new ErrorHandler(400, "Unable to update!")
    }
  } catch (error) {
    console.log(error)
    return next(error)
  }
}

exports.changepw = async (req, res, next) => {
  console.log(req.body)
  const { currentPassword, newPassword } = req.body
  const { email, user_id } = req.user
  try {
    const user = await pool.query(
      `SELECT email, user_id, password FROM ${tables.user} WHERE email=? AND user_id=?`,
      [email, user_id]
    )
    if (user.length > 0) {
      if (user[0].email !== email) {
        throw new ErrorHandler(400, "Invalid1 user!")
      }
      const isValid = await bcrypt.compare(currentPassword, user[0].password)
      if (!isValid) {
        throw new ErrorHandler(400, "Current password is invalid!")
      }
      if (!passwordValidator(newPassword)) {
        throw new ErrorHandler(
          406,
          "Required: Minimum eight characters, at least one letter, one number and one special character."
        )
      }
      const newHashedPw = await bcrypt.hash(newPassword, parseInt(process.env.SALT_ROUNDS, 10))
      const updated = await pool.query(
        `UPDATE ${tables.user} SET password = ? WHERE email=? AND user_id=?`,
        [newHashedPw, email, user_id]
      )
      if (!updated) {
        throw new ErrorHandler(400, "Unable to change password")
      }
      return res.json({
        message: "Successfully updated!"
      })
    } else {
      throw new ErrorHandler(400, "Invalid3 user!")
    }
  } catch (error) {
    next(error)
  }
}
exports.uploadPicture = async (req, res, next) => {
  const { user_id } = req.user
  try {
    if (!req.file) {
      throw new ErrorHandler(401, "Please provide an image!")
    }
    const result = await pool.query(`UPDATE ${tables.profile} SET image_url=? WHERE user_id=?`, [
      req.file.path,
      user_id
    ])
    if (result.affectedRows > 0) {
      return res.json({
        message: "Profile updated successfully!",
        image_url: req.protocol + "://" + req.get("host") + "/" + req.file.path
      })
    } else {
      throw new ErrorHandler(400, "Unable to update profile picture!")
    }
  } catch (error) {
    next(error)
  }
}
exports.getForgotCode = async (req, res, next) => {
  const { email } = req.body
  const results = await pool.query(`SELECT email FROM ${tables.user} WHERE email=?`, [email])
  if (results.length > 0) {
    const reset_token = Math.floor(100000 + Math.random() * 900000)
    await pool.query(`UPDATE ${tables.user} SET reset_token=? WHERE email=?`, [reset_token, email])
    return res.json({
      reset_token
    })
  } else {
    throw new ErrorHandler(400, "Email not found!")
  }
}
exports.setForgotPassword = async (req, res, next) => {
  try {
    const { email, reset_token, newPassword } = req.body
    const results = await pool.query(
      `SELECT email FROM ${tables.user} WHERE email=? AND reset_token=?`,
      [email, reset_token]
    )
    if (results.length > 0) {
      if (!passwordValidator(newPassword)) {
        throw new ErrorHandler(
          406,
          "Required: Minimum eight characters, at least one letter, one number and one special character."
        )
      }
      const newHashedPw = await bcrypt.hash(newPassword, parseInt(process.env.SALT_ROUNDS, 10))

      const result = await pool.query(
        `UPDATE ${tables.user}  SET password=?,reset_token=? WHERE email=? AND reset_token=?`,
        [newHashedPw, "", email, reset_token]
      )
      if (result) {
        return res.json({ message: "Password changed successfully!" })
      } else {
        throw new ErrorHandler(400, "Unable to change password1!")
      }
    } else {
      throw new ErrorHandler(400, "Unable to change password2!")
    }
  } catch (error) {
    next(error)
  }
}
