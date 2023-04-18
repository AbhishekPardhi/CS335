#!/bin/bash
/bin/python3 /home/scizor/Documents/Github/CS335-Project/milestone4/src/x86_64/generator.py
gcc -c x86.s -o x86.o
gcc x86.o -o x86
./x86
