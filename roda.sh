#!/usr/bin/env bash -e

javac GAcars.java;
java GAcars first;
for i in {1..10}  
do
	/Applications/love.app/Contents/MacOS/love . < Populacao.txt > temp.txt;
	echo "--------------------------------------------------------"
	echo "SAIDA DO LOVE:"
	echo "--------------------------------------------------------"
	cat temp.txt
	mv temp.txt Populacao.txt;
	java GAcars;
	echo "--------------------------------------------------------"
	echo "SAIDA DO JAVA:"
	echo "--------------------------------------------------------"
	cat Populacao.txt
done
