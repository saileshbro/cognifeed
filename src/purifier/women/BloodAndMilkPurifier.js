const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class BloodAndMilkPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Blood And Milk"
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("div.content div.article-top>h1")
      .text()
      .trim()
    this.image_url = $("div.intro-image img").attr("src")
    this.description = $("div.content>p")
      .text()
      .substr(0, 500)
  }
}
module.exports = BloodAndMilkPurifier
