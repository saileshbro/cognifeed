const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class PhilosophyForLifePurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".BlogItem-title")
      .text()
      .trim()

    this.description = $(".sqs-block-content p")
      .text()
      .substr(0, 500)

    this.image_url = cheerio
      .load($(".image-block noscript").text())("img")
      .attr("src")
  }
}
module.exports = PhilosophyForLifePurifier
