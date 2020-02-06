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
    this.description = ""
    $(".entry-content p").each((i, e) => {
      if (i < 5) {
        this.description += $(e)
          .text()
          .trim()
      }
    })
    this.description = this.description.substr(0, 500)
    if ($(".post-image-container img").attr("src") !== undefined)
      this.image_url = $(".post-image-container img").attr("src")
  }
}
module.exports = LoveIsRespectPurifier
