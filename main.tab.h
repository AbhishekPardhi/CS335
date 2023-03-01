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
    CONST = 258,                   /* CONST  */
    FINALLY = 259,                 /* FINALLY  */
    CHAR = 260,                    /* CHAR  */
    CASE = 261,                    /* CASE  */
    DO = 262,                      /* DO  */
    GOTO = 263,                    /* GOTO  */
    SWITCH = 264,                  /* SWITCH  */
    COMMA = 265,                   /* COMMA  */
    AT = 266,                      /* AT  */
    LPAREN = 267,                  /* LPAREN  */
    RPAREN = 268,                  /* RPAREN  */
    IDENTIFIER = 269,              /* IDENTIFIER  */
    EQUALS = 270,                  /* EQUALS  */
    DOT = 271,                     /* DOT  */
    CLASS = 272,                   /* CLASS  */
    PUBLIC = 273,                  /* PUBLIC  */
    PRIVATE = 274,                 /* PRIVATE  */
    LANGULAR = 275,                /* LANGULAR  */
    RANGULAR = 276,                /* RANGULAR  */
    SEMICOLON = 277,               /* SEMICOLON  */
    COLON = 278,                   /* COLON  */
    OR = 279,                      /* OR  */
    RETURN = 280,                  /* RETURN  */
    TRY = 281,                     /* TRY  */
    SYNCHRONIZED = 282,            /* SYNCHRONIZED  */
    THROW = 283,                   /* THROW  */
    ASSERT = 284,                  /* ASSERT  */
    BREAK = 285,                   /* BREAK  */
    CONTINUE = 286,                /* CONTINUE  */
    YIELD = 287,                   /* YIELD  */
    CATCH = 288,                   /* CATCH  */
    ARROW = 289,                   /* ARROW  */
    FINAL = 290,                   /* FINAL  */
    IF = 291,                      /* IF  */
    ELSE = 292,                    /* ELSE  */
    WHILE = 293,                   /* WHILE  */
    FOR = 294,                     /* FOR  */
    VAR = 295,                     /* VAR  */
    LSPAR = 296,                   /* LSPAR  */
    RSPAR = 297,                   /* RSPAR  */
    ELLIPSIS = 298,                /* ELLIPSIS  */
    TIMES_EQUALS = 299,            /* TIMES_EQUALS  */
    DIVIDE_EQUALS = 300,           /* DIVIDE_EQUALS  */
    MOD_EQUALS = 301,              /* MOD_EQUALS  */
    PLUS_EQUALS = 302,             /* PLUS_EQUALS  */
    MINUS_EQUALS = 303,            /* MINUS_EQUALS  */
    LEFT_SHIFT_EQUALS = 304,       /* LEFT_SHIFT_EQUALS  */
    RIGHT_SHIFT_EQUALS = 305,      /* RIGHT_SHIFT_EQUALS  */
    UNSIGNED_RIGHT_SHIFT_EQUALS = 306, /* UNSIGNED_RIGHT_SHIFT_EQUALS  */
    AND_EQUALS = 307,              /* AND_EQUALS  */
    XOR_EQUALS = 308,              /* XOR_EQUALS  */
    OR_EQUALS = 309,               /* OR_EQUALS  */
    QUESTION = 310,                /* QUESTION  */
    NOT_EQUALS = 311,              /* NOT_EQUALS  */
    LT = 312,                      /* LT  */
    GT = 313,                      /* GT  */
    LE = 314,                      /* LE  */
    GE = 315,                      /* GE  */
    INSTANCEOF = 316,              /* INSTANCEOF  */
    AND = 317,                     /* AND  */
    XOR = 318,                     /* XOR  */
    PLUS = 319,                    /* PLUS  */
    MINUS = 320,                   /* MINUS  */
    TIMES = 321,                   /* TIMES  */
    DIVIDE = 322,                  /* DIVIDE  */
    MOD = 323,                     /* MOD  */
    PLUS_PLUS = 324,               /* PLUS_PLUS  */
    MINUS_MINUS = 325,             /* MINUS_MINUS  */
    TILDE = 326,                   /* TILDE  */
    THIS = 327,                    /* THIS  */
    SUPER = 328,                   /* SUPER  */
    INT = 329,                     /* INT  */
    LONG = 330,                    /* LONG  */
    SHORT = 331,                   /* SHORT  */
    BYTE = 332,                    /* BYTE  */
    FLOAT = 333,                   /* FLOAT  */
    DOUBLE = 334,                  /* DOUBLE  */
    BOOLEAN = 335,                 /* BOOLEAN  */
    VOID = 336,                    /* VOID  */
    NOT = 337,                     /* NOT  */
    EXTENDS = 338,                 /* EXTENDS  */
    IMPLEMENTS = 339,              /* IMPLEMENTS  */
    PERMITS = 340,                 /* PERMITS  */
    RMPARA = 341,                  /* RMPARA  */
    LMPARA = 342,                  /* LMPARA  */
    PROTECTED = 343,               /* PROTECTED  */
    STATIC = 344,                  /* STATIC  */
    TRANSIENT = 345,               /* TRANSIENT  */
    VOLATILE = 346,                /* VOLATILE  */
    NATIVE = 347,                  /* NATIVE  */
    STRICTFP = 348,                /* STRICTFP  */
    LEFT_SHIFT = 349,              /* LEFT_SHIFT  */
    RIGHT_SHIFT = 350,             /* RIGHT_SHIFT  */
    UNSIGNED_RIGHT_SHIFT = 351,    /* UNSIGNED_RIGHT_SHIFT  */
    ABSTRACT = 352,                /* ABSTRACT  */
    RECORD = 353,                  /* RECORD  */
    ENUM = 354,                    /* ENUM  */
    LITERAL = 355,                 /* LITERAL  */
    THROWS = 356,                  /* THROWS  */
    NEW = 357,                     /* NEW  */
    INTERFACE = 358,               /* INTERFACE  */
    SEALED = 359,                  /* SEALED  */
    NON_SEALED = 360,              /* NON_SEALED  */
    DEFAULT = 361,                 /* DEFAULT  */
    OPEN = 362,                    /* OPEN  */
    TRANSITIVE = 363,              /* TRANSITIVE  */
    MODULE = 364,                  /* MODULE  */
    REQUIRES = 365,                /* REQUIRES  */
    EXPORTS = 366,                 /* EXPORTS  */
    OPENS = 367,                   /* OPENS  */
    USES = 368,                    /* USES  */
    PROVIDES = 369,                /* PROVIDES  */
    WITH = 370,                    /* WITH  */
    IMPORT = 371,                  /* IMPORT  */
    ASTERISK = 372,                /* ASTERISK  */
    PACKAGE = 373,                 /* PACKAGE  */
    TO = 374                       /* TO  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 14 "main.y"

    char *str;

#line 187 "main.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_MAIN_TAB_H_INCLUDED  */
