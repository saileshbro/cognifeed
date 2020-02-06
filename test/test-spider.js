/* eslint-disable linebreak-style */
/* eslint-disable no-undef */
const { expect } = require("chai")
const Spider = require("../src/scraper/spider")
const Link = require("../src/scraper/link")
const LinksCollection = require("../src/scraper/links-collection")

const link = new Link("https://en.wikipedia.org", "/wiki/Node.js")
const spider = new Spider(link)

describe("Spider class", function() {
  context("#spawn", function() {
    it("should return a Spider object", function() {
      let spider = Spider.spawn(link)
      expect(spider instanceof Spider).to.be.true
    })
  })
  context("#getNewLinks", function() {
    it("should return a collection of link", function() {
      spider.getNewLinks().then(data => {
        expect(data instanceof LinksCollection).to.be.true
      })
    })
  })
})
