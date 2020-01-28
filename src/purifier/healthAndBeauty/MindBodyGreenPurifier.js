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
    this.title = $(".news-article header>h1")
      .text()
      .trim()
    this.image_url = $("section.content-wrapper div.box>img").attr("src")
    this.description = $("div#article-body p")
      .text()
      .substr(0, 500)
  }
}
module.exports = MindBodyPurifier
