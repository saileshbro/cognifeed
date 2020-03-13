const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Article = require("../Article")
const Link = require("../../scraper/link")
class AboveTheHimalayaPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "ABout the Himalaya"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("article.blog-post-details .blog-post-txt h1")
      .text()
      .trim()
    this.image_url = $("article .wp-post-image").data("lazy-src")
    this.description = $("article.blog-post-details .blog-post-txt p")
      .text()
      .replace("\n", "")
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
module.exports = AboveTheHimalayaPurifier
