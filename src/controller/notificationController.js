const { pool, tables } = require("../database/database")
const { sendNotification } = require("../push_notification")
exports.notify = async (req, res, next) => {
  try {
    const date = new Date()
    const hour = date.getHours()
    const min = date.getMinutes()
    let resp
    const results = await pool.query(
      `SELECT user_id from ${tables.user} WHERE SUBSTR(notify_time,1,2)=? AND SUBSTR(notify_time,4,LENGTH(notify_time)) BETWEEN ? and ?`,
      [hour, min - 10, min + 10]
    )
    console.log(results.length)
    for (let i = 0; i < results.length; i++) {
      const randomArticle = await pool.query(
        `SELECT * FROM ${tables.articles} LEFT JOIN ${tables.articleTags} USING(article_id) JOIN ${tables.user_tags} USING(tag_id) WHERE user_id=? ORDER BY RAND() LIMIT 1`,
        [results[i].user_id]
      )
      const result = await sendNotification(
        randomArticle[0].title,
        randomArticle[0].description,
        randomArticle[0].image_url
      )
    }

    return res.send({ message: "Sent to all" })
  } catch (error) {
    console.log(error)
    next(error)
  }
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
