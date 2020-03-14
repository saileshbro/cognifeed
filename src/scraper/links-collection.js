/* eslint-disable prettier/prettier */
/* eslint-disable linebreak-style */
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

  /**
   * Read existing links
   * @returns {string[]} - An array of existing links
   */
  readLinks() {
    return this._links.map(link => link.resolve())
  }

  /**
   * Return the link object at the given index
   * @param {number} index - The index of the link
   * @returns {Link} - The link object
   */
  getLink(index) {
    for (let i = 0; i < this._links.length; i++) {
      if (index === i) {
        return this._links[index]
      }
    }
  }

  /**
   * Add a new link
   * @param {Link|Link[]} links - A Link object or an array of Link objects
   * @returns {LinksCollection} - A new LinkCollcetion
   */
  addLinks(...links) {
    return new LinksCollection(this._links.concat(links))
  }

  /**
   * Remove an existing link
   * @param {Link|number} link - A link object
   * @returns {LinksCollection} - A new LinkCollcetion
   */
  removeLink(link) {
    if (this.size === 0) return this

    if (typeof link === "number") {
      return new LinksCollection(this._links.filter((ln, i) => i !== link))
    }
    return new LinksCollection(
      this._links.filter(ln => !ln.matches(link))
    )
  }

  /**
   * Remove an existing link
   * @param {Link} link - A link object
   * @returns {boolean} - A new LinkCollcetion
   */
  hasLink(link) {
    if (this.size === 0) return false

    for (let ln of this._links) {
      return link.matches(ln)
    }
    return false
  }

  get size() {
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
    if (!isIterable(links)) {
      throw new Error("TypeError: argument not an iterable")
    }
    this._links = [...links]
  }

  /**
   * The iterator interface specifier for LinksCollection
   */
  [Symbol.iterator]() {
    return new LinksCollectionIterator(this._links)
  }
}

/**
 * @class
 * @private
 */
class LinksCollectionIterator {
  /**
   * Returns the next item of the iterator as specified by iterator interface
   * @returns {object} - The iterator interface specified object
   */
  next() {
    if (++this._index === this._size) return { done: true }
    return { value: this._links[this._index], done: false }
  }

  /**
   * Create a LinksCollection iterator object with next() method
   * @param {Link[]} links - An array of link objects
   */
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
