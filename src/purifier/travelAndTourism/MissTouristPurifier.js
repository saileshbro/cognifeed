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
  }
  purify() {
    console.log("hit")
    const $ = cheerio.load(this.html)
    this.title = $(".entry-title").text()
    this.description = $("div.wpb_wrapper")
      .find("p")
      .eq(2)
      .text()
      .substr(0, 500)
    this.image_url =
      this.url.baseURL +
      $("div.wpb_wrapper p")
        .eq(0)
        .find("span img")
        .attr("src")
  }
}
module.exports = MissTouristPurifier
