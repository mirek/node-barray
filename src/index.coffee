
defaultCmp = (a, b) -> a < b

# Binary search with insertion point.
#
# @param [Array] a An array
# @param v Value to search
# @param [Object] options
# @option options [Function] cmp Default to `(a, b) -> a < b`
# @return if >= 0 an index of found element, otherwise insertionPoint = -(result + 1)
bsearch = (a, v, options = {}) ->
  cmp = options.cmp ? defaultCmp
  from = options.from ? 0
  to = options.to ? a.length
  low = from
  high = to - 1
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
# @param [Object] options
# @option options [Function] cmp Default to `(a, b) -> a < b`
# @option options [Boolean] dup Insert even if value has been found.
# @param v
binsert = (a, v, options = {}) ->
  cmp = options.cmp ? defaultCmp
  if (at = bsearch(a, v, { cmp })) < 0
    a.splice -(at + 1), 0, v
  else
    a.splice at, 0, v if options.dup
  at

# Remove value from sorted array.
#
# @param [Array] a An array
# @param v Value to remove
# @param [Object] options
# @option options [Function] cmp Default to `(a, b) -> a < b`
# @returns [Number]
bremove = (a, v, options = {}) ->
  cmp = options.cmp ? defaultCmp
  if (at = bsearch(a, v, { cmp })) >= 0
    a.splice at, 1
  at

# Check if array is sorted.
#
# @param [Array] a
# @param [Object] options
# @option options [Function] cmp Default to `(a, b) -> a < b`
# @return [Boolean] True if the array is sorted, false otherwise.
bcheck = (a, options = {}) ->
  cmp = options.cmp ? defaultCmp
  dup = options.dup
  r = true
  if dup
    for v, i in a[1..] by -1
      w = a[i]
      unless not cmp v, w
        r = false
        break
  else
    for v, i in a[1..]
      w = a[i]
      unless cmp w, v
        r = false
        break
  r

module.exports = {
  bsearch
  binsert
  bremove
  bcheck
}
