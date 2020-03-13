const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class NewYorkerPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "New Yorker"
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("h1[class*='content-header']")
      .text()
      .trim()
    this.image_url = $("figure .responsive-image__image").attr("src")
    if (this.image_url === undefined) {
      this.image_url = $("article picture img.responsive-image__image").attr(
        "src"
      )
    }
    this.description = $(".article__body p")
      .slice(1, 3)
      .text()
      .substr(0, 500)
  }
}
module.exports = NewYorkerPurifier
