const { expect } = require("chai")
const { LinksCollection } = require("../src/links-collection")

describe("LinksCollection", () => {
  describe("#create()", () => {
    it("should return {}", () => {
      expect(LinksCollection.create())
    })
  })
})
