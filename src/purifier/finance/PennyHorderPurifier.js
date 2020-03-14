const Article = require("../Article")
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class PennyHorderPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Penny Holder"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("div.single-post-title>h1")
      .text()
      .trim()
    const img = $("div.single-post-image>div>img").attr("data-srcset")
    this.image_url = img.substr(0, img.indexOf(" "))

    this.description = $("div.single-post-content-inner>p>span")
      .text()
      .substr(0, 500)

    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }
}
module.exports = PennyHorderPurifier
