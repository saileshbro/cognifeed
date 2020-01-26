const Purifier = require("../Purifier")
const cheerio = require("cheerio")
class YahooSportsPurifier extends Purifier {
  // static baseUrl = "https://sports.yahoo.com/"
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
    this.title = $("header h1").text()
    this.description = $("article p")
      .text()
      .substr(0, 100)
    this.image_url = $("figure.canvas-image div>img").attr("src")
  }
}

module.exports = YahooSportsPurifier
