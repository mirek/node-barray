(function() {
  var bcheck, binsert, bremove, bsearch;

  bsearch = function(a, v, options) {
    var cmp, from, high, low, mid, midVal, to, _ref, _ref1, _ref2;
    if (options == null) {
      options = {};
    }
    from = (_ref = options.from) != null ? _ref : 0;
    to = (_ref1 = options.to) != null ? _ref1 : a.length;
    low = from;
    high = to - 1;
    cmp = (_ref2 = options.cmp) != null ? _ref2 : function(a, b) {
      return a < b;
    };
    low = from;
    high = to - 1;
    while (low <= high) {
      mid = (low + high) >>> 1;
      midVal = a[mid];
      if (cmp(midVal, v)) {
        low = mid + 1;
      } else if (midVal > v) {
        high = mid - 1;
      } else {
        return mid;
      }
    }
    return -(low + 1);
  };

  binsert = function(a, v, options) {
    var at;
    if (options == null) {
      options = {};
    }
    if ((at = bsearch(a, v, options)) < 0) {
      a.splice(-(at + 1), 0, v);
    } else {
      if (options.dup) {
        a.splice(at, 0, v);
      }
    }
    return at;
  };

  bremove = function(a, v, options) {
    var at;
    if (options == null) {
      options = {};
    }
    if ((at = bsearch(a, v, options)) >= 0) {
      a.splice(at, 1);
    }
    return at;
  };

  bcheck = function(a, options) {
    var c, cmp, i, p, r, _i, _len, _ref, _ref1;
    if (options == null) {
      options = {};
    }
    cmp = (_ref = options.cmp) != null ? _ref : function(a, b) {
      return a < b;
    };
    p = a[0];
    r = true;
    _ref1 = a.slice(1);
    for (i = _i = 0, _len = _ref1.length; _i < _len; i = ++_i) {
      c = _ref1[i];
      if (!cmp(p, c)) {
        r = false;
        break;
      }
    }
    return r;
  };

  module.exports = {
    bsearch: bsearch,
    binsert: binsert,
    bremove: bremove,
    bcheck: bcheck
  };

}).call(this);
