#!/bin/bash
filename="$1"
mydir="$(pwd)"
./main --input="$filename"
/bin/python3 ${mydir}/x86_64/generator.py
gcc -c ./output/x86.s -o ./output/x86.o
gcc ./output/x86.o -o ./output/x86
././output/x86
