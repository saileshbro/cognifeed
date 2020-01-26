const axios = require("axios")
const baseUrl = "http://127.0.0.1:" + process.env.PORT

/**
 * Abstract Class Purifier
 */
class Purifier {
  /**
   * @field title
   * @field imageUrl
   * @field description
   * @field link_url
   */

  /**
   *
   * @param {String} html
   * @param {string} url
   */
  constructor(html, url) {
    ;(this.html = html), (this.url = url)
    this.link_url = this.url
    this.image_url = "defaultimage.png"
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
        image_url: this.image_url
      }
      const response = await axios.post(`${baseUrl}/api/purifier/persist`, payload)
      console.log(response.data)
    } catch (error) {
      console.error(error.response.data)
    }
  }

  /**
   * Convert object to string
   */
  toString() {
    return {
      title: this.title,
      image_url: this.image_url,
      description: this.description,
      link_url: this.link_url
    }
  }
}
module.exports = Purifier
