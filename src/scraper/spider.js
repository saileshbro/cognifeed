const Link = require("./link")
const request = require("request-promise")
const pool = require("./database/database")
const { ErrorHandler } = require("../helpers/error_handler")
const cheerio = require("cheerio")
const LinksCollection = require("./links-collection")
module.exports = class Spider {
  /**
   *
   * @param {Link} link
   * Returns a new Spider object with link as parameter.
   * If the link collection of one spider spawned in a url is full then link collecction field can be added to spawn
   */
  static spawn(link) {
    return new Spider(link)
  }
  /**
   *
   * @param {Link} link
   * @param {LinksCollection} horizon
   */
  constructor(link, horizon = new LinksCollection()) {
    this.link = link
    this.horizon = horizon
  }

  async resolveUrl() {
    //   link vitra gayera a tag ko links haru sabai nikalne
    // links lai horizon ma store garne
    const response = await request.get(this.link.resolve())
    this.html = response
    const $ = cheerio.load(response)
    const horizonArray = []
    $("a").each((i, e) => {
      if ($(e).attr("href") != undefined) {
        horizonArray.push(new Link(this.link.baseURL, $(e).attr("href")))
      }
    })
    this.horizon = new LinksCollection(horizonArray)
    return this.horizon
  }
  getNewLinks() {
    return this.horizon
    //  returns this.spider ko linksCollection
  }
  async persistHtml() {
    try {
      const result = await pool.query("SELECT id FROM links WHERE url=?", [this.link.resolve()])
      if (result.length > 0) {
        throw new ErrorHandler(409, "This Url has aready been spawned.")
      } else {
        console.log(this.link.resolve(), this.link.baseURL, this.html.length)
        // send post request to persist html
      }
    } catch (error) {
      return error
    }
    //   saves or returns html from this.link
  }
}
