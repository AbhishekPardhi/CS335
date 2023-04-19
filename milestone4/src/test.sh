#!/bin/bash
filename="$1"
./main --input="$filename"
/bin/python3 /home/scizor/Documents/Github/CS335-Project/milestone4/src/x86_64/generator.py
gcc -c ./output/x86.s -o ./output/x86.o
gcc ./output/x86.o -o ./output/x86
././output/x86
