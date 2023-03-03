#!/bin/bash
clear
bison -d -t -v main.y
flex main.l
g++ main.tab.c lex.yy.c -o parser
./parser < BubbleSort.java
bison -v main.y
# dot -Tps graph.dot -o graph.ps
# dot -Tpng graph.dot -o graph.png