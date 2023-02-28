#!/bin/bash
clear
flex main.l
g++ -o scan lex.yy.c -ll
./scan < BubbleSort.java