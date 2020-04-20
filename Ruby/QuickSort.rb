def sort(
  arr,
  lower = 0,
  upper = arr.size
  )
  while lower < upper
    i = lower
    pivot = arr[i]
    for j in i + 1 ... upper
      t = arr[j]
      if t < pivot
        arr[j] = arr[i]
        arr[i] = t
        i += 1
      end
    end
    if i > lower
      bounds = [lower, i, i, upper]
      j = 2 * i > lower + upper ? 0 : 2
      lower, upper = bounds[j, 2]
      sort arr, *bounds[-j, 2]
    else lower += 1
    end
  end
end

A = [3, 1, 4, 1, 5, 9, 2, 6, 5]
sort A
puts A
