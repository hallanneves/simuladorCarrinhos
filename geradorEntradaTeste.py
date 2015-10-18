import random

def numeroRandom():
	return str(int(random.random()*95)+5)

def geraListaRandom(n):
	return [numeroRandom() for x in range(n)]
n = 6
for x in range(100):
	print numeroRandom()+";"+",".join(geraListaRandom(n))+";"+",".join(geraListaRandom(n))+";"+",".join(geraListaRandom(n))