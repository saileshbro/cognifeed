const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class MentalFlossPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Mental Floss"
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".main-headline").text()
    this.description = ""
    $(".article-body>p").each((i, e) => {
      if (i != 0) this.description += $(e).text()
    })
    this.description = this.description.substr(0, 500)
    if (
      $(".hero-image-section")
        .find("img")
        .attr("src") != undefined
    ) {
      this.image_url = $(".hero-image-section")
        .find("img")
        .attr("src")
    }
  }
}
module.exports = MentalFlossPurifier
