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
