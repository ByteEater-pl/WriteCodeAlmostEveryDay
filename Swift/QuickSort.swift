func sort<T: Comparable>(
  _ arr: inout [T],
  _ start: Int = 0,
  _ end: Int? = nil)
{
  var
    lower = start,
    upper = end ?? arr.count
  while lower < upper {
    var i = lower
    let pivot = arr[i]
    for j in i + 1 ..< upper
    {
      let t = arr[j]
      if t < pivot {
        arr[j] = arr[i]
        arr[i] = t
        i += 1
      }
    }
    if i > lower {
      let bounds = [lower, i, i, upper]
      var j = 2 * i > lower + upper ? 0 : 2
      (lower, upper) = (bounds[j], bounds[j + 1])
      j = (j + 2) % 4
      sort(&arr, bounds[j], bounds[j + 1])
    }
    else { lower += 1 }
  }
}

var a = [3, 1, 4, 1, 5, 9, 2, 6, 5]
sort(&a)
print(a)
