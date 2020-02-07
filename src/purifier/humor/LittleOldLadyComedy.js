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
  }
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
  }
}
module.exports = LittleOldLadyComedyPurifier
