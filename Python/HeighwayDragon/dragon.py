import turtle
t = turtle.Turtle()

def dragon(n, a):
  if n:
    a /= 2 ** 0.5
    t.lt(45)
    dragon(n - 1, a)
    t.rt(90)
    t.pu()
    t.fd(a)
    t.pd()
    t.lt(180)
    dragon(n - 1, a)
    t.lt(180)
    t.pu()
    t.fd(a)
    t.pd()
    t.lt(45)
  else: t.fd(a)

t.ht()
t.speed(0)
t.getscreen().delay(0)
t.pu()
t.bk(150)
t.pd()
dragon(6, 300)
