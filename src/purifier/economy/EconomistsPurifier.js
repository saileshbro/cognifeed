const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
const Article = require("../Article")
class EconomistsPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Economists"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".article__headline").text()
    this.description = $(".article__body-text")
      .text()
      .substr(0, 500)
    this.image_url = $(".article__lead-image")
      .find("img")
      .attr("src")

    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }
}
module.exports = EconomistsPurifier
