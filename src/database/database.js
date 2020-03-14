const mysql = require("mysql2")
const util = require("util")
const pool = mysql.createPool({
  connectionLimit: 10,
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME
})

pool.getConnection((err, connection) => {
  if (err) {
    if (err.code === "PROTOCOL_CONNECTION_LOST") {
      console.error("Database connection was closed.")
    }
    if (err.code === "ER_CON_COUNT_ERROR") {
      console.error("Database has too many connections.")
    }
    if (err.code === "ECONNREFUSED") {
      console.error("Database connection was refused.")
    }
  }

  if (connection) connection.release()
})
pool.query = util.promisify(pool.query)
exports.pool = pool
exports.tables = {
  articles: "article",
  user_tags: "user_tags",
  tags: "tags",
  articleTags: "article_tag",
  selectedTags: "selected_tags",
  user: "users",
  favourites: "favourites",
  profile: "profile",
  links: "links",
  hidden: "hidden",
  websites: "website",
  tag_website: "tag_website"
}
