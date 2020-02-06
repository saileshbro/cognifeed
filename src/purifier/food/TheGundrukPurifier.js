const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class TheGundrukPurifier extends Purifier {
  // static baseUrl = "https://TheGundruk.com/";

  /**
   *
   * @param{String} html
   * @param{Link} url
   */
  constructor(html, url) {
    super(html, url)
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".entry-title")
      .text()
      .trim()
    this.description = $(".entry-content p")
      .text()
      .trim()
      .substr(0, 500)

    this.image_url = $(".wp-post-image").attr("src")
  }
}
module.exports = TheGundrukPurifier
