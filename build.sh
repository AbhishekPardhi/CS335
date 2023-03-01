#!/bin/bash
clear
bison -d -t main.y
flex main.l
g++ main.tab.c lex.yy.c -ll -o parser
./parser < BubbleSort.java
# bison -v main.y
# dot -Tps graph.dot -o graph.ps