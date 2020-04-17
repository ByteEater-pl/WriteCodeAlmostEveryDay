func sort<T: Comparable>(
  _ arr: inout [T],
  _ start: inout Int = 0,
  _ end: inout Int = arr.count)
{
  while start < end {
    var i = start
    let pivot = arr[i]
    for j in i + 1 ... end
    {
      let t = arr[j]
      if t < pivot {
        arr[j] = arr[i]
        i += 1
        arr[i] = t
      }
    }
    if i > start {
      var bounds = [(start, i), (i, end)]
      if 2 * i <= start + end
        { bounds.reverse() }
      (start, end) = bounds[0]
      sort(&arr, &bounds[1].0, &bounds[1].1)
    }
    else { start += 1 }
  }
}

var a = [3, 1, 4, 1, 5, 9, 2, 6, 5]
sort(&a)
print(a)
