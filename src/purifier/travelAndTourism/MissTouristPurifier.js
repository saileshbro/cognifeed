const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class MissTouristPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Miss Tourist"
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".entry-title").text()
    this.description = $("div.wpb_wrapper")
      .find("p")
      .eq(2)
      .text()
      .substr(0, 500)
    this.image_url = this.url.baseURL + $("img[class*='wp-image']").attr("src")
  }
}
module.exports = MissTouristPurifier
