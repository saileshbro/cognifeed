const fs = require("fs")
/**
 * Log to file.
 * @param {string} text Text to log.
 * @param {string} [file] Log file path.
 */
function logToFile(text, file) {
  // Define file name.
  const filename = file !== undefined ? file : "default.log"

  // Define log text.
  const logText = text + "\r\n"

  // Save log to file.
  fs.appendFile(filename, logText, "utf8", function(error) {
    if (error) {
      // If error - show in console.
      console.log(error)
    }
  })
}

// Export.
module.exports = logToFile
