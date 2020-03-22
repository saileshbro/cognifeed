// const targetTime = new Date(2020, 2, 14, 21, 19)
const axios = require("axios")
setInterval(() => {
  // const now = new Date()
  // if (
  //   now.getHours() === targetTime.getHours() &&
  //   now.getMinutes() === targetTime.getMinutes()
  // )
  //   console.log("It is 9:13 PM")
  axios.default.post("http://cognifeed.herokuapp.com/api/notification/notify")
}, 60000)
