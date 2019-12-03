const { expect } = require("chai")
const Link = require("../src/link")

describe("Link", () => {
  describe("#resolve()", () => {
    it("should return https://wikipedia.org/", () => {
      expect(new Link("https://wikipedia.org", "/").resolve()).to.equal("https://wikipedia.org/")
    })
  })
})

describe("Link", () => {
  describe("#resolve()", () => {
    it("should return https://wikipedia.org/", () => {
      expect(new Link("https://wikipedia.org").resolve()).to.equal("https://wikipedia.org/")
    })
  })
})
