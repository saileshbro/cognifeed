const Article = require("../Article")
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class LittleOldLadyComedyPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Little old Lady Comedy"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("article[id*='post'] h1")
      .text()
      .trim()
    $(".entry-content p>strong").remove()
    this.description = $(".entry-content p")
      .slice(1, 3)
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
module.exports = LittleOldLadyComedyPurifier
