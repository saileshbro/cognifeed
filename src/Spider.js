const Link = require("./link")
const request = require("request-promise")
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
      if (
        $(e)
          .attr("href")
          .match("/wiki/")
      ) {
        horizonArray.push(Link(this.link, $(e).attr("href")))
      }
    })
    this.horizon = LinksCollection(horizonArray)
  }
  getNewLinks() {
    return this.horizon
    //  returns this.spider ko linksCollection
  }
  prsistHtml() {
    return this.html
    //   saves or returns html from this.link
  }
}
