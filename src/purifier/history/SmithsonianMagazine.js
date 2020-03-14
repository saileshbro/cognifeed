const Article = require("../Article")
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class SmithsonianMagazine extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Smithsonian Magazine"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("main .article-header .headline")
      .text()
      .trim()
    this.description = $(".article-body p")
      .text()
      .substr(0, 500)
    this.image_url = $(".article-image span>span").data("src")
    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }
}
module.exports = SmithsonianMagazine
