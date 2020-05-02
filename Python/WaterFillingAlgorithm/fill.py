def fill(heights):
  lmax = []
  a = 0
  for h in heights:
    a = max(h, a)
    lmax.append(a)
  rmax = []
  a = 0
  for h in reversed(heights):
    a = max(h, a)
    rmax.insert(0, a)
  a = 0
  for h, l, r in zip(heights, lmax, rmax):
    a += min(l, r) - h
  return a

print(fill([2, 5, 1, 2, 3, 4, 7, 7, 6]))
