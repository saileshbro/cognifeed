const Article = require("../Article")
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class PhilosophyForLifePurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Philosopy for life"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".entry-title")
      .text()
      .trim()

    this.description = $(".entry-content p")
      .text()
      .substr(0, 500)

    this.image_url = $("meta[property='og:image']")
      .eq(0)
      .attr("content")
    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }
}
module.exports = PhilosophyForLifePurifier
