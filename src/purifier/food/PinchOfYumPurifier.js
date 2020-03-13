const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class PinchOfYumPurifier extends Purifier {
  // static baseUrl = "https://pinchofyum.com/";

  /**
   *
   * @param{String} html
   * @param{Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Pinch of yum"
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".entry-title")
      .text()
      .trim()
    this.image_url = $("img[class*='wp-image']").attr("src")
    this.description = $(".entry-content p")
      .slice(1, 4)
      .text()
      .trim()
      .substr(0, 500)
  }
}
module.exports = PinchOfYumPurifier
