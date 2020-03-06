"use strict"

const { gzip, deflate, brotliCompress } = require("zlib")
const { expect } = require("chai")
const decompress = require("../src/scraper/util/decompress")

describe("Spider", function() {
  context("#_decompress", function() {
    const text = "I'm about to be compressed.\n"

    it("should decompress a gzip compressed buffer", function() {
      gzip(text, (err, buffer) => {
        if (err) throw err

        decompress(buffer)
          .then(value => {
            expect(value.toString()).to.equal(text)
          })
          .catch(err => {
            throw err
          })
      })
    })

    it("should decompress a deflate compressed buffer", function() {
      deflate(text, (err, buffer) => {
        if (err) throw err

        decompress(buffer)
          .then(buf => {
            expect(buf.toString()).to.equal(text)
          })
          .catch(err => {
            throw err
          })
      })
    })

    it("should decompress a brotli compressed buffer", function() {
      brotliCompress(text, (err, buffer) => {
        if (err) throw err

        decompress(buffer)
          .then(buf => {
            expect(buf.toString()).to.equal(text)
          })
          .catch(err => {
            throw err
          })
      })
    })

    it("should throw an error", function() {
      decompress(text)
        .then(buf => {
          expect(buf).to.equal(text)
        })
        .catch(err => {
          throw err
        })
    })
  })
})
