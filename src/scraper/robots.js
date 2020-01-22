"use strict"

/**
 * This module deals with fetching and returning
 * a program consumable version of robots.txt file.
 * @module src/scraper/robots
 */

/**
 * A bundle representing the collection of a link and its robots.txt string
 * @typedef {object} LinkRobotBundle
 * @property {string} link - The base url for the website of the _robotsTXT
 * @property {string} robotsTXT - The robots.txt string for the _link
 */

const reqProm = require("request-promise-native")
const roboParser = require("robots-parser")
const Link = require("./link")

class RobotsParser {
  /**
   * Check whether the given url is scrapable by the optional user-agent
   * @param {Link} link - The url to test for scrapability
   * @param {string} [userAgent = *] - The user-agent to test for scrapability
   * @returns {boolean}
   */
  isDisallowed(link, userAgent = "*") {
    return this._parser.isDisallowed(link.resolve(), userAgent)
  }

  /**
   * Get the crawl delay of the url for a given user-agent
   * @param {string} [userAgent = *] - The bot to test for
   * @returns {number}
   */
  getCrawlDelay(userAgent = "*") {
    return this._parser.getCrawlDelay(userAgent)
  }

  /**
   * The constructor for RobotsParser class
   * @param {Link} link - The url to which the robots.txt string belongs
   * @param {string} robotsTXT - The robots.txt string of the url
   */
  constructor(link, robotsTXT) {
    /**
     * The link pbject for which to fetch the robots.txt document
     * @type {string}
     * @private
     */
    this._url = new Link(link.baseURL, "robots.txt").resolve()

    /**
     * The rotots.txt parser from "robots-parser"
     * @type {object}
     * @private
     */
    this._parser = roboParser(this._url, robotsTXT)
  }
}

/**
 * A cache for the robots.txt files.
 * This cache is maintained to avoid re-requesting robots.txt for a site
 * @class
 */
class RobotsCache {
  /**
   * Update the existing cache with new link and its corresponding
   * robots.txt string
   * @param {Link} link - The link for the robots.txt string
   * @param {string} robotsTXT - The robots.txt string for the link
   * @returns {undefined} - No return value
   */
  update(link, robotsTXT) {
    if (link.baseURL === undefined) throw new Error("Invalid link!")
    if (typeof robotsTXT !== "string") throw new Error("Invalid robots.txt!")

    this._cache.push({
      /**
       * @type {Link} - The baseURL of the given link
       */
      link,
      /**
       * @type {string} - The robots.txt string for the given link
       */
      robotsTXT
    })
  }

  /**
   * Check whether the robots.txt for giben link already exists
   * @param {Link} link - The link object for the required url
   * @returns {LinkRobotBundle|undefined}
   */
  findRobotFor(link) {
    for (let elem of this._cache) {
      if (elem.link.hasSameBaseURLAs(link)) return elem.robotsTXT
    }
    return undefined
  }

  constructor() {
    /**
     * This property holds the bundle of link and robots.txt for the given link
     * @type {LinkRobotBundle[]}
     * @private
     */
    this._cache = []
  }
}

module.exports.RobotsParser = RobotsParser
module.exports.RobotsCache = RobotsCache
