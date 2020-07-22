export class List {
  constructor(list = []) {
    this.values = list;
  }

  length() {
    for (var i = 0; this.values[i]; i++) {}
    return i;
  }

  append(list) {
    return new List([...this.values, ...list.values]);
  }

  concat(lists) {
    return this.append(this._iterateObj(lists));
  }

  reverse() {
    return new List(this._reduce([], (reversed, next) => [next, ...reversed]));
  }

  map(fun) {
    for (let i = 0; this.values[i]; ++i) {
      this.values[i] = fun(this.values[i]);
    }
    return this;
  }

  filter(fun) {
    let filter = [];
    let filterList = new List([]);
    for (let i = 0; this.values[i]; ++i) {
      filter[i] = Number(this.values.map(fun)[i]);
      if (filter[i]) filterList = filterList._appendOne(this.values[i]);
    }
    return filterList;
  }

  foldl(fun, acc) {
    return this._reduce(acc, fun);
  }

  foldr(fun, acc) {
    return this.reverse()._reduce(acc, fun);
  }

  // Helper functions
  _appendOne(item) {
    return new List([...this.values, item]);
  }

  _iterateObj(obj, list = new List()) {
    for (let i = 0; obj.length() > i; ++i) {
      list = list.append(obj.values[i]);
    }
    return list;
  }

  _reduce(acc, fun) {
    for (let next of this.values) {
      acc = fun(acc, next);
    }
    return acc;
  }
}
