#!/bin/bash
clear
bison -d -t main.y
flex main.l
g++ main.tab.c lex.yy.c -ll -o main