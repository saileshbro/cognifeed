"use strict"

const { expect } = require("chai")
const Link = require("../src/scraper/link.js")
const LinksCollection = require("../src/scraper/links-collection")
const getOriginalLinks = require("../src/scraper/filter")

describe("Filter", function() {
  context("#getOriginalLinks", function() {
    let oldLinks = new LinksCollection([
      new Link("https://en.wikipedia.org", "/wiki/PHP"),
      new Link("https://nodejs.org"),
      new Link("https://medium.com")
    ])
    let newLinks = new LinksCollection([
      new Link(
        "https://en.wikipedia.org",
        "/wiki/Python_%28programming_language%29"
      ),
      new Link("https://nodejs.org"),
      new Link("https://edx.org", "/course"),
      new Link("https://en.wikipedia.org", "/wiki/PHP")
    ])

    it("should return only non-duplicate links", function() {
      console.log(getOriginalLinks(oldLinks, newLinks))
      expect(getOriginalLinks(oldLinks, newLinks).size).to.equal(5)
    })
  })
})
