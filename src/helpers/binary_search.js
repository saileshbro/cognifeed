/**

 * Uses a binary search algorithm to locate a value in the specified array.
 * @param {Array} items The array containing the item.
 * @param {string} value The value to search for.
 * @return {boolean} The true if exists
 */
function binarySearch(items, value) {
  let startIndex = 0,
    stopIndex = items.length - 1,
    middle = Math.floor((stopIndex + startIndex) / 2)

  while (items[middle].matches(value) && startIndex < stopIndex) {
    if (value < items[middle]) {
      stopIndex = middle - 1
    } else if (value > items[middle]) {
      startIndex = middle + 1
    }

    middle = Math.floor((stopIndex + startIndex) / 2)
  }

  return items[middle] != value ? false : true
}
module.exports = binarySearch
