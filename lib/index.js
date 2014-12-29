(function() {
  var bcheck, binsert, bremove, bsearch, defaultCmp;

  defaultCmp = function(a, b) {
    return a < b;
  };

  bsearch = function(a, v, options) {
    var cmp, from, high, low, mid, midVal, to, _ref, _ref1, _ref2;
    if (options == null) {
      options = {};
    }
    cmp = (_ref = options.cmp) != null ? _ref : defaultCmp;
    from = (_ref1 = options.from) != null ? _ref1 : 0;
    to = (_ref2 = options.to) != null ? _ref2 : a.length;
    low = from;
    high = to - 1;
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
    var at, cmp, _ref;
    if (options == null) {
      options = {};
    }
    cmp = (_ref = options.cmp) != null ? _ref : defaultCmp;
    if ((at = bsearch(a, v, {
      cmp: cmp
    })) < 0) {
      a.splice(-(at + 1), 0, v);
    } else {
      if (options.dup) {
        a.splice(at, 0, v);
      }
    }
    return at;
  };

  bremove = function(a, v, options) {
    var at, cmp, _ref;
    if (options == null) {
      options = {};
    }
    cmp = (_ref = options.cmp) != null ? _ref : defaultCmp;
    if ((at = bsearch(a, v, {
      cmp: cmp
    })) >= 0) {
      a.splice(at, 1);
    }
    return at;
  };

  bcheck = function(a, options) {
    var cmp, dup, i, r, v, w, _i, _j, _len, _ref, _ref1, _ref2;
    if (options == null) {
      options = {};
    }
    cmp = (_ref = options.cmp) != null ? _ref : defaultCmp;
    dup = options.dup;
    r = true;
    if (dup) {
      _ref1 = a.slice(1);
      for (i = _i = _ref1.length - 1; _i >= 0; i = _i += -1) {
        v = _ref1[i];
        w = a[i];
        if (!!cmp(v, w)) {
          r = false;
          break;
        }
      }
    } else {
      _ref2 = a.slice(1);
      for (i = _j = 0, _len = _ref2.length; _j < _len; i = ++_j) {
        v = _ref2[i];
        w = a[i];
        if (!cmp(w, v)) {
          r = false;
          break;
        }
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
