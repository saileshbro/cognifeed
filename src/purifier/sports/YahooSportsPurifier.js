const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Article = require("../Article")
const Link = require("../../scraper/link")

class YahooSportsPurifier extends Purifier {
  // static baseUrl = "https://sports.yahoo.com/"
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Yahoo Sports"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("header h1").text()
    this.description = $("article p")
      .text()
      .substr(0, 100)
    this.image_url = $("figure.canvas-image div>img").attr("src")
    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }
}

module.exports = YahooSportsPurifier
