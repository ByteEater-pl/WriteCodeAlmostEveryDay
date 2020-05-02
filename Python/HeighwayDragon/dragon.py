import turtle
t = turtle.Turtle()

def dragon(n, a, o = 1):
  if n > 0:
    t.left(45 * o)
    dragon(n - 1, a * 2 ** 0.5, o)
    t.right(90 * o)
    dragon(n - 1, a * 2 ** 0.5, -o)
    t.left(45 * o)
  else: t.forward(a)

dragon(5, 9)
