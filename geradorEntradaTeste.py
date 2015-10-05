import random

def numeroRandom():
	return str(int(random.random()*100))

def geraListaRandom(n):
	return [numeroRandom() for x in range(n)]

for x in range(100):
	print numeroRandom()+";"+",".join(geraListaRandom(8))+";"+",".join(geraListaRandom(8))+";"+",".join(geraListaRandom(8))