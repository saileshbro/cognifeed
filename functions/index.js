const functions = require("firebase-functions")
const admin = require("firebase-admin")
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
admin.initializeApp()
const fcm = admin.messaging()
exports.sendToTopic = () => {
  const payload = {
    notification: {
      title: "New Article",
      body: "Hello world",
      click_action: "FLUTTER_NOTIFICATION_CLICK"
    }
  }
  return fcm.sendAll([payload])
}
