#!/bin/bash
filename="$1"
./main --input="$filename"
/bin/python3 /home/scizor/Documents/Github/CS335-Project/milestone4/src/x86_64/generator.py
gcc -c ./x86_64/x86.s -o ./x86_64/x86.o
gcc ./x86_64/x86.o -o ./x86_64/x86
././x86_64/x86
