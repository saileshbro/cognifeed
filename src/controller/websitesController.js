const { pool, tables } = require("../database/database")
const Link = require("../scraper/link")
exports.getWebsites = async (req, res, next) => {
  try {
    const websites = await pool.query(`SELECT link_url FROM ${tables.websites}`)
    const links = websites.map(site => new Link(site.link_url))
    return res.json(links)
  } catch (error) {
    next(error)
  }
}

exports.addWebsite = async (req, res, next) => {
  try {
    const { website } = req.body
    const ifExists = await pool.query(`SELECT * FROM ${tables.websites} WHERE link_url=?`, [
      website
    ])
    if (ifExists.length > 0) {
      return res.send({ error: "Website already exists!" })
    }
    const resp = await pool.query(`INSERT INTO ${tables.websites} SET link_url=?`, [website])
    if (resp) {
      return res.send(website)
    }
    return res.send(website)
  } catch (error) {
    next(error)
  }
}
