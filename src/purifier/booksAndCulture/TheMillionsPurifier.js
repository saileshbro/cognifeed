const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class TheMillionsPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "The Millions"
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("h1.entry-title")
      .text()
      .trim()
    this.image_url = $("meta[property='og:image']")
      .eq(0)
      .attr("content")

    this.description = $(".the-content p")
      .slice(1, 3)
      .text()
      .substr(0, 500)
  }
}
module.exports = TheMillionsPurifier
