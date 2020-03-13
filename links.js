const axios = require("axios")
const websites = [
  "https://www.espn.in/",
  "https://sports.yahoo.com/",
  "https://www.mindbodygreen.com/",
  "https://www.beautytipsonline.com/",
  "https://www.psychologytoday.com/",
  "https://www.mentalfloss.com/",
  "https://www.theguardian.com/",
  "https://www.codingalpha.com/",
  "https://hackernoon.com/"
]
websites.forEach(tag => {
  try {
    axios.default
      .post("http://localhost:3100/api/website", { tag })
      .then()
      .catch(console.log)
  } catch (error) {
    console.log(error)
  }
})
// module.exports = tags
