const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class ArsTechnicaPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "ArsTechnical"
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("h1[itemprop='headline']")
      .text()
      .trim()

    this.description = $(".article-content p")
      .slice(1, 3)
      .text()
      .substr(0, 500)

    this.image_url = $("meta[property='og:image']")
      .eq(0)
      .attr("content")
  }
}
module.exports = ArsTechnicaPurifier
