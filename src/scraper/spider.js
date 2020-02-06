/* eslint-disable linebreak-style */
const Link = require("./link")
const request = require("request-promise")
const pool = require("../database/database")
const { ErrorHandler } = require("../helpers/error_handler")
const cheerio = require("cheerio")
const axios = require("axios").default
const LinksCollection = require("../scraper/links-collection")
const baseUrl = "http://127.0.0.1:" + process.env.PORT

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
    try {
      const response = await request.get(this.link.resolve(), {
        headers: {
          accept:
            "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
          "accept-encoding": "gzip, deflate, br",
          "accept-language": "en-US,en;q=0.9",
          "cache-control": "max-age=0",
          "sec-fetch-mode": "navigate",
          "sec-fetch-site": "same-origin",
          "sec-fetch-user": "?1",
          "user-agent":
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36"
        },
        gzip: true
      })
      this.html = response
      const $ = cheerio.load(response)
      const horizonArray = []
      $("a").each((i, e) => {
        if ($(e).attr("href") !== undefined) {
          horizonArray.push(new Link(this.link.baseURL, $(e).attr("href")))
        }
      })
      this.horizon = new LinksCollection(horizonArray)
      return this.horizon
    } catch (error) {
      console.log("error")
    }
    // eslint-disable-next-line linebreak-style
  }
  getNewLinks() {
    return this.horizon
    //  returns this.spider ko linksCollection
  }
  async persistHtml() {
    console.log(this.html.length)
    try {
      const payload = {
        url: this.link.resolve(),
        html: this.html
      }
      const response = await axios.post(
        `${baseUrl}/api/spider/persist`,
        payload
      )
      console.log(response)
    } catch (error) {
      console.error(error.message)
    }
    //   saves or returns html from this.link
  }
}
