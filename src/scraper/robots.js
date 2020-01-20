"use strict"

/**
 * This module deals with fetching and returning
 * a program consumable version of robots.txt file.
 * @module src/scraper/robots
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

module.exports = RobotsParser
