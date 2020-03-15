"use strict"

const { URL } = require("url")

/**
 * Thie link module
 * @module src/scraper/link
 */

/**
 * An abstraction of a link
 * @class
 */
class Link {
  /**
   * Resolve the current link object into a link URL string
   * @return {string} - A link href string
   */
  resolve() {
    return new URL(this._path, this._baseURL).href
  }

  /**
   * Checks if the current link is the same as the other link
   * @param {Link} link - The other link to test against this link
   * @returns {boolean}
   */
  matches(link) {
    if (!link || !(link instanceof Link)) return false

    if (this._baseURL !== link.baseURL || this._path !== link.path) return false
    return true
  }

  /**
   * Checks if the current link has the same base url as given link
   * @param {Link} link - The other link to test against this link
   * @returns {boolean}
   */
  hasSameBaseURLAs(link) {
    if (this._baseURL === link.baseURL) return true
    return false
  }

  /**
   * Getter to get the value of this._baseURL
   * @return {string}
   */
  get baseURL() {
    return this._baseURL
  }

  /**
   * Getter to get the value of this._path
   * @return {string}
   */
  get path() {
    return this._path
  }

  /**
   * Create a new Link Object
   */
  constructor(baseURL, path = "/") {
    /**
     * The base URL of the link
     * @type {string}
     * @private
     */
    this._baseURL = baseURL
    /**
     * The path of the link
     * @type {string}
     * @private
     */
    this._path = path
  }
}

module.exports = Link
