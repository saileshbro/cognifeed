const Article = require("../Article")
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class LiveSciencePurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "HowStuffWorks"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".container .row h1")
      .text()
      .trim()
    this.image_url = cheerio
      .load($(".media-hero-wrap>figure>noscript").text())("img")
      .attr("src")
    this.description = $("article p")
      .slice(2, 4)
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
module.exports = LiveSciencePurifier
