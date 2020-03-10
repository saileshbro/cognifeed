const axios = require("axios")
const baseUrl = "http://127.0.0.1:" + process.env.PORT
const Link = require("../scraper/link")
/**
 * Abstract Class Purifier
 */
class Purifier {
  /**
   * Purify the html string into an Article object
   */
  purify() {
    throw new Error("Purifier Error! Abstract Method!")
  }

  /**
   * Persist the purified article to a database
   */
  async persistPurified() {
    const payload = {
      title: this.title,
      description: this.description,
      image_url: this.image_url
    }

    try {
      await axios.post(`${baseUrl}/api/purifier/persist`, payload)
    } catch (error) {
      console.error(error.response.data)
      throw new Error("Purifier Error! Could not persist data to database.")
    }
  }

  /**
   * Returns the article as an object
   * @returns {object}
   */
  getArticle() {
    return {
      title: this.title,
      image_url: this.image_url,
      description: this.description,
      link_url: this.link_url
    }
  }

  /**
   *
   * @param {string} html
   * @param {Link} url
   */
  constructor(html, url) {
    this.html = html
    this.url = url
    this.link_url = this.url.resolve()
    this.image_url = "defaultimage.png"
    this.title = ""
    this.description = ""
  }
}

module.exports = Purifier
