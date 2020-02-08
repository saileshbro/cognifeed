/* eslint-disable no-undef */
/* eslint-disable linebreak-style */
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const eq = require("cheerio-eq")
const Link = require("../../scraper/link")

class CBRPurifier extends Purifier {
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
    this.title = $("h1.article-title[itemprop='headline']")
      .text()
      .trim()

    this.image_url = $(
      "div.responsive-img.img-article-featured>picture>source"
    ).attr("srcset")

    const des = eq($, "section.article-body>p:eq(0)")
    this.description = $("section.article-body>p")
      .not(des)
      .text()
      .split("\n")
      .map(str => str.trim())
      .join("")
      .substr(0, 500)
  }
}
module.exports = CBRPurifier
