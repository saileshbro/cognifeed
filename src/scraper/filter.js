"use strict"

const LinksCollection = require("./links-collection")

class Filter {
  getOriginalLinks(links) {
    for (let link of links) {
      if (!this._links.hasLink(link)) {
        this._links = this._links.addLink(link)
      }
    }
    return this._links
  }

  constructor() {
    this._links = LinksCollection.create()
  }
}

module.exports = Filter
