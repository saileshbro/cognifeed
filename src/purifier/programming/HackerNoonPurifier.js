const Purifier = require("../Purifier")
const cheerio = require("cheerio")
class HackerNoonPurifier extends Purifier {
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
    this.title = $(".story-container .title")
      .text()
      .trim()
    this.description = ""
    $(".story-container .content .paragraph").each((i, e) => {
      if (i !== 0 && i < 5) {
        this.description += $(e).text()
      }
    })
    this.description = this.description.substr(0, 500)
    if (
      $(".story .content")
        .find("img")
        .attr("src") !== undefined
    )
      this.image_url = $(".story .content")
        .find("img")
        .attr("src")
  }
}
module.exports = HackerNoonPurifier
