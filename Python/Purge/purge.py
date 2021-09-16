# Variations on removal of duplicates. Kept elements are in order of first appearances. Created for educational purposes.

A=[3,2,3,4,3,3,3,3,5,1,3]

def purge1(xs):
  result = []
  for x in xs:
    if x not in result:
      result.append(x)
  xs[:] = result # What if this line's omitted?
  return result # What if this line's omitted?

def purge2(xs):
  result = xs[:]
  for i, x in enumerate(result):
    j = i + 1
    # showcase try and except
    try:
      while True: # infinite loop
        # This line possibly throws an exception of type ValueError.
        # In C++ it'd return -1, but in Python exceptions are less exceptional. See also https://docs.python.org/3/glossary.html#term-eafp.
        j = result.index(x, j)
        del result[j]
    # could write "ValueError as e" if needed e
    # could also omit ValueError to default to Exception (base class of almost all exceptions)
    # StopIteration is thus omitted in subsequent code
    except ValueError: pass
  return result

def purge3(xs):
  result = xs[:]
  for i, x in enumerate(result):
    # With square brackets a list would be created.
    # Parentheses create a generator exression – consumed lazily, with the resulting elements put one by one into the target.
    result[i+1:] = (
    # line continuation rules in Python are clumsy
      e for e in result[i+1:] if e != x)
    # Modifying a collection while it's being iterated is usually strongly recommended against. But this is the optimal eager solution (for lazy ones see below).
  return result

def purge4(xs):
  def remove(x, xs):
    return [e for e in xs if e != x]
  # just xs instead of xs == []
  # because empty list is falsy, others are truthy
  return [xs[0], *purge4(remove(xs[0], xs[1:]))
    ] if xs else []
  # shorter alternative then case:
  # [xs[0]] + purge4(remove(xs[0], xs[1:]))

def purge5(xs):
  return [xs[0]] + purge5([e
    for e in xs[1:] if e != xs[0]]) if xs else []

def purge6(xs):
  return [xs[0]] + purge6(
    # showcase function filter and keyword lambda
    list(filter(lambda e: e != xs[0], xs[1:]))
  ) if xs else []

# This one takes an iterator and returns a list.
# example: print(purge7(iter([1,2,1])))
def purge7(xs):
  try: x = next(xs)
  # No way to determine if an iterator is at the end in Python except trying next and checking for exception.
  except: return []
  # Parentheses can be omitted in a generator expression which is the only argument passed to a function, avoiding double parentheses.
  return [x] + purge7(e for e in xs if e != x)

# Even better: takes an iterator and reterns an iterator. It evaluates lazily (like in Haskell), e.g. runs just far enough to find the first 3 elements if called like this:
# I = purge8(iter([4,2,2,3,4]))
# print([next(I) for _ in range(3)])
# ([next(I)] * 3 would be wrong, evaulating next(I) just once)
# or, if length at least 3 isn't guaranteed and you don't want to handle StopIteration exception:
# print([x for _, x in zip(range(3), purge8(iter([4,2,2,3,4])))])
def purge8(xs):
  try:
    x = next(xs)
    yield x
    yield from purge8(e for e in xs if e != x)
  except: pass
  # Although the documentation is unclear, the except clauses (one or more – useful with different types of exceptions; many other languages have also guards for except clauses, allowing filtering exceptions by arbitrary conditions, not just types) are optional if there's a finally and if the finally block executes return, continue or break, the exception is swallowed, so here finally: return would be equivalent.

# example: print(list(purge9(iter([4,2,2,3,4]))),
# list(purge9([1,2,1]))) -- fine both with and without iter
def purge9(xs):
  try:
    # Just this line generalized to accept lists (and other iterables) as well.
    # Btw, iter is idempotent on built-in iterables:
    # iter(iter(a)) is iter(a)
    x = next(iter(xs))
    yield x
    yield from purge9(e for e in xs if e != x)
  except: pass

print(purge7(iter(A)))
print(list(purge9(iter([4,2,2,3,4]))))
