const Purifier = require("../Purifier")
const Article = require("../Article")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class HelpWritersBecomePurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "HelpWritersBecomeAuthors"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".entry-title")
      .text()
      .trim()
    $(".entry-content p noscript").remove()
    this.description = $(".entry-content p")
      .text()
      .substr(0, 500)

    this.image_url = $("img.post-image").attr("src")
    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }
}
module.exports = HelpWritersBecomePurifier
