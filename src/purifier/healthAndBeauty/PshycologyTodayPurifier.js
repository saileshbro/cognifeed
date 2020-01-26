const Purifier = require("../Purifier")
const cheerio = require("cheerio")

class PshycologyTodayPurifier extends Purifier {
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
    this.title = $("blog_entry--full__title").text()
    this.description = ""
    $(".field.field-name-body.field-type-text-with-summary>p").each(
      (i, e) => (this.description += $(e).text())
    )
    this.description = this.description.substr(0, 500)
    this.image_url = $(".insertArea")
      .find("img")
      .attr("src")
  }
}
module.exports = PshycologyTodayPurifier
