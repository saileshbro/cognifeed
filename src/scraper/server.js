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
const RobotsParser = require("./robots")

/**
 * @class
 */
class Server {
  /**
   * Start the spider-spawning server
   * This method is asynchronous and doesn't return any value
   * @param {Link[]} seeds - The seed links to start the server with
   */
  start(seeds) {
    // Add initial seed links to the state
    this._links = this._links.addLinks(seeds)

    /**
     * The timeout object returned by setInterval, used to clear the interval.
     * There is only one timeout object per interval set
     * @type {object}
     * @private
     */
    this._timeout = setInterval(async () => {
      let spider, newLinks
      let link = this._links.getLink(0)

      // If there is no active link,
      // don't run the rest of the code
      if (!link) return

      this._links = this._links.removeLink(link)

      try {
        spider = await this._spawnSpider(link)
      } catch (err) {
        return console.log(err.message)
      }

      this._spiders = this._spiders.concat(spider)

      try {
        newLinks = await spider.getNewLinks()
      } catch (err) {
        this._spiders = this._spiders.filter(s => !s.link.matches(spider.link))
        return console.log(err.message)
      }

      this._links = this._filter.getOriginalLinks(newLinks)
      this._spiders = this._spiders.filter(s => !s.link.matches(spider.link))
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
      let robotsParser = new RobotsParser(url.baseURL)

      if (robotsParser.isAllowed()) {
        try {
          spider = Spider.spawn(url)
        } catch (err) {
          reject(err)
        }
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
    /**
     * The collection robots.txt parsers
     * @private
     * @type {RobotsParser[]}
     */
    this._robotsParsers = []
  }
}

module.exports = Server
