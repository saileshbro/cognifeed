const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class HuffPostPurifier extends Purifier {
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
    this.title = $(".headline__title")
      .text()
      .trim()
    this.image_url = $("meta[property='og:image']")
      .eq(0)
      .attr("content")
    this.description = ""
    $(".content-list-component p").each((i, e) => {
      if (i !== 0 && i < 5)
        this.description += $(e)
          .text()
          .trim()
    })
  }
}
module.exports = HuffPostPurifier
