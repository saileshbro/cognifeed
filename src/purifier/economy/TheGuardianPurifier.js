const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class TheGuardianPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".content__headline")
      .text()
      .trim()
    this.description = ""
    $(".content__article-body>p").each(
      (i, e) =>
        (this.description += $(e)
          .text()
          .replace("\n", ""))
    )
    this.description = this.description.substr(0, 500)
    if (
      $(".article__img-container")
        .find("img")
        .attr("src") != undefined
    ) {
      this.image_url = $(".article__img-container")
        .find("img")
        .attr("src")
    }
  }
}
module.exports = TheGuardianPurifier
