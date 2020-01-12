"use strict"

/**
 * The server module. This module is supposed to throttle
 * The spawning of spiders
 * @module src/scraper/server
 */

/**
 * The Link object
 * @typedef {object} Link
 * @property {string} _baseURL - The base url of the link
 * @property {string} _path = The path slug
 */

const LinksCollection = require("./links-collection")
const Filter = require("./filter")
const Spider = require("./spider")

/**
 * @class
 */
class Server {
  /**
   * Start the spider-spawning server
   * This method is asynchronous and doesn't return any value
   */
  start() {
    /**
     * The timeout object returned by setInterval, used to clear the interval
     * @type {object}
     * @private
     */
    this._timeout = setInterval(async () => {
      let spider
      let links = this._links
      let link = links.getLink(0)

      try {
        spider = await this._spawnSpider(link)
      } catch (err) {
        throw new Error(err.message)
      }

      this._spiders = this._spiders.concat(spider)

      try {
        links = await spider.getNewLinks()
      } catch (err) {
        console.log(err.message)
        clearInterval(this._timeout)
      }

      this._links = this._filter.getOriginalLinks(links).removeLink(link)
      console.log(this._links)
    }, 2000)
  }

  /**
   * Stops the server
   */
  stop() {
    clearInterval(this._timeout)
  }

  /**
   * This method spawns a new spider to visit given link
   * @param {Link} url - The seed link to visit
   * @returns {Promise<Spider>} - Promise object represents a spider
   * @private
   */
  _spawnSpider(url) {
    return new Promise((resolve, reject) => {
      let spider

      try {
        spider = Spider.spawn(url)
      } catch (err) {
        reject(err)
      }

      resolve(spider)
    })
  }

  /**
   * Create a new Server object
   */
  constructor() {
    /**
     * The LinksCollection object used to hold links to traverse
     * @private
     * @type {LinksCollection}
     */
    this._links = LinksCollection.create()
    /**
     * The filter object filters out all visited and duplicate links
     * @private
     * @type {Filter}
     */
    this._filter = new Filter()
    /**
     * The collection of all spiders currently visiting a page
     * @private
     * @type {Spider[]}
     */
    this._spiders = []
  }
}

module.exports = Server
