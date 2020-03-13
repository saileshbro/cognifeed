const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
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
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".article__headline").text()
    this.description = $(".article__body-text")
      .text()
      .substr(0, 500)
    this.image_url = $(".article__lead-image")
      .find("img")
      .attr("src")
  }
}
module.exports = EconomistsPurifier
