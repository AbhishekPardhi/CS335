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
    AT = 259,                      /* AT  */
    LPAREN = 260,                  /* LPAREN  */
    RPAREN = 261,                  /* RPAREN  */
    IDENTIFIER = 262,              /* IDENTIFIER  */
    EQUALS = 263,                  /* EQUALS  */
    DOT = 264,                     /* DOT  */
    FINALLY = 265,                 /* FINALLY  */
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
    YIELD = 281,                   /* YIELD  */
    CATCH = 282,                   /* CATCH  */
    ARROW = 283,                   /* ARROW  */
    FINAL = 284,                   /* FINAL  */
    IF = 285,                      /* IF  */
    ELSE = 286,                    /* ELSE  */
    WHILE = 287,                   /* WHILE  */
    FOR = 288,                     /* FOR  */
    VAR = 289,                     /* VAR  */
    LSPAR = 290,                   /* LSPAR  */
    RSPAR = 291,                   /* RSPAR  */
    ELLIPSIS = 292,                /* ELLIPSIS  */
    TIMES_EQUALS = 293,            /* TIMES_EQUALS  */
    DIVIDE_EQUALS = 294,           /* DIVIDE_EQUALS  */
    MOD_EQUALS = 295,              /* MOD_EQUALS  */
    PLUS_EQUALS = 296,             /* PLUS_EQUALS  */
    MINUS_EQUALS = 297,            /* MINUS_EQUALS  */
    LEFT_SHIFT_EQUALS = 298,       /* LEFT_SHIFT_EQUALS  */
    RIGHT_SHIFT_EQUALS = 299,      /* RIGHT_SHIFT_EQUALS  */
    UNSIGNED_RIGHT_SHIFT_EQUALS = 300, /* UNSIGNED_RIGHT_SHIFT_EQUALS  */
    AND_EQUALS = 301,              /* AND_EQUALS  */
    XOR_EQUALS = 302,              /* XOR_EQUALS  */
    OR_EQUALS = 303,               /* OR_EQUALS  */
    QUESTION = 304,                /* QUESTION  */
    NOT_EQUALS = 305,              /* NOT_EQUALS  */
    LT = 306,                      /* LT  */
    GT = 307,                      /* GT  */
    LE = 308,                      /* LE  */
    GE = 309,                      /* GE  */
    INSTANCEOF = 310,              /* INSTANCEOF  */
    AND = 311,                     /* AND  */
    XOR = 312,                     /* XOR  */
    PLUS = 313,                    /* PLUS  */
    MINUS = 314,                   /* MINUS  */
    TIMES = 315,                   /* TIMES  */
    DIVIDE = 316,                  /* DIVIDE  */
    MOD = 317,                     /* MOD  */
    PLUS_PLUS = 318,               /* PLUS_PLUS  */
    MINUS_MINUS = 319,             /* MINUS_MINUS  */
    TILDE = 320,                   /* TILDE  */
    THIS = 321,                    /* THIS  */
    SUPER = 322,                   /* SUPER  */
    INT = 323,                     /* INT  */
    LONG = 324,                    /* LONG  */
    SHORT = 325,                   /* SHORT  */
    BYTE = 326,                    /* BYTE  */
    FLOAT = 327,                   /* FLOAT  */
    DOUBLE = 328,                  /* DOUBLE  */
    BOOLEAN = 329,                 /* BOOLEAN  */
    VOID = 330,                    /* VOID  */
    NOT = 331,                     /* NOT  */
    EXTENDS = 332,                 /* EXTENDS  */
    IMPLEMENTS = 333,              /* IMPLEMENTS  */
    PERMITS = 334,                 /* PERMITS  */
    RMPARA = 335,                  /* RMPARA  */
    LMPARA = 336,                  /* LMPARA  */
    PROTECTED = 337,               /* PROTECTED  */
    STATIC = 338,                  /* STATIC  */
    TRANSIENT = 339,               /* TRANSIENT  */
    VOLATILE = 340,                /* VOLATILE  */
    NATIVE = 341,                  /* NATIVE  */
    STRICTFP = 342,                /* STRICTFP  */
    LEFT_SHIFT = 343,              /* LEFT_SHIFT  */
    RIGHT_SHIFT = 344,             /* RIGHT_SHIFT  */
    UNSIGNED_RIGHT_SHIFT = 345,    /* UNSIGNED_RIGHT_SHIFT  */
    ABSTRACT = 346,                /* ABSTRACT  */
    RECORD = 347,                  /* RECORD  */
    ENUM = 348,                    /* ENUM  */
    LITERAL = 349,                 /* LITERAL  */
    THROWS = 350,                  /* THROWS  */
    NEW = 351,                     /* NEW  */
    INTERFACE = 352,               /* INTERFACE  */
    SEALED = 353,                  /* SEALED  */
    NON_SEALED = 354,              /* NON_SEALED  */
    DEFAULT = 355,                 /* DEFAULT  */
    OPEN = 356,                    /* OPEN  */
    TRANSITIVE = 357,              /* TRANSITIVE  */
    MODULE = 358,                  /* MODULE  */
    REQUIRES = 359,                /* REQUIRES  */
    EXPORTS = 360,                 /* EXPORTS  */
    OPENS = 361,                   /* OPENS  */
    USES = 362,                    /* USES  */
    PROVIDES = 363,                /* PROVIDES  */
    WITH = 364,                    /* WITH  */
    IMPORT = 365,                  /* IMPORT  */
    ASTERISK = 366,                /* ASTERISK  */
    PACKAGE = 367,                 /* PACKAGE  */
    TO = 368                       /* TO  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 14 "main.y"

    char *str;

#line 181 "main.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_MAIN_TAB_H_INCLUDED  */
