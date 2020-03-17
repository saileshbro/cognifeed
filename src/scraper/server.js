/* eslint-disable linebreak-style */
"use strict"

/**
 * The server module. This module is supposed to throttle
 * The spawning of spiders
 * @module src/scraper/server
 */
const log = require("../helpers/log_to_file")
const Link = require("./link")
const LinksCollection = require("./links-collection")
const getOriginalLinks = require("./filter")
const Spider = require("./spider")
const { RobotsParser, RobotsCache } = require("./robots")
const PurifierFactory = require("../purifier/purifier-factory")

/**
 * @class
 */
class Server {
  /**
   * Start the spider-spawning server
   * This method is asynchronous and doesn't return any value
   * @param {Link|Link[]} seeds - The seed links to start the server with
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
      let spider, newLinks, robotsTXT
      // Get the current link to spawn a spider for
      let link = this._links.getLink(0)

      // If there is no active link,
      // don't run the rest of the code
      if (!link) return

      // Remove the current link from the list
      this._links = this._links.removeLink(link)

      // Get the robots.txt for the given link, if
      // it is not already in the cache
      if ((robotsTXT = this._robotsCache.findRobotFor(link)) === undefined) {
        try {
          robotsTXT = await this._getRobotsTXT(link)
        } catch (err) {
          // Exit if no more links to traverse
          console.error(err.message)
          if (
            err.message.includes("EAI_AGAIN") ||
            err.message.includes("ENOTFOUND")
          ) {
            this._links = this._links.addLinks(link)
            return
          }

          console.log("Setting up default robots.txt")
          robotsTXT = "User-agent: *\nAllow: /"
        }

        // Update cache with new robots.txt
        this._robotsCache.update(link, robotsTXT)
      }

      // Spawn a new spider by respecting the
      // robots.txt file of the website
      try {
        spider = await this._spawnSpider(link, robotsTXT)
      } catch (err) {
        // Exit if no more links to traverse
        console.error(err.message)
        if (this._canExit()) process.exit(2)
        return
      }

      this._spiders = this._spiders.concat(spider)

      // Get new links from the spider
      try {
        newLinks = await spider.getNewLinks()
      } catch (err) {
        // If spider fails, remove it from the array of active spiders
        this._spiders = this._spiders.filter(s => !s.link.matches(spider.link))
        // Exit if no more links to traverse
        console.error(err.message)
        if (this._links.size === 0) process.exit(2)
        return
      }

      // Run the new links through the filter
      // to check for duplicates
      if (this._links.size < 100000)
        this._links = getOriginalLinks(this._links, newLinks)

      // The spider has done its job now,
      // so remove it from the list of active spiders
      this._spiders = this._spiders.filter(s => !s.link.matches(spider.link))

      // Purifier section
      // Create the right purifier for the current link
      let purifier

      // Test for purifier spawning errors
      try {
        purifier = this._purifierFactory.createPurifier(spider.html, link)
      } catch (err) {
        return console.error(err.message)
      }

      log(
        `${this._links.size},${this._spiders.length}`,
        "queue_spider_count.log"
      )
      // This is a side-effects method call
      const article = purifier.purify()

      // Push to database and check for errors
      try {
        await purifier.persistPurified(article)
      } catch (err) {
        return console.error(err.message)
      }
    }, 0)
  }

  /**
   * Stops the server
   */
  stop() {
    clearInterval(this._timeout)
  }

  /**
   * Checks if the server can safely exit
   * @returns {boolean}
   * @private
   */
  _canExit() {
    if (this._spiders.length === 0 && this._links.size === 0) return true
    return false
  }

  /**
   * This method spawns a new spider to visit given link
   * @param {Link} url - The seed link to get robots.txt for
   * @returns {Promise<string>} - Promise object represents the robots string
   * @private
   */
  async _getRobotsTXT(url) {
    let robotsTXT

    try {
      robotsTXT = await require("request-promise-native")(
        new Link(url.baseURL, "robots.txt").resolve()
      )
    } catch (err) {
      log(url.resolve(), "robots_cannot_be_fetched_for_these_websites.log")
      if (err.error.code === "EAI_AGAIN" || err.error.code === "ENOTFOUND") {
        throw new Error(
          `Robots Error! ${
            err.code
          }: Couldn't fetch robots.txt for ${url.resolve()}! Please check the internet connection.`
        )
      }
      throw new Error(
        `Robots Error! Couldn't fetch robots.txt for ${url.resolve()}.`
      )
    }

    return robotsTXT
  }

  /**
   * This method spawns a new spider to visit given link
   * @param {Link} link - The seed link to visit
   * @param {string} robotsTXT - The robots.txt file to check before spawning
   * @returns {Promise<Spider>} - Promise object represents a spider
   * @private
   */
  _spawnSpider(link, robotsTXT) {
    return new Promise((resolve, reject) => {
      let spider, crawlDelay
      let robotsParser = new RobotsParser(link, robotsTXT)

      if (robotsParser.isDisallowed(link))
        return reject(
          new Error(
            `Robots Error! robots.txt disallows traversing url ${link.resolve()}`
          )
        )

      try {
        crawlDelay = Number(robotsParser.getCrawlDelay()) * 1000 || 1000
      } catch (_) {
        return reject(
          new Error("Robots Error! Crawl delay in robots.txt file not a number")
        )
      }

      setTimeout(() => {
        try {
          spider = Spider.spawn(link)
        } catch (err) {
          reject(err)
        }

        resolve(spider)
      }, crawlDelay)
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
     * The collection robots.txt parsers
     * @private
     * @type {RobotsCache[]}
     */
    this._robotsCache = new RobotsCache()

    /**
     * The collection of all spiders currently visiting a page
     * @private
     * @type {Spider[]}
     */
    this._spiders = []

    /**
     * The purifier object used to convert HTML text into objects
     * @private
     * @type {PurifierFactory}
     */
    this._purifierFactory = new PurifierFactory()
  }
}

module.exports = Server
