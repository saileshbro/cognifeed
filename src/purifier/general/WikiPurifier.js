const cheerio = require("cheerio")
const Purifier = require("../Purifier")

class WikiPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {String} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "Wikipedia"
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("#firstHeading").text()
    this.description = $("#mw-content-text .mw-parser-output p")
      .not("p .mw.empty-elt")
      .text()
      .substr(0, 500)
    this.image_url = $(".infobox td a img").attr("src")
  }
}

module.exports = WikiPurifier
