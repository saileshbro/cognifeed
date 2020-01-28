const Purifier = require("../Purifier")
const cheerio = require("cheerio")
class iamfoodblogPurifier extends Purifier {
  // static baseUrl = "https://iamafoodblog.com/";

  /**
   *
   * @param{String} html
   * @param{string} url
   */
  constructor(html, url) {
    super(html, url)
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = $(".post-title").text()
    this.description = ""
    $(".post-container p").each((index, element) => {
      this.description += $(element).text()
    })
    this.description = this.description.substr(0, 500)
    this.image_url = $("#main-image.article-image>img.wp-post-image").attr("src")
  }
}
module.exports = iamfoodblogPurifier
