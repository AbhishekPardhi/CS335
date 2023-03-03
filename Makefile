compile: main.y main.l
		bison -t -d -v main.y
		flex main.l
		g++ main.tab.c lex.yy.c -o main


clean:	
		rm -f main main.tab.c main.tab.h lex.yy.c main.output *.dot