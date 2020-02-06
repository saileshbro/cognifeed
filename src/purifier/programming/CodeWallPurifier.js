const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class CodeWallPurifier extends Purifier {
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
    this.title = $("article[class*='post']>.entry-header>.entry-title")
      .text()
      .trim()
    this.description = ""
    $(".entry-content p.mainbody").each((i, e) => {
      if (i != 0 && i < 5) {
        this.description += $(e).text()
      }
    })
    this.description = this.description.substr(0, 500)
    if ($("img[class*='wp-image']").attr("src") !== undefined)
      this.image_url = $("img[class*='wp-image']").attr("src")
  }
}
module.exports = CodeWallPurifier
