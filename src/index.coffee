
# Binary search with insertion point.
#
# @param [Array] a An array
# @param v Value to search
# @return if >= 0 an index of found element, otherwise insertionPoint = -(result + 1)
bsearch = (a, v, options = {}) ->
  from = options.from ? 0
  to = options.to ? a.length
  low = from
  high = to - 1
  cmp = options.cmp ? (a, b) -> a < b
  low = from
  high = to - 1
  while low <= high
    mid = (low + high) >>> 1
    midVal = a[mid]
    if cmp midVal, v
      low = mid + 1
    else if midVal > v
      high = mid - 1
    else
      return mid # found
  -(low + 1) # not found

# Insert value into sorted array.
#
# @param [Array] a
# @param v
binsert = (a, v, options = {}) ->
  if (at = bsearch(a, v, options)) < 0
    a.splice -(at + 1), 0, v
  else

    # If we want to insert when found
    if options.dup
      a.splice at, 0, v
  at

# Remove value from sorted array.
#
# @param [Array] a An array
# @param v Value to remove
# @returns [Number]
bremove = (a, v, options = {}) ->
  if (at = bsearch(a, v, options)) >= 0
    a.splice at, 1
  at

# Check if array is sorted.
# @param [Array] a
# @param [Object] options
# @option options [Function(a, b)] cmp
bcheck = (a, options = {}) ->
  cmp = options.cmp ? (a, b) -> a < b
  p = a[0]
  r = true
  for c, i in a[1..]
    unless cmp p, c
      r = false
      break
  r

module.exports = {
  bsearch
  binsert
  bremove
  bcheck
}
