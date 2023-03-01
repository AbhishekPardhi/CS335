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
    COMMA = 258,                   /* COMMA  */
    FINALLY = 259,                 /* FINALLY  */
    DOUBLE_COLON = 260,            /* DOUBLE_COLON  */
    LPAREN = 261,                  /* LPAREN  */
    RPAREN = 262,                  /* RPAREN  */
    IDENTIFIER = 263,              /* IDENTIFIER  */
    EQUALS = 264,                  /* EQUALS  */
    DOT = 265,                     /* DOT  */
    CLASS = 266,                   /* CLASS  */
    PUBLIC = 267,                  /* PUBLIC  */
    PRIVATE = 268,                 /* PRIVATE  */
    LANGULAR = 269,                /* LANGULAR  */
    RANGULAR = 270,                /* RANGULAR  */
    SEMICOLON = 271,               /* SEMICOLON  */
    COLON = 272,                   /* COLON  */
    OR = 273,                      /* OR  */
    RETURN = 274,                  /* RETURN  */
    TRY = 275,                     /* TRY  */
    SYNCHRONIZED = 276,            /* SYNCHRONIZED  */
    THROW = 277,                   /* THROW  */
    ASSERT = 278,                  /* ASSERT  */
    BREAK = 279,                   /* BREAK  */
    CONTINUE = 280,                /* CONTINUE  */
    CATCH = 281,                   /* CATCH  */
    ARROW = 282,                   /* ARROW  */
    FINAL = 283,                   /* FINAL  */
    IF = 284,                      /* IF  */
    ELSE = 285,                    /* ELSE  */
    WHILE = 286,                   /* WHILE  */
    FOR = 287,                     /* FOR  */
    VAR = 288,                     /* VAR  */
    LSPAR = 289,                   /* LSPAR  */
    RSPAR = 290,                   /* RSPAR  */
    ELLIPSIS = 291,                /* ELLIPSIS  */
    TIMES_EQUALS = 292,            /* TIMES_EQUALS  */
    DIVIDE_EQUALS = 293,           /* DIVIDE_EQUALS  */
    MOD_EQUALS = 294,              /* MOD_EQUALS  */
    PLUS_EQUALS = 295,             /* PLUS_EQUALS  */
    MINUS_EQUALS = 296,            /* MINUS_EQUALS  */
    LEFT_SHIFT_EQUALS = 297,       /* LEFT_SHIFT_EQUALS  */
    RIGHT_SHIFT_EQUALS = 298,      /* RIGHT_SHIFT_EQUALS  */
    UNSIGNED_RIGHT_SHIFT_EQUALS = 299, /* UNSIGNED_RIGHT_SHIFT_EQUALS  */
    AND_EQUALS = 300,              /* AND_EQUALS  */
    XOR_EQUALS = 301,              /* XOR_EQUALS  */
    OR_EQUALS = 302,               /* OR_EQUALS  */
    QUESTION = 303,                /* QUESTION  */
    NOT_EQUALS = 304,              /* NOT_EQUALS  */
    LT = 305,                      /* LT  */
    GT = 306,                      /* GT  */
    LE = 307,                      /* LE  */
    GE = 308,                      /* GE  */
    INSTANCEOF = 309,              /* INSTANCEOF  */
    AND = 310,                     /* AND  */
    XOR = 311,                     /* XOR  */
    PLUS = 312,                    /* PLUS  */
    MINUS = 313,                   /* MINUS  */
    TIMES = 314,                   /* TIMES  */
    DIVIDE = 315,                  /* DIVIDE  */
    MOD = 316,                     /* MOD  */
    PLUS_PLUS = 317,               /* PLUS_PLUS  */
    MINUS_MINUS = 318,             /* MINUS_MINUS  */
    TILDE = 319,                   /* TILDE  */
    THIS = 320,                    /* THIS  */
    SUPER = 321,                   /* SUPER  */
    INT = 322,                     /* INT  */
    LONG = 323,                    /* LONG  */
    SHORT = 324,                   /* SHORT  */
    BYTE = 325,                    /* BYTE  */
    FLOAT = 326,                   /* FLOAT  */
    DOUBLE = 327,                  /* DOUBLE  */
    BOOLEAN = 328,                 /* BOOLEAN  */
    VOID = 329,                    /* VOID  */
    NOT = 330,                     /* NOT  */
    EXTENDS = 331,                 /* EXTENDS  */
    RMPARA = 332,                  /* RMPARA  */
    LMPARA = 333,                  /* LMPARA  */
    PROTECTED = 334,               /* PROTECTED  */
    STATIC = 335,                  /* STATIC  */
    TRANSIENT = 336,               /* TRANSIENT  */
    VOLATILE = 337,                /* VOLATILE  */
    NATIVE = 338,                  /* NATIVE  */
    STRICTFP = 339,                /* STRICTFP  */
    LEFT_SHIFT = 340,              /* LEFT_SHIFT  */
    RIGHT_SHIFT = 341,             /* RIGHT_SHIFT  */
    UNSIGNED_RIGHT_SHIFT = 342,    /* UNSIGNED_RIGHT_SHIFT  */
    ABSTRACT = 343,                /* ABSTRACT  */
    LITERAL = 344,                 /* LITERAL  */
    THROWS = 345,                  /* THROWS  */
    NEW = 346,                     /* NEW  */
    OPEN = 347,                    /* OPEN  */
    TRANSITIVE = 348,              /* TRANSITIVE  */
    MODULE = 349,                  /* MODULE  */
    REQUIRES = 350,                /* REQUIRES  */
    EXPORTS = 351,                 /* EXPORTS  */
    OPENS = 352,                   /* OPENS  */
    USES = 353,                    /* USES  */
    PROVIDES = 354,                /* PROVIDES  */
    WITH = 355,                    /* WITH  */
    IMPORT = 356,                  /* IMPORT  */
    ASTERISK = 357,                /* ASTERISK  */
    PACKAGE = 358,                 /* PACKAGE  */
    TO = 359                       /* TO  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 28 "main.y"

    NODE *elem;

#line 172 "main.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_MAIN_TAB_H_INCLUDED  */
