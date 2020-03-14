const { pool, tables } = require("../database/database")
exports.notify = async (req, res, next) => {
  // get time for such where time is around date.now
  // for all get a random article they subscribed
  // notify
}
exports.toggleNotification = async (req, res, next) => {
  try {
    await pool.query(
      `UPDATE ${tables.user} SET receive_notification = !receive_notification WHERE user_id=?`,
      [req.user.user_id]
    )
    return res.send({ message: "Sucessully done!" })
  } catch (error) {
    next(error)
  }
}
exports.setTime = async (req, res, next) => {
  const { time } = req.body
  try {
    await pool.query(
      `UPDATE ${tables.user} SET notify_time=? WHERE user_id=?`,
      [time, req.user.user_id]
    )
    return res.send({ message: "Successfully set" })
  } catch (error) {
    next(error)
  }
}
exports.getStatus = async (req, res, next) => {
  try {
    const result = await pool.query(
      `SELECT	receive_notification,notify_time FROM ${tables.user}  WHERE user_id=?`,
      [req.user.user_id]
    )
    return res.send({
      status: result[0].receive_notification,
      hour: result[0].notify_time.split(":")[0],
      minute: result[0].notify_time.split(":")[1]
    })
  } catch (error) {
    next(error)
  }
}
