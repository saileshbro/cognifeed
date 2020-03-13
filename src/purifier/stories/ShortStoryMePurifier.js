const Article = require("../Article")
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class ShortStoryMe extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "ShortStorrMe"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("div.page-header h1[itemprop='headline']")
      .text()
      .trim()
    this.image_url =
      this.url.baseURL +
      $(".item-page .item-image")
        .find("img")
        .attr("src")
    this.description = $("div[itemprop='articleBody']")
      .text()
      .split("\n")
      .map(str => str.trim())
      .join("")
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
module.exports = ShortStoryMe
