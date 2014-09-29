
assert = require 'assert'
$ = require '../src'

describe 'bsearch', ->

  it 'should work with simple examples', ->
    a = [ 0, 1, 3, 5, 7, 11 ]
    assert.equal 0, $.bsearch a, 0
    assert.equal 1, $.bsearch a, 1
    assert.equal 2, $.bsearch a, 3
    assert.equal 3, $.bsearch a, 5
    assert.equal 4, $.bsearch a, 7
    assert.equal 5, $.bsearch a, 11

    assert.equal -3, $.bsearch a, 2

    # assert.equal 1, $.bsearch(a, 1)
    # assert.equal -2, $.bsearch(a, 2)
    # bremove a, 4
