const Purifier = require("../Purifier")
const cheerio = require("cheerio")

class EconomistsPurifier extends Purifier {
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
