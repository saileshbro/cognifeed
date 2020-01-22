"use strict"

/**
 * A collection of links
 * @module utils/LinkCollection
 */

/**
 * @typedef {Object} Link - The link class
 */

/**
 * A collection of links
 * @class
 */
module.exports = class LinksCollection {
  /**
   * Create a new Link Collection
   * @returns {LinksCollection} - A new LinkCollection object
   * @static
   */
  static create() {
    return new LinksCollection([])
  }

  /**
   * Read existing links
   * @returns {string[]} - An array of existing links
   */
  readLinks() {
    return this._links.map(link => link.resolve())
  }

  /**
   * Add a new link
   * @param {Link} link - A link object
   * @returns {LinksCollection} - A new LinkCollcetion
   */
  addLink(link) {
    return new LinksCollection(this._links.concat(link))
  }

  /**
   * Remove an existing link
   * @param {Link} link - A link object
   * @returns {LinksCollection} - A new LinkCollcetion
   */
  removeLink(link) {
    return new LinksCollection(this._links.filter(ln => ln.resolve() !== link.resolve()))
  }

  /**
   * Remove an existing link
   * @param {Link} link - A link object
   * @returns {boolean} - A new LinkCollcetion
   */
  hasLink(link) {
    for (let ln of this._links) {
      if (link.resolve() === ln.resolve()) return true
    }
    return false
  }

  /**
   * The constructor
   * @param {Link[]} links
   * @private
   */
  constructor(links = []) {
    /**
     * The data structure used to store links
     * @type {Link[]}
     * @private
     */
    this._links = [...links]
  }
}
