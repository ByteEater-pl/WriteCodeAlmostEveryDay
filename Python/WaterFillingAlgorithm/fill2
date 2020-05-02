def fill(heights):
  rmax = []
  a = 0
  for h in reversed(heights):
    a = max(h, a)
    rmax.insert(0, a)
  s = 0
  a = 0
  for h, r in zip(heights, rmax):
    a = max(h, a)
    s += min(a, r) - h
  return s

print(fill([2, 5, 1, 2, 3, 4, 7, 7, 6]))
