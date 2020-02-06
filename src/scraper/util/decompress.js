"use strict"

const { unzip, brotliDecompress } = require("zlib")

/**
 * Wrapper to decompresses gzip, deflate and brotli compressed buffers
 * @param {Buffer|TypedArray|DataView|ArrayBuffer|string} buffer - The buffer
 * @returns {Promise} - A promise that resolves to the decompressed data
 */
module.exports = function(buffer) {
  return new Promise((resolve, reject) => {
    // Try to gunzip or deflate the archive first
    unzip(buffer, (err, decompBuf) => {
      if (err) {
        // If that fails, try brotliDecompressing it
        brotliDecompress(buffer, (err, decompBuf) => {
          if (err)
            // If that too fails, reject the promise
            return reject(
              new Error(
                "Given buffer is not gzip, deflate or brotli compressed"
              )
            )
          resolve(decompBuf)
        })
      } else {
        resolve(decompBuf)
      }
    })
  })
}
