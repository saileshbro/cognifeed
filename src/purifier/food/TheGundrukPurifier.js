const Article = require("../Article")
const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class TheGundrukPurifier extends Purifier {
  // static baseUrl = "https://TheGundruk.com/";

  /**
   *
   * @param{String} html
   * @param{Link} url
   */
  constructor(html, url) {
    super(html, url)
    this.website = "The Gundruk"
  }
  /**
   * @returns {Article}
   */
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".entry-title")
      .text()
      .trim()
    this.description = $(".entry-content p")
      .text()
      .trim()
      .substr(0, 500)

    this.image_url = $(".wp-post-image").attr("src")

    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }
}
module.exports = TheGundrukPurifier
