compile: main.y main.l
		[ ! -f output ] && mkdir output || true
		bison -t -d -v main.y
		flex main.l
		g++ main.tab.c lex.yy.c -o main

clean:	
		rm -f main main.tab.c main.tab.h lex.yy.c main.output *.dot *.png -r output test.s test

dot:	output.dot
		dot -Tpng output.dot -o AST.png

x86:	
		python3 X86gen/x86gen.py

test:
		gcc -S test.cpp -o test.s
		gcc test.s -o test
		./test
