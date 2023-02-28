#!/bin/bash
clear
bison -d -t parser.y
flex lexer.l
g++ parser.tab.c lex.yy.c -ll -o parser
./parser result.txt < test.txt
bison -v parser.y
dot -Tps graph.dot -o graph.ps