"use strict"

const { URL } = require("url")

/**
 * Link module
 * @module utils/Link
 */
/**
 * An abstraction of a link
 * @class
 * @param {string} baseURL - The base URL of the link
 * @param {string} path - The path of the link
 * @returns {Link} - A new Link object
 */
module.exports = class Link {
  /**
   * Resolve the current link object into a link URL string
   * @returns {string} - A link href string
   */
  resolve() {
    return new URL(this._path, this._baseURL).href
  }

  /**
   * Getter to get the value of this._baseURL
   * @returns {string}
   */
  get baseURL() {
    return this._baseURL
  }

  /**
   * Getter to get the value of this._path
   * @returns {string}
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
