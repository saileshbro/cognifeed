"use strict"

const { expect } = require("chai")
const Link = require("../src/scraper/link")
const PurifierFactory = require("../src/purifier/purifier-factory")
const WikiPurifier = require("../src/purifier/general/WikiPurifier")
const ESPNPurifier = require("../src/purifier/sports/EspnPurifier")
const MindBodyGreenPurifier = require("../src/purifier/healthAndBeauty/MindBodyGreenPurifier")
const EconomistsPurifier = require("../src/purifier/economy/EconomistsPurifier")
const CodingAlphaPurifier = require("../src/purifier/programming/CodingAlphaPurifier")

describe("PurifierFactory", function() {
  context("#createPurifier", function() {
    const purifierFactory = new PurifierFactory()
    const dummyHTML =
    `<html>
      <head>
        <meta charset='utf-8'>
        <title>Dummy HTML</title>
      </head>
      <body>Test</body>
    </html>`
    const links = [
      new Link("https://en.wikipedia.org"),
      new Link("https://espn.in"),
      new Link("https://mindbodygreen.com"),
      new Link("https://economists.com"),
      new Link("https://codingalpha.com")
    ]
    const purifiers = [
      WikiPurifier,
      ESPNPurifier,
      MindBodyGreenPurifier,
      EconomistsPurifier,
      CodingAlphaPurifier
    ]

    it("should return the right purifier for the link", function() {
      let isPurifierCorrect = true
      links.forEach((link, i) => {
        let purifier = purifierFactory.createPurifier(dummyHTML, link)
        if (!(purifier instanceof purifiers[i])) isPurifierCorrect = false
      })
      expect(isPurifierCorrect).to.be.true
    })
  })
})
