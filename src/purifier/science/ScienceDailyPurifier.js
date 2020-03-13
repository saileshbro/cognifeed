const Article = require("../Article")
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class ScienceDailyPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "ScienceDaily"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $("h1#headline.headline").text()
    this.description = $("dd#abstract")
      .text()
      .substr(0, 500)
    this.image_url =
      this.url.baseURL + $("div#story_photo .photo-image img").attr("src")
    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }
}
module.exports = ScienceDailyPurifier
