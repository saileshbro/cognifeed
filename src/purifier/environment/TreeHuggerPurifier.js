const Article = require("../Article")
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class TreeHuggerPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Tree Hugger"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".c-article header.c-article__header .c-article__headline")
      .text()
      .trim()
    this.image_url = $("article figure.c-article__primary-image")
      .find("img")
      .attr("src")
    this.description = $("article div.c-article__primary-content>p")
      .not("strong")
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
module.exports = TreeHuggerPurifier
