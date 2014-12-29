
## Summary

Provides operations on sorted array (search, insert, delete).

`bsearch(array, value, options) -> index`
`binsert(array, value, options)`
`bremove(array, value, options)`
`bcheck(array) -> boolean`

## Installation

    npm install barray --save

## Usage

    { bsearch, binsert, bremove } = require 'barray'
    a = [1, 3, 5]
    binsert(a, 4) # [1, 3, 4, 5]
    bsearch(a, 2) >= 0 # false
    bsearch(a, 3) >= 0 # true
    bremove(a, 3)
    bsearch(a, 3) >= 0 # false

## License

    The MIT License (MIT)

    Copyright (c) 2014 Mirek Rusin

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
