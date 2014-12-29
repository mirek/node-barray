
assert = require 'assert'
{ bsearch, binsert, bremove, bcheck } = require '../src'

t = (a...) -> assert.equal true, a...
f = (a...) -> assert.equal false, a...
eq = (a...) -> assert.deepEqual a...

module.exports = {
  assert
  t
  f
  eq
  bsearch
  binsert
  bremove
  bcheck
}
