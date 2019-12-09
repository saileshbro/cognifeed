"use strict"

/**
 * The links-collection module
 * @module src/scraper/links-collection
 */

/** 
 * A collection of Link objects
 * @class
 */
class LinksCollection {
  /**
   * Create a new Link Collection
   * @returns {LinksCollection} - A new LinkCollection object
   * @static
   */
  static create() {
    return new LinksCollection([])
  }

  [Symbol.iterator]() {
    return new LinksCollectionIterator(this._links)
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
    return new LinksCollection(this._links.filter(ln => 
      ln.resolve() !== link.resolve()))
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

  get size() {
    console.log(`real size: ${this._links.length}`)
    return this._links.length
  }

  /** 
   * The constructor is private
   */
  constructor(links = []) {
    /** 
     * The data structure used to store links
     * @type {Link[]}
     * @private
     */
    if (!isIterable(links))
      throw new Error("TypeError: argument not an iterable")
    this._links = [...links]
  }
}

class LinksCollectionIterator {
  next() {
    if (++this._index === this._size) return { done: true }
    return { value: this._links[this._index], done: false }
  }

  constructor(links) {
    this._links = links
    this._index = 0
    this._size = links.length
  }
}

function isIterable(obj) {
  if (obj == null) return false
  return typeof obj[Symbol.iterator] === "function"
}

module.exports = LinksCollection
