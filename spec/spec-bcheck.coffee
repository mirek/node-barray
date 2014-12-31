
{ t, f, bcheck } = require './helpers'

describe 'bcheck', ->

  it 'should check sorted without dups', ->
    t bcheck []
    t bcheck [1]
    t bcheck [1, 3]
    t bcheck [1, 3, 5]
    t bcheck [1, 3, 5, 7]
    t bcheck [1, 3, 5, 7, 11]

  it 'should check sorted with dups', ->
    f bcheck [1, 1]
    f bcheck [1, 1], dup: false
    t bcheck [1, 1], dup: true
    t bcheck [0, 1, 1], dup: true
    t bcheck [0, 1, 1, 2, 3], dup: true
