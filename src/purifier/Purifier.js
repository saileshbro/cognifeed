const axios = require("axios")
const baseUrl = "http://127.0.0.1:" + process.env.PORT

/**
 * Abstract Class to define interface for the Purifier
 * @module src/purifier/Purifier
 */

const Link = require("../scraper/link")
const Article = require("./Article")

class Purifier {
  /**
   * Purify the html string into an Article object
   * @returns {Article}
   */
  purify() {
    throw new Error("Purifier Error! Abstract Method!")
  }

  /**
   * Persist the purified article to a database
   * @param {Article} article - The article object to persist
   */
  async persistPurified(article) {
    try {
      await axios.post(`${baseUrl}/api/articles`, article)
    } catch (error) {
      throw new Error(
        `Purifier Error! Could not persist to database, ${error.message}.`
      )
    }
  }

  /**
   * Returns the article as an object
   * @returns {object}
   */
  getArticle() {
    return new Article(
      this.title,
      this.description,
      this.website,
      this.image_url,
      this.link_url
    )
  }

  /**
   *
   * @param {string} html
   * @param {Link} url
   */
  constructor(html, url) {
    /**
     * @type {string} - The HTML string
     * @private
     */
    this.html = html
    /**
     * @type {string} - The url of the HTML string
     * @private
     */
    this.url = url
    /**
     * @type {string}
     * @private
     */
    this.link_url = this.url.resolve()
    /**
     * @type {string} - The url for the extracted image
     * @private
     */
    this.image_url = "public/images/imagenotfound.png"
    /**
     * @type {string} - The title of the extracted article
     * @private
     */
    this.title = ""
    /**
     * @type {string} - The article summary
     * @private
     */
    this.description = ""
    /**
     * @type {string} - The website base URL
     * @private
     */
    this.website = ""
  }
}

module.exports = Purifier
