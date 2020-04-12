function sort(
  arr : Array<any>,
  start = 0,
  end = arr.length)
{
  while (start < end) {
    let
      i = start,
      j = i
    const pivot = arr[i]
    while (++j < end)
    {
      const t = arr[j]
      if (t < pivot)
        arr[j] = arr[i],
        arr[i++] = t
    }
    if (i > start)
    {
      const bounds = [[start, i], [i, end]]
      if (2 * i <= start + end)
        bounds.reverse();
      [[start, end]] = bounds
      sort(arr, ...bounds[1])
    }
    else start++
  }
}

const a = [3, 1, 4, 1, 5, 9, 2, 6, 5]
sort(a)
console.log(a)
