const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class TheGeoPoliticsPurifier extends Purifier {
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
    this.title = $("header h1.entry-title")
      .text()
      .trim()

    this.description = $(".td-post-content")
      .text()
      .substr(0, 500)

    this.image_url = $(".td-post-featured-image img").attr("src")
  }
}
module.exports = TheGeoPoliticsPurifier
