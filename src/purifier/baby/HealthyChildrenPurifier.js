/* eslint-disable no-undef */
/* eslint-disable linebreak-style */
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const eq = require("cheerio-eq")
const Link = require("../../scraper/link")
const Article = require("../Article")

class HealthyChildrenPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Healthy Children"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("div#read_content>h1.page-title")
      .text()
      .trim()

    this.image_url =
      this.url._baseURL + $("div.article-image>span>img").attr("src")

    const des = eq(
      $,
      "div#ctl00_cphPageContent_ctl00__ControlWrapper_RichHtmlField>p:eq(0)"
    )
    this.description = $("div.ms-rtestate-field>p")
      .not(des)
      .text()
      .split("\n")
      .map(str => str.trim())
      .join("")
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
module.exports = HealthyChildrenPurifier
