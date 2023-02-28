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
    IDENTIFIER_NOT = 258,          /* IDENTIFIER_NOT  */
    DOUBLE_COLON = 259,            /* DOUBLE_COLON  */
    COMMA = 260,                   /* COMMA  */
    AT = 261,                      /* AT  */
    LPAREN = 262,                  /* LPAREN  */
    RPAREN = 263,                  /* RPAREN  */
    IDENTIFIER = 264,              /* IDENTIFIER  */
    EQUALS = 265,                  /* EQUALS  */
    DOT = 266,                     /* DOT  */
    FINALLY = 267,                 /* FINALLY  */
    CLASS = 268,                   /* CLASS  */
    PUBLIC = 269,                  /* PUBLIC  */
    PRIVATE = 270,                 /* PRIVATE  */
    LANGULAR = 271,                /* LANGULAR  */
    RANGULAR = 272,                /* RANGULAR  */
    SEMICOLON = 273,               /* SEMICOLON  */
    OR = 274,                      /* OR  */
    COLON = 275,                   /* COLON  */
    RETURN = 276,                  /* RETURN  */
    TRY = 277,                     /* TRY  */
    SYNCHRONIZED = 278,            /* SYNCHRONIZED  */
    THROW = 279,                   /* THROW  */
    ASSERT = 280,                  /* ASSERT  */
    BREAK = 281,                   /* BREAK  */
    CONTINUE = 282,                /* CONTINUE  */
    YIELD = 283,                   /* YIELD  */
    CATCH = 284,                   /* CATCH  */
    ARROW = 285,                   /* ARROW  */
    FINAL = 286,                   /* FINAL  */
    IF = 287,                      /* IF  */
    ELSE = 288,                    /* ELSE  */
    WHILE = 289,                   /* WHILE  */
    FOR = 290,                     /* FOR  */
    VAR = 291,                     /* VAR  */
    LSPAR = 292,                   /* LSPAR  */
    RSPAR = 293,                   /* RSPAR  */
    ELLIPSIS = 294,                /* ELLIPSIS  */
    TIMES_EQUALS = 295,            /* TIMES_EQUALS  */
    DIVIDE_EQUALS = 296,           /* DIVIDE_EQUALS  */
    MOD_EQUALS = 297,              /* MOD_EQUALS  */
    PLUS_EQUALS = 298,             /* PLUS_EQUALS  */
    MINUS_EQUALS = 299,            /* MINUS_EQUALS  */
    LEFT_SHIFT_EQUALS = 300,       /* LEFT_SHIFT_EQUALS  */
    RIGHT_SHIFT_EQUALS = 301,      /* RIGHT_SHIFT_EQUALS  */
    UNSIGNED_RIGHT_SHIFT_EQUALS = 302, /* UNSIGNED_RIGHT_SHIFT_EQUALS  */
    AND_EQUALS = 303,              /* AND_EQUALS  */
    XOR_EQUALS = 304,              /* XOR_EQUALS  */
    OR_EQUALS = 305,               /* OR_EQUALS  */
    QUESTION = 306,                /* QUESTION  */
    NOT_EQUALS = 307,              /* NOT_EQUALS  */
    LT = 308,                      /* LT  */
    GT = 309,                      /* GT  */
    LE = 310,                      /* LE  */
    GE = 311,                      /* GE  */
    INSTANCEOF = 312,              /* INSTANCEOF  */
    AND = 313,                     /* AND  */
    XOR = 314,                     /* XOR  */
    PLUS = 315,                    /* PLUS  */
    MINUS = 316,                   /* MINUS  */
    TIMES = 317,                   /* TIMES  */
    DIVIDE = 318,                  /* DIVIDE  */
    MOD = 319,                     /* MOD  */
    PLUS_PLUS = 320,               /* PLUS_PLUS  */
    MINUS_MINUS = 321,             /* MINUS_MINUS  */
    TILDE = 322,                   /* TILDE  */
    THIS = 323,                    /* THIS  */
    SUPER = 324,                   /* SUPER  */
    INT = 325,                     /* INT  */
    LONG = 326,                    /* LONG  */
    SHORT = 327,                   /* SHORT  */
    BYTE = 328,                    /* BYTE  */
    FLOAT = 329,                   /* FLOAT  */
    DOUBLE = 330,                  /* DOUBLE  */
    BOOLEAN = 331,                 /* BOOLEAN  */
    VOID = 332,                    /* VOID  */
    NOT = 333,                     /* NOT  */
    EXTENDS = 334,                 /* EXTENDS  */
    IMPLEMENTS = 335,              /* IMPLEMENTS  */
    PERMITS = 336,                 /* PERMITS  */
    RMPARA = 337,                  /* RMPARA  */
    LMPARA = 338,                  /* LMPARA  */
    PROTECTED = 339,               /* PROTECTED  */
    STATIC = 340,                  /* STATIC  */
    TRANSIENT = 341,               /* TRANSIENT  */
    VOLATILE = 342,                /* VOLATILE  */
    NATIVE = 343,                  /* NATIVE  */
    STRICTFP = 344,                /* STRICTFP  */
    LEFT_SHIFT = 345,              /* LEFT_SHIFT  */
    RIGHT_SHIFT = 346,             /* RIGHT_SHIFT  */
    UNSIGNED_RIGHT_SHIFT = 347,    /* UNSIGNED_RIGHT_SHIFT  */
    ABSTRACT = 348,                /* ABSTRACT  */
    RECORD = 349,                  /* RECORD  */
    ENUM = 350,                    /* ENUM  */
    LITERAL = 351,                 /* LITERAL  */
    THROWS = 352,                  /* THROWS  */
    NEW = 353,                     /* NEW  */
    INTERFACE = 354,               /* INTERFACE  */
    SEALED = 355,                  /* SEALED  */
    NON_SEALED = 356,              /* NON_SEALED  */
    DEFAULT = 357,                 /* DEFAULT  */
    OPEN = 358,                    /* OPEN  */
    TRANSITIVE = 359,              /* TRANSITIVE  */
    MODULE = 360,                  /* MODULE  */
    REQUIRES = 361,                /* REQUIRES  */
    EXPORTS = 362,                 /* EXPORTS  */
    OPENS = 363,                   /* OPENS  */
    USES = 364,                    /* USES  */
    PROVIDES = 365,                /* PROVIDES  */
    WITH = 366,                    /* WITH  */
    IMPORT = 367,                  /* IMPORT  */
    ASTERISK = 368,                /* ASTERISK  */
    PACKAGE = 369,                 /* PACKAGE  */
    TO = 370                       /* TO  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 14 "main.y"

    char *str;

#line 183 "main.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_MAIN_TAB_H_INCLUDED  */
