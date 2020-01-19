"use strict"

/**
 * Module for filtering out duplicate links
 * @module src/scraper/filter
 */

const LinksCollection = require("./links-collection")

/**
 * @class
 */
class Filter {
  /**
   * Get a collection of non-duplicate links from an array of links
   * @param {LinksCollection} links - A links collection
   * @returns {LinksCollection} - A LinkCollection object
   */
  getOriginalLinks(links) {
    for (let link of links) {
      if (!this._links.hasLink(link)) {
        this._links = this._links.addLink(link)
      }
    }
    return this._links
  }

  /**
   * Create a new Filter object
   */
  constructor() {
    /**
     * @type {LinksCollection}
     * @private
     */
    this._links = LinksCollection.create()
  }
}

module.exports = Filter
