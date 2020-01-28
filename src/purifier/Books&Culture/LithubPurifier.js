/* eslint-disable linebreak-style */
const Purifier = require("../Purifier")
const cheerio = require("cheerio")

class LithubPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {String} url
   */
  constructor(html, url) {
    super(html, url)
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".post_header_wrapper h1.post_title")
      .text()
      .trim()
    this.image_url = $(".sidebar_content .post_img.main_img img").attr("src")
    this.description = $(".post_inner_wrapper span[itemprop='articleBody']>p")
      .text()
      .substr(0, 500)
  }
}
module.exports = LithubPurifier
