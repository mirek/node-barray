
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

  it 'should insert without dups', ->
    a = [ 1, 3, 4 ]
    assert.equal -(1 + 1), $.binsert a, 2
    assert.deepEqual [ 1, 2, 3, 4 ], a
    assert.equal -(4 + 1), $.binsert a, 5
    assert.deepEqual [ 1, 2, 3, 4, 5 ], a
    assert.equal -(0 + 1), $.binsert a, 0
    assert.deepEqual [ 0, 1, 2, 3, 4, 5 ], a
    assert.equal 2, $.binsert a, 2
    assert.deepEqual [ 0, 1, 2, 3, 4, 5 ], a

  it 'should remove', ->
    a = [ 1, 2, 4 ]
    assert.equal 1, $.bremove a, 2
    assert.equal -(1 + 1), $.bremove a, 2
    assert.equal 0, $.bremove a, 1
    assert.deepEqual [ 4 ], a

  it 'should check if array is sorted', ->
    assert.equal true, $.bcheck [ 1, 2, 2, 3 ]
    assert.equal false, $.bcheck [ 1, 2, 1, 3 ]
