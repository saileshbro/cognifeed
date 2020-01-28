/* eslint-disable linebreak-style */
const Purifier = require("../Purifier")
const cheerio = require("cheerio")

class MindBodyPurifier extends Purifier {
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
    this.title = $("div.article-header div.article-headline>h1.article-headline__text")
      .text()
      .trim()
    this.image_url = $("div.article-image__inner>figure>picture img").attr("data-src")
    this.description = $("div.article-text div.article-text__inner>p")
      .text()
      .substr(0, 500)
  }
}
module.exports = MindBodyPurifier
