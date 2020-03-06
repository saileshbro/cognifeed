const { URL } = require("url")

console.log(
  new URL(
    `https://en.wikipedia.org/wiki/Node${encodeURIComponent(".")}js#History`
  ).pathname
)
