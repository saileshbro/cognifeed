const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class TravelTourismNowPurifier extends Purifier {
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
    this.title = $(".post-content container .post-title-container h3.entry_title")
      .text()
      .trim()
    this.image_url = $("div[id*='post-body'] div.seperator>a>img").attr("src")
    this.description = $("div.post-body.entry_content#post-body-7954336653691802289")
      .text()
      .substr(0, 500)
  }
}
module.exports = TravelTourismNowPurifier
