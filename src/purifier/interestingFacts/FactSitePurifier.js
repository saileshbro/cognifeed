/* eslint-disable linebreak-style */
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class FactSidePurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("header.entry-header>h1.card")
      .text()
      .trim()

    this.image_url = $("article>div.post-thumbnail>img").attr("data-lazy-src")

    this.description = $("div.entry-content.card>p")
      .text()
      .substr(0, 500)
  }
}
module.exports = FactSidePurifier
