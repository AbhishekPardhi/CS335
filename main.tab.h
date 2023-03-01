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
    DOUBLE_COLON = 262,            /* DOUBLE_COLON  */
    LPAREN = 263,                  /* LPAREN  */
    RPAREN = 264,                  /* RPAREN  */
    IDENTIFIER = 265,              /* IDENTIFIER  */
    EQUALS = 266,                  /* EQUALS  */
    DOT = 267,                     /* DOT  */
    CLASS = 268,                   /* CLASS  */
    PUBLIC = 269,                  /* PUBLIC  */
    PRIVATE = 270,                 /* PRIVATE  */
    LANGULAR = 271,                /* LANGULAR  */
    RANGULAR = 272,                /* RANGULAR  */
    SEMICOLON = 273,               /* SEMICOLON  */
    COLON = 274,                   /* COLON  */
    OR = 275,                      /* OR  */
    RETURN = 276,                  /* RETURN  */
    TRY = 277,                     /* TRY  */
    SYNCHRONIZED = 278,            /* SYNCHRONIZED  */
    THROW = 279,                   /* THROW  */
    ASSERT = 280,                  /* ASSERT  */
    BREAK = 281,                   /* BREAK  */
    CONTINUE = 282,                /* CONTINUE  */
    CATCH = 283,                   /* CATCH  */
    ARROW = 284,                   /* ARROW  */
    FINAL = 285,                   /* FINAL  */
    IF = 286,                      /* IF  */
    ELSE = 287,                    /* ELSE  */
    WHILE = 288,                   /* WHILE  */
    FOR = 289,                     /* FOR  */
    VAR = 290,                     /* VAR  */
    LSPAR = 291,                   /* LSPAR  */
    RSPAR = 292,                   /* RSPAR  */
    ELLIPSIS = 293,                /* ELLIPSIS  */
    TIMES_EQUALS = 294,            /* TIMES_EQUALS  */
    DIVIDE_EQUALS = 295,           /* DIVIDE_EQUALS  */
    MOD_EQUALS = 296,              /* MOD_EQUALS  */
    PLUS_EQUALS = 297,             /* PLUS_EQUALS  */
    MINUS_EQUALS = 298,            /* MINUS_EQUALS  */
    LEFT_SHIFT_EQUALS = 299,       /* LEFT_SHIFT_EQUALS  */
    RIGHT_SHIFT_EQUALS = 300,      /* RIGHT_SHIFT_EQUALS  */
    UNSIGNED_RIGHT_SHIFT_EQUALS = 301, /* UNSIGNED_RIGHT_SHIFT_EQUALS  */
    AND_EQUALS = 302,              /* AND_EQUALS  */
    XOR_EQUALS = 303,              /* XOR_EQUALS  */
    OR_EQUALS = 304,               /* OR_EQUALS  */
    QUESTION = 305,                /* QUESTION  */
    NOT_EQUALS = 306,              /* NOT_EQUALS  */
    LT = 307,                      /* LT  */
    GT = 308,                      /* GT  */
    LE = 309,                      /* LE  */
    GE = 310,                      /* GE  */
    INSTANCEOF = 311,              /* INSTANCEOF  */
    AND = 312,                     /* AND  */
    XOR = 313,                     /* XOR  */
    PLUS = 314,                    /* PLUS  */
    MINUS = 315,                   /* MINUS  */
    TIMES = 316,                   /* TIMES  */
    DIVIDE = 317,                  /* DIVIDE  */
    MOD = 318,                     /* MOD  */
    PLUS_PLUS = 319,               /* PLUS_PLUS  */
    MINUS_MINUS = 320,             /* MINUS_MINUS  */
    TILDE = 321,                   /* TILDE  */
    THIS = 322,                    /* THIS  */
    SUPER = 323,                   /* SUPER  */
    INT = 324,                     /* INT  */
    LONG = 325,                    /* LONG  */
    SHORT = 326,                   /* SHORT  */
    BYTE = 327,                    /* BYTE  */
    FLOAT = 328,                   /* FLOAT  */
    DOUBLE = 329,                  /* DOUBLE  */
    BOOLEAN = 330,                 /* BOOLEAN  */
    VOID = 331,                    /* VOID  */
    NOT = 332,                     /* NOT  */
    EXTENDS = 333,                 /* EXTENDS  */
    RMPARA = 334,                  /* RMPARA  */
    LMPARA = 335,                  /* LMPARA  */
    PROTECTED = 336,               /* PROTECTED  */
    STATIC = 337,                  /* STATIC  */
    TRANSIENT = 338,               /* TRANSIENT  */
    VOLATILE = 339,                /* VOLATILE  */
    NATIVE = 340,                  /* NATIVE  */
    STRICTFP = 341,                /* STRICTFP  */
    LEFT_SHIFT = 342,              /* LEFT_SHIFT  */
    RIGHT_SHIFT = 343,             /* RIGHT_SHIFT  */
    UNSIGNED_RIGHT_SHIFT = 344,    /* UNSIGNED_RIGHT_SHIFT  */
    ABSTRACT = 345,                /* ABSTRACT  */
    LITERAL = 346,                 /* LITERAL  */
    THROWS = 347,                  /* THROWS  */
    NEW = 348,                     /* NEW  */
    OPEN = 349,                    /* OPEN  */
    TRANSITIVE = 350,              /* TRANSITIVE  */
    MODULE = 351,                  /* MODULE  */
    REQUIRES = 352,                /* REQUIRES  */
    EXPORTS = 353,                 /* EXPORTS  */
    OPENS = 354,                   /* OPENS  */
    USES = 355,                    /* USES  */
    PROVIDES = 356,                /* PROVIDES  */
    WITH = 357,                    /* WITH  */
    IMPORT = 358,                  /* IMPORT  */
    ASTERISK = 359,                /* ASTERISK  */
    PACKAGE = 360,                 /* PACKAGE  */
    TO = 361                       /* TO  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 28 "main.y"

    NODE *elem;

#line 174 "main.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_MAIN_TAB_H_INCLUDED  */
