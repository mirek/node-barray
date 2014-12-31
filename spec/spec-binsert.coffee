
{ eq, binsert } = require './helpers'

describe 'binsert', ->

  it 'should insert without dups', ->
    a = [ 1, 3, 4 ]
    eq -(1 + 1), binsert a, 2
    eq [ 1, 2, 3, 4 ], a
    eq -(4 + 1), binsert a, 5
    eq [ 1, 2, 3, 4, 5 ], a
    eq -(0 + 1), binsert a, 0
    eq [ 0, 1, 2, 3, 4, 5 ], a
    eq 2, binsert a, 2
    eq [ 0, 1, 2, 3, 4, 5 ], a
