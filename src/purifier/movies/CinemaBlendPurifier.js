const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")
class CinemaBlendPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".story_title h1")
      .text()
      .trim()

    $(".text-body p")[0].remove()
    this.description = $(".text-body p").text()

    this.description = this.description.substr(0, 500)
    this.image_url = $(".content_story_pages_image figure>img").attr("src")
  }
}
module.exports = CinemaBlendPurifier
