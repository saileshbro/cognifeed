const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class BeautyTipsPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Beauty Tips"
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("div.main>h1")
      .text()
      .trim()
    this.image_url = this.url._baseURL + $("div.main>img").attr("src")
    this.description = $("div.main")
      .find("p")
      .text()
      .trim()
      .substr(0, 500)
      .replace("\n", "")
      .replace("\t", "")
      .replace("     ", "")
      .replace(". \n", "")
      .replace("   \t", "")
  }
}
module.exports = BeautyTipsPurifier
