const Purifier = require("../Purifier")
const cheerio = require("cheerio")
class WebDevBlogPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {String} url
   */
  constructor(html, url) {
    super(html, url)
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("header.entry-header h1.entry-title")
      .text()
      .trim()
    this.description = ""
    $("article div.entry-content p").each((i, e) => {
      if (i < 5) {
        this.description += $(e).text()
      }
    })
    this.description = this.description.substr(0, 500)
    if (
      $("article[id*=post] picture")
        .find("img")
        .attr("src") !== undefined
    )
      this.image_url = $("article[id*=post] picture")
        .find("img")
        .attr("src")
  }
}
module.exports = WebDevBlogPurifier
