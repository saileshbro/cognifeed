const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class FashionLadyPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Fashion Lady"
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".story-title")
      .text()
      .trim()

    this.description = $(".content-area p")
      .slice(1, 3)
      .text()
      .substr(0, 500)

    this.image_url = $(".image-and-ads img").attr("src")
  }
}
module.exports = FashionLadyPurifier
