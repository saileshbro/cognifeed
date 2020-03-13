const Article = require("../Article")
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class SeriousEatsPurifier extends Purifier {
  // static baseUrl = "https://iamafoodblog.com/";

  /**
   *
   * @param{String} html
   * @param{Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Serious Eats"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("div.entry-header-inner .title")
      .text()
      .trim()

    this.description = $(".entry-body p")
      .slice(1, 3)
      .text()
      .substr(0, 500)
    this.image_url = $("meta[property='og:image']")
      .eq(0)
      .attr("content")

    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }
}
module.exports = SeriousEatsPurifier
