"use strict"

/**
 * Module for filtering out duplicate links
 * @module src/scraper/filter
 */

/**
 * Filters out duplicate items from a collection
 * @param {LinksCollection} oldCol - The old collection to be updated
 * @param {LinksCollection} newCol - The new collection to be checked for dups
 * @returns {LinksCollection}
 */
module.exports = function(oldCol, newCol) {
  let collection = oldCol
  for (let item of newCol) {
    if (!collection.hasLink(item)) {
      collection = collection.addLinks(item)
    }
  }
  return collection
}
