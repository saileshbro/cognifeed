/**
 * Abstract Class Purifier
 */
class Purifier {
  /**
   *
   * @param {String} html
   * @param {Stringn} url
   */
  constructor(html, url) {
    ;(this.html = html), (this.url = url)
  }
  /**
   * Implementation required
   */
  purify() {
    throw new Error("You have to implement the method purify()!")
  }
  /**
   * Implementation required
   */
  async persistPurified() {
    throw new Error("You have to implement the method persistPurified()!")
  }
}
module.exports = Purifier
