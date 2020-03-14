const Purifier = require("../Purifier")
const Article = require("../Article")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class CodingAlphaPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "CodingAlpha"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".entry-header>.entry-title")
      .text()
      .trim()
    this.description = ""
    $(".entry-content p.mainbody").each((i, e) => {
      if (i != 0 && i < 5) {
        this.description += $(e).text()
      }
    })
    this.description = this.description.substr(0, 500)
    if ($("img[class*='wp-image']").attr("src") !== undefined)
      this.image_url = $("img[class*='wp-image']").attr("src")
    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }
}
module.exports = CodingAlphaPurifier
