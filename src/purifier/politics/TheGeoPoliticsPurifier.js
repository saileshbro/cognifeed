const Article = require("../Article")
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class TheGeoPoliticsPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "The GeoPloitics"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("header h1.entry-title")
      .text()
      .trim()

    this.description = $(".td-post-content")
      .text()
      .substr(0, 500)

    this.image_url = $(".td-post-featured-image img").attr("src")
    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }
}
module.exports = TheGeoPoliticsPurifier
