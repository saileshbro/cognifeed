const axios = require("axios")
const tags = [
  "Food and drink",
  "Women",
  "Stories",
  "Environment",
  "Programming",
  "General",
  "Sports",
  "Culture",
  "Disney",
  "Flowers",
  "Travel",
  "Nature",
  "DIY",
  "Cooking",
  "Music",
  "Anime",
  "Arts",
  "crafts",
  "Inspirational",
  "Relationship",
  "Books",
  "Nutrition",
  "Manga",
  "Celebrities",
  "Parenthood",
  "Babies",
  "Education",
  "Humour",
  "Healthy recipes",
  "Writing",
  "Interesting facts",
  "Animals",
  "Fitness",
  "Beauty",
  "Technology",
  "Movies",
  "Health",
  "Science",
  "Business",
  "Psychology",
  "History",
  "Sports",
  "Fashion and Style",
  "Economics",
  "Mathematics",
  "Philosophy",
  "Politics",
  "Finance",
  "Marketing",
  "Television Series",
  "Literature"
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
module.exports = tags
