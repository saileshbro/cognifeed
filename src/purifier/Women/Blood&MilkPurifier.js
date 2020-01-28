/* eslint-disable linebreak-style */
const Purifier = require("../Purifier")
const cheerio = require("cheerio")

class BloodMilkPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {String} url
   */
  constructor(html, url) {
    super(html, url)
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
module.exports = BloodMilkPurifier
