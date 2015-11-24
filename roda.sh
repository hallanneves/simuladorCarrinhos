#!/bin/bash -e

"/cygdrive/c/Program Files/Java/jdk1.8.0_65/bin/javac.exe" GAcars.java;
"/cygdrive/c/Program Files/Java/jdk1.8.0_65/bin/java.exe" GAcars first;

for i in {1..10}
do
	/cygdrive/c/Program\ Files/LOVE/love.exe . < Populacao.txt > temp.txt;
	echo "--------------------------------------------------------"
	echo "SAIDA DO LOVE:"
	echo "--------------------------------------------------------"
	#cat temp.txt
	echo $i
	mv temp.txt Populacao.txt;
	/cygdrive/c/Program\ Files/Java/jdk1.8.0_65/bin/java.exe GAcars;
	echo "--------------------------------------------------------"
	echo "SAIDA DO JAVA:"
	echo "--------------------------------------------------------"
	#cat Populacao.txt
done
