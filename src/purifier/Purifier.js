const axios = require("axios")
const baseUrl = "http://127.0.0.1:" + process.env.PORT

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
    ; (this.html = html), (this.url = url)
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
    try {
      const payload = {
        title: this.title,
        description: this.description,
        image_url: this.image_url.replace("//", ""),
        link_url: this.url
      }
      const response = await axios.post(`${baseUrl}/api/purifier/persist`, payload)
      console.log(response.data)
    } catch (error) {
      console.error(error)
    }
  }
}
module.exports = Purifier
