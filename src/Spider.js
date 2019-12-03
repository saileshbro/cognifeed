const Link = require("./link")
const request = require("request-promise")
const pool = require("./database/database")
const { ErrorHandler } = require("./helpers/error_handler")
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
      //   console.log($(e).attr("href"))
      if (
        $(e).attr("href") != undefined &&
        $(e)
          .attr("href")
          .match("/wiki/")
      ) {
        horizonArray.push(new Link(this.link.baseURL, $(e).attr("href")))
      }
    })
    this.horizon = new LinksCollection(horizonArray)
  }
  getNewLinks() {
    return this.horizon
    //  returns this.spider ko linksCollection
  }
  async persistHtml() {
    const id = await pool.query("SELECT id FROM links WHERE url=?", [this.link.resolve()])
    if (id != 0) {
      throw new ErrorHandler(409, "This Url has aready been spawned.")
    } else {
      try {
        await pool.query("INSERT INTO links SET url=?,baseUrl=?,html=?", [
          this.link.resolve(),
          this.link.baseURL,
          this.html
        ])
      } catch (error) {
        return error
      }
    }
    //   saves or returns html from this.link
  }
}

//Spider Instantiation.
// const Spider = require("./Spider")
// const spider = Spider.spawn(new Link("https://en.wikipedia.org", "/wiki/Node.js"))
//   ; (async function name() {
//     await spider.resolveUrl()
//     spider.getNewLinks()
//     spider.persistHtml()
//   })()
