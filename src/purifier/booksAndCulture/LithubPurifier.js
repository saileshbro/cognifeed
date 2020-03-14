const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
const Article = require("../Article")

class LithubPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Lithub"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".post_header_wrapper h1.post_title")
      .text()
      .trim()
    this.image_url = $(".sidebar_content .post_img.main_img img").attr("src")
    this.description = $(".post_inner_wrapper span[itemprop='articleBody']>p")
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
module.exports = LithubPurifier
