/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_MAIN_TAB_H_INCLUDED
# define YY_YY_MAIN_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    BITWISE_AND = 258,             /* BITWISE_AND  */
    BITWISE_OR = 259,              /* BITWISE_OR  */
    COMMA = 260,                   /* COMMA  */
    FINALLY = 261,                 /* FINALLY  */
    LPAREN = 262,                  /* LPAREN  */
    RPAREN = 263,                  /* RPAREN  */
    IDENTIFIER = 264,              /* IDENTIFIER  */
    EQUALS = 265,                  /* EQUALS  */
    DOT = 266,                     /* DOT  */
    CLASS = 267,                   /* CLASS  */
    PUBLIC = 268,                  /* PUBLIC  */
    PRIVATE = 269,                 /* PRIVATE  */
    SEMICOLON = 270,               /* SEMICOLON  */
    COLON = 271,                   /* COLON  */
    OR = 272,                      /* OR  */
    RETURN = 273,                  /* RETURN  */
    TRY = 274,                     /* TRY  */
    SYNCHRONIZED = 275,            /* SYNCHRONIZED  */
    THROW = 276,                   /* THROW  */
    BREAK = 277,                   /* BREAK  */
    CONTINUE = 278,                /* CONTINUE  */
    CATCH = 279,                   /* CATCH  */
    FINAL = 280,                   /* FINAL  */
    IF = 281,                      /* IF  */
    ELSE = 282,                    /* ELSE  */
    WHILE = 283,                   /* WHILE  */
    FOR = 284,                     /* FOR  */
    LSPAR = 285,                   /* LSPAR  */
    RSPAR = 286,                   /* RSPAR  */
    TIMES_EQUALS = 287,            /* TIMES_EQUALS  */
    DIVIDE_EQUALS = 288,           /* DIVIDE_EQUALS  */
    MOD_EQUALS = 289,              /* MOD_EQUALS  */
    PLUS_EQUALS = 290,             /* PLUS_EQUALS  */
    MINUS_EQUALS = 291,            /* MINUS_EQUALS  */
    LEFT_SHIFT_EQUALS = 292,       /* LEFT_SHIFT_EQUALS  */
    RIGHT_SHIFT_EQUALS = 293,      /* RIGHT_SHIFT_EQUALS  */
    UNSIGNED_RIGHT_SHIFT_EQUALS = 294, /* UNSIGNED_RIGHT_SHIFT_EQUALS  */
    AND_EQUALS = 295,              /* AND_EQUALS  */
    XOR_EQUALS = 296,              /* XOR_EQUALS  */
    OR_EQUALS = 297,               /* OR_EQUALS  */
    QUESTION = 298,                /* QUESTION  */
    NOT_EQUALS = 299,              /* NOT_EQUALS  */
    LT = 300,                      /* LT  */
    GT = 301,                      /* GT  */
    LE = 302,                      /* LE  */
    GE = 303,                      /* GE  */
    INSTANCEOF = 304,              /* INSTANCEOF  */
    AND = 305,                     /* AND  */
    XOR = 306,                     /* XOR  */
    PLUS = 307,                    /* PLUS  */
    MINUS = 308,                   /* MINUS  */
    TIMES = 309,                   /* TIMES  */
    DIVIDE = 310,                  /* DIVIDE  */
    MOD = 311,                     /* MOD  */
    PLUS_PLUS = 312,               /* PLUS_PLUS  */
    MINUS_MINUS = 313,             /* MINUS_MINUS  */
    TILDE = 314,                   /* TILDE  */
    THIS = 315,                    /* THIS  */
    SUPER = 316,                   /* SUPER  */
    INT = 317,                     /* INT  */
    LONG = 318,                    /* LONG  */
    SHORT = 319,                   /* SHORT  */
    BYTE = 320,                    /* BYTE  */
    CHAR = 321,                    /* CHAR  */
    IMPLEMENTS = 322,              /* IMPLEMENTS  */
    FLOAT = 323,                   /* FLOAT  */
    DOUBLE = 324,                  /* DOUBLE  */
    BOOLEAN = 325,                 /* BOOLEAN  */
    VOID = 326,                    /* VOID  */
    NOT = 327,                     /* NOT  */
    EXTENDS = 328,                 /* EXTENDS  */
    RMPARA = 329,                  /* RMPARA  */
    LMPARA = 330,                  /* LMPARA  */
    STATIC = 331,                  /* STATIC  */
    LEFT_SHIFT = 332,              /* LEFT_SHIFT  */
    RIGHT_SHIFT = 333,             /* RIGHT_SHIFT  */
    UNSIGNED_RIGHT_SHIFT = 334,    /* UNSIGNED_RIGHT_SHIFT  */
    LITERAL = 335,                 /* LITERAL  */
    THROWS = 336,                  /* THROWS  */
    NEW = 337,                     /* NEW  */
    IMPORT = 338,                  /* IMPORT  */
    ASTERISK = 339,                /* ASTERISK  */
    PACKAGE = 340,                 /* PACKAGE  */
    INTERFACE = 341,               /* INTERFACE  */
    EQUALS_EQUALS = 342            /* EQUALS_EQUALS  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 28 "main.y"

    NODE *elem;

#line 155 "main.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_MAIN_TAB_H_INCLUDED  */
