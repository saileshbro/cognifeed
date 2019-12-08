const Purifier = require("./Purifier")
class WikiPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {String} url
   */
  constructor(html, url) {
    super(html, url)
  }
  purify() {
    console.log("Purified html")
    //   make title
    //   make excrpt
    //   make image
    //   this.url
  }
}
module.exports = WikiPurifier
