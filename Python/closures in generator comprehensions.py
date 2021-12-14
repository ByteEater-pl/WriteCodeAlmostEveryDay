# https://stackoverflow.com/questions/70342301/closure-semantics-in-python-generator-comprehensions
def debug(s, v):
	print(s + ':', v)
	return v
l1 = debug('l1', [(debug('x in l1', x) for x in debug('pair in l1', (0, 1)) if x == debug('t in l1', t)) for t in (0, 1)])
l2 = debug('l2', [[debug('x in l2', x) for x in debug('pair in l2', (0, 1)) if x == debug('t in l2', t)] for t in (0, 1)])
l3 = debug('l3', [(debug('x in l3', x) for x in [debug('t in l3', t)]) for t in (0, 1)])
l4 = debug('l4', [[debug('x in l4', x) for x in [debug('t in l4', t)]] for t in (0, 1)])
print([(*map(list, l),) for l in (l1, l2, l3, l4)])
