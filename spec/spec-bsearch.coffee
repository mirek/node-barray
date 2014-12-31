
{ eq, t, bsearch } = require './helpers'

describe 'bsearch', ->

  it 'should work with simple examples', ->
    a = [ 0, 1, 3, 5, 7, 11 ]
    eq 0, bsearch a, 0
    t 0 > bsearch a, 0.5
    eq 1, bsearch a, 1
    t 0 > bsearch a, 2
    eq 2, bsearch a, 3
    t 0 > bsearch a, 4
    eq 3, bsearch a, 5
    t 0 > bsearch a, 6
    eq 4, bsearch a, 7
    t 0 > bsearch a, 8
    eq 5, bsearch a, 11
    t 0 > bsearch a, 12

    eq -3, bsearch a, 2
