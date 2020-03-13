const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class EatRightPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Eat Right"
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("header.header h1.pageTitle")
      .text()
      .trim()

    this.description = $(".contentBlock p")
      .slice(1, 3)
      .text()
      .substr(0, 500)

    this.image_url = $("meta[property='og:image']")
      .eq(0)
      .attr("content")
  }
}
module.exports = EatRightPurifier
