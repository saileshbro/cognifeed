const admin = require("firebase-admin")
const serviceAccount = require("./serviceAccount.json")

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://cognifeed-de720.firebaseio.com"
})
const messaging = admin.messaging()
module.exports.sendNotification = async (title, body) => {
  try {
    const result = await messaging.send({
      topic: "cognifeed",
      notification: { title, body }
    })

    console.log(result)
  } catch (error) {
    console.log(error.message)
  }
}
