const Article = require("../Article")
/* eslint-disable linebreak-style */
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class BounceBackParentingPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Bounce Back Parenting"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("header.entry-header>h1.entry-title")
      .text()
      .trim()

    if ($("img[class*='wp-image']").attr("src") !== undefined)
      this.image_url = $("img[class*='wp-image']").attr("src")

    this.description = $("div.entry-content>p")
      .text()
      .substr(0, 500)
    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }
}
module.exports = BounceBackParentingPurifier
