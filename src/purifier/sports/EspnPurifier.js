const Purifier = require("../Purifier")
const cheerio = require("cheerio")
const Link = require("../../scraper/link")

class EspnPurifier extends Purifier {
  // static baseUrl = "https://www.espn.in/"

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
    this.title = $(".article-header h1").text()
    this.description = ""
    $(".article-body > p").each((i, e) => {
      if (i != 0 && i < 5) {
        this.description += $(e).text()
      }
    })

    const urls = $(".inline.inline-photo.full figure>picture")
      .find("source")
      .data()
    if (urls) {
      this.image_url = urls.srcset
        .split(",")[1]
        .replace(" 2x", "")
        .trim()
    }
  }
}
module.exports = EspnPurifier
