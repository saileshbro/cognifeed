"use strict"

module.exports = class LinksCollection {
  static create() {
    return new LinksCollection([])
  }

  readLinks() {
    return this.links.map(link => link.resolve())
  }

  addLink(link) {
    return new LinksCollection(this.links.concat(link))
  }

  removeLink(link) {
    return new LinksCollection(this.links.filter(link))
  }

  hasLink(link) {
    return this.links.indexOf(link) >= 0
  }

  constructor(links = []) {
    this.links = [...links]
  }
}
