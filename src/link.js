"use strict"

const { URL } = require("url")

module.exports = class Link {
  resolve() {
    return new URL(this.path, this.baseURL).href
  }

  constructor(baseURL, path = "/") {
    this.baseURL = baseURL
    this.path = path
  }
}
