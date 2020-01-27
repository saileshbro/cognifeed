const Purifier = require("../Purifier")
const cheerio = require("cheerio")

class ScienceDailyPurifier extends Purifier {
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
    this.title = $("h1#heading.heading").text()
    this.description = $("dd#abstract")
      .text()
      .substr(0, 500)
    this.image_url = this.url + $("div#story_photo .photo-image img").attr("src")
  }
}
module.exports = ScienceDailyPurifier
