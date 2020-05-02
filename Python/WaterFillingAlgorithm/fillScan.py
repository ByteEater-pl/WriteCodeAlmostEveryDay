def fill(heights):
  def scan(l):
    maxs = []
    a = 0
    for h in l:
      a = max(h, a)
      maxs.append(a)
    return maxs
  s = 0
  for h, l, r in zip(
    heights,
    scan(heights),
    reversed(scan(reversed(heights)))
  ):
    s += min(l, r) - h
  return s

print(fill([2, 5, 1, 2, 3, 4, 7, 7, 6]))
