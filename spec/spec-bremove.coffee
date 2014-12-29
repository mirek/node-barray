
$ = require './helpers'

describe 'bremove', ->

  it 'should remove values', ->
    a = [ 1, 2, 4 ]
    $.eq 1, $.bremove a, 2
    $.eq -(1 + 1), $.bremove a, 2
    $.eq 0, $.bremove a, 1
    $.eq [ 4 ], a
