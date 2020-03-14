const Purifier = require("../Purifier")
const Article = require("../Article")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class PopSciPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "PopSci"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".article_title")
      .text()
      .trim()

    this.description = $("section.content p")
      .text()
      .substr(0, 500)

    this.image_url = $("meta[property='og:image']")
      .eq(0)
      .attr("content")
    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }
}
module.exports = PopSciPurifier
