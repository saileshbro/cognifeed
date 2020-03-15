const Article = require("../Article")
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
    this.website = "Cinema Blend"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".story_title h1")
      .text()
      .trim()

    if ($(".text-body p")[0]) $(".text-body p")[0].remove()
    this.description = $(".text-body p").text()

    this.description = this.description.substr(0, 500)
    this.image_url = $(".content_story_pages_image figure>img").attr("src")
    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }
}
module.exports = CinemaBlendPurifier
