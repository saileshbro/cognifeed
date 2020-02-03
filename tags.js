const axios = require("axios")
const tags = [
  "food and drink",
  "women",
  "stories",
  "environment",
  "programming",
  "general",
  "sports",
  "culture",
  "travel",
  "nature",
  "cooking",
  "music",
  "anime",
  "arts",
  "inspirational",
  "relationship",
  "books",
  "nutrition",
  "celebrities",
  "parenthood",
  "babies",
  "education",
  "humour",
  "writing",
  "interesting facts",
  "animals",
  "fitness",
  "beauty",
  "technology",
  "movies",
  "health",
  "science",
  "business",
  "psychology",
  "history",
  "fashion and style",
  "economics",
  "mathematics",
  "philosophy",
  "politics",
  "finance",
  "marketing",
  "television series",
  "literature",
  "journalism"
]
tags.forEach(tag => {
  try {
    axios.default
      .post("http://localhost:3100/api/tags", { tag })
      .then()
      .catch(console.log)
  } catch (error) {
    console.log(error)
  }
})
// module.exports = tags
