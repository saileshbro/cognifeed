const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class LoveIsRespectPurifier extends Purifier {
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
    this.title = $(".title-bar .entry-title")
      .text()
      .trim()
    $(".entry-content p strong").remove()

    this.description = $("div.entry-content p")
      .slice(1, 5)
      .text()
      .split("\n")
      .join("")
      .substr(0, 500)
    if ($(".post-image-container img").attr("src") !== undefined)
      this.image_url = $(".post-image-container img").attr("src")
  }
}
module.exports = LoveIsRespectPurifier
