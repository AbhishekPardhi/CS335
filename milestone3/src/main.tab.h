#ifndef YY_parse_h_included
#define YY_parse_h_included
/*#define YY_USE_CLASS 
*/
#line 1 "/usr/share/bison++/bison.h"
/* before anything */
#ifdef c_plusplus
 #ifndef __cplusplus
  #define __cplusplus
 #endif
#endif


 #line 8 "/usr/share/bison++/bison.h"

#line 64 "main.y"
typedef union {
    NODE *elem;
} yy_parse_stype;
#define YY_parse_STYPE yy_parse_stype
#ifndef YY_USE_CLASS
#define YYSTYPE yy_parse_stype
#endif

#line 21 "/usr/share/bison++/bison.h"
 /* %{ and %header{ and %union, during decl */
#ifndef YY_parse_COMPATIBILITY
 #ifndef YY_USE_CLASS
  #define  YY_parse_COMPATIBILITY 1
 #else
  #define  YY_parse_COMPATIBILITY 0
 #endif
#endif

#if YY_parse_COMPATIBILITY != 0
/* backward compatibility */
 #ifdef YYLTYPE
  #ifndef YY_parse_LTYPE
   #define YY_parse_LTYPE YYLTYPE
/* WARNING obsolete !!! user defined YYLTYPE not reported into generated header */
/* use %define LTYPE */
  #endif
 #endif
/*#ifdef YYSTYPE*/
  #ifndef YY_parse_STYPE
   #define YY_parse_STYPE YYSTYPE
  /* WARNING obsolete !!! user defined YYSTYPE not reported into generated header */
   /* use %define STYPE */
  #endif
/*#endif*/
 #ifdef YYDEBUG
  #ifndef YY_parse_DEBUG
   #define  YY_parse_DEBUG YYDEBUG
   /* WARNING obsolete !!! user defined YYDEBUG not reported into generated header */
   /* use %define DEBUG */
  #endif
 #endif 
 /* use goto to be compatible */
 #ifndef YY_parse_USE_GOTO
  #define YY_parse_USE_GOTO 1
 #endif
#endif

/* use no goto to be clean in C++ */
#ifndef YY_parse_USE_GOTO
 #define YY_parse_USE_GOTO 0
#endif

#ifndef YY_parse_PURE

 #line 65 "/usr/share/bison++/bison.h"

#line 65 "/usr/share/bison++/bison.h"
/* YY_parse_PURE */
#endif


 #line 68 "/usr/share/bison++/bison.h"

#line 68 "/usr/share/bison++/bison.h"
/* prefix */

#ifndef YY_parse_DEBUG

 #line 71 "/usr/share/bison++/bison.h"
#define YY_parse_DEBUG 1

#line 71 "/usr/share/bison++/bison.h"
/* YY_parse_DEBUG */
#endif

#ifndef YY_parse_LSP_NEEDED

 #line 75 "/usr/share/bison++/bison.h"

#line 75 "/usr/share/bison++/bison.h"
 /* YY_parse_LSP_NEEDED*/
#endif

/* DEFAULT LTYPE*/
#ifdef YY_parse_LSP_NEEDED
 #ifndef YY_parse_LTYPE
  #ifndef BISON_YYLTYPE_ISDECLARED
   #define BISON_YYLTYPE_ISDECLARED
typedef
  struct yyltype
    {
      int timestamp;
      int first_line;
      int first_column;
      int last_line;
      int last_column;
      char *text;
   }
  yyltype;
  #endif

  #define YY_parse_LTYPE yyltype
 #endif
#endif

/* DEFAULT STYPE*/
#ifndef YY_parse_STYPE
 #define YY_parse_STYPE int
#endif

/* DEFAULT MISCELANEOUS */
#ifndef YY_parse_PARSE
 #define YY_parse_PARSE yyparse
#endif

#ifndef YY_parse_LEX
 #define YY_parse_LEX yylex
#endif

#ifndef YY_parse_LVAL
 #define YY_parse_LVAL yylval
#endif

#ifndef YY_parse_LLOC
 #define YY_parse_LLOC yylloc
#endif

#ifndef YY_parse_CHAR
 #define YY_parse_CHAR yychar
#endif

#ifndef YY_parse_NERRS
 #define YY_parse_NERRS yynerrs
#endif

#ifndef YY_parse_DEBUG_FLAG
 #define YY_parse_DEBUG_FLAG yydebug
#endif

#ifndef YY_parse_ERROR
 #define YY_parse_ERROR yyerror
#endif

#ifndef YY_parse_PARSE_PARAM
 #ifndef __STDC__
  #ifndef __cplusplus
   #ifndef YY_USE_CLASS
    #define YY_parse_PARSE_PARAM
    #ifndef YY_parse_PARSE_PARAM_DEF
     #define YY_parse_PARSE_PARAM_DEF
    #endif
   #endif
  #endif
 #endif
 #ifndef YY_parse_PARSE_PARAM
  #define YY_parse_PARSE_PARAM void
 #endif
#endif

/* TOKEN C */
#ifndef YY_USE_CLASS

 #ifndef YY_parse_PURE
  #ifndef yylval
   extern YY_parse_STYPE YY_parse_LVAL;
  #else
   #if yylval != YY_parse_LVAL
    extern YY_parse_STYPE YY_parse_LVAL;
   #else
    #warning "Namespace conflict, disabling some functionality (bison++ only)"
   #endif
  #endif
 #endif


 #line 169 "/usr/share/bison++/bison.h"
#define	BITWISE_AND	258
#define	BITWISE_OR	259
#define	COMMA	260
#define	FINALLY	261
#define	LPAREN	262
#define	RPAREN	263
#define	IDENTIFIER	264
#define	EQUALS	265
#define	DOT	266
#define	CLASS	267
#define	PUBLIC	268
#define	PRIVATE	269
#define	SEMICOLON	270
#define	COLON	271
#define	OR	272
#define	RETURN	273
#define	TRY	274
#define	SYNCHRONIZED	275
#define	THROW	276
#define	BREAK	277
#define	CONTINUE	278
#define	CATCH	279
#define	FINAL	280
#define	IF	281
#define	ELSE	282
#define	WHILE	283
#define	FOR	284
#define	LSPAR	285
#define	RSPAR	286
#define	TIMES_EQUALS	287
#define	DIVIDE_EQUALS	288
#define	MOD_EQUALS	289
#define	PLUS_EQUALS	290
#define	MINUS_EQUALS	291
#define	LEFT_SHIFT_EQUALS	292
#define	RIGHT_SHIFT_EQUALS	293
#define	UNSIGNED_RIGHT_SHIFT_EQUALS	294
#define	AND_EQUALS	295
#define	XOR_EQUALS	296
#define	OR_EQUALS	297
#define	QUESTION	298
#define	NOT_EQUALS	299
#define	LT	300
#define	GT	301
#define	LE	302
#define	GE	303
#define	INSTANCEOF	304
#define	AND	305
#define	XOR	306
#define	PLUS	307
#define	MINUS	308
#define	TIMES	309
#define	DIVIDE	310
#define	MOD	311
#define	PLUS_PLUS	312
#define	MINUS_MINUS	313
#define	TILDE	314
#define	THIS	315
#define	SUPER	316
#define	INT	317
#define	LONG	318
#define	SHORT	319
#define	BYTE	320
#define	CHAR	321
#define	IMPLEMENTS	322
#define	FLOAT	323
#define	DOUBLE	324
#define	BOOLEAN	325
#define	VOID	326
#define	NOT	327
#define	EXTENDS	328
#define	RMPARA	329
#define	LMPARA	330
#define	STATIC	331
#define	LEFT_SHIFT	332
#define	RIGHT_SHIFT	333
#define	UNSIGNED_RIGHT_SHIFT	334
#define	NULL_LITERAL	335
#define	CHAR_LITERAL	336
#define	STRING_LITERAL	337
#define	TEXTBLOCK_LITERAL	338
#define	FLOAT_LITERAL	339
#define	INTEGER_LITERAL	340
#define	BOOLEAN_LITERAL	341
#define	THROWS	342
#define	NEW	343
#define	IMPORT	344
#define	PACKAGE	345
#define	INTERFACE	346
#define	EQUALS_EQUALS	347


#line 169 "/usr/share/bison++/bison.h"
 /* #defines token */
/* after #define tokens, before const tokens S5*/
#else
 #ifndef YY_parse_CLASS
  #define YY_parse_CLASS parse
 #endif

 #ifndef YY_parse_INHERIT
  #define YY_parse_INHERIT
 #endif

 #ifndef YY_parse_MEMBERS
  #define YY_parse_MEMBERS 
 #endif

 #ifndef YY_parse_LEX_BODY
  #define YY_parse_LEX_BODY  
 #endif

 #ifndef YY_parse_ERROR_BODY
  #define YY_parse_ERROR_BODY  
 #endif

 #ifndef YY_parse_CONSTRUCTOR_PARAM
  #define YY_parse_CONSTRUCTOR_PARAM
 #endif
 /* choose between enum and const */
 #ifndef YY_parse_USE_CONST_TOKEN
  #define YY_parse_USE_CONST_TOKEN 0
  /* yes enum is more compatible with flex,  */
  /* so by default we use it */ 
 #endif
 #if YY_parse_USE_CONST_TOKEN != 0
  #ifndef YY_parse_ENUM_TOKEN
   #define YY_parse_ENUM_TOKEN yy_parse_enum_token
  #endif
 #endif

class YY_parse_CLASS YY_parse_INHERIT
{
public: 
 #if YY_parse_USE_CONST_TOKEN != 0
  /* static const int token ... */
  
 #line 212 "/usr/share/bison++/bison.h"
static const int BITWISE_AND;
static const int BITWISE_OR;
static const int COMMA;
static const int FINALLY;
static const int LPAREN;
static const int RPAREN;
static const int IDENTIFIER;
static const int EQUALS;
static const int DOT;
static const int CLASS;
static const int PUBLIC;
static const int PRIVATE;
static const int SEMICOLON;
static const int COLON;
static const int OR;
static const int RETURN;
static const int TRY;
static const int SYNCHRONIZED;
static const int THROW;
static const int BREAK;
static const int CONTINUE;
static const int CATCH;
static const int FINAL;
static const int IF;
static const int ELSE;
static const int WHILE;
static const int FOR;
static const int LSPAR;
static const int RSPAR;
static const int TIMES_EQUALS;
static const int DIVIDE_EQUALS;
static const int MOD_EQUALS;
static const int PLUS_EQUALS;
static const int MINUS_EQUALS;
static const int LEFT_SHIFT_EQUALS;
static const int RIGHT_SHIFT_EQUALS;
static const int UNSIGNED_RIGHT_SHIFT_EQUALS;
static const int AND_EQUALS;
static const int XOR_EQUALS;
static const int OR_EQUALS;
static const int QUESTION;
static const int NOT_EQUALS;
static const int LT;
static const int GT;
static const int LE;
static const int GE;
static const int INSTANCEOF;
static const int AND;
static const int XOR;
static const int PLUS;
static const int MINUS;
static const int TIMES;
static const int DIVIDE;
static const int MOD;
static const int PLUS_PLUS;
static const int MINUS_MINUS;
static const int TILDE;
static const int THIS;
static const int SUPER;
static const int INT;
static const int LONG;
static const int SHORT;
static const int BYTE;
static const int CHAR;
static const int IMPLEMENTS;
static const int FLOAT;
static const int DOUBLE;
static const int BOOLEAN;
static const int VOID;
static const int NOT;
static const int EXTENDS;
static const int RMPARA;
static const int LMPARA;
static const int STATIC;
static const int LEFT_SHIFT;
static const int RIGHT_SHIFT;
static const int UNSIGNED_RIGHT_SHIFT;
static const int NULL_LITERAL;
static const int CHAR_LITERAL;
static const int STRING_LITERAL;
static const int TEXTBLOCK_LITERAL;
static const int FLOAT_LITERAL;
static const int INTEGER_LITERAL;
static const int BOOLEAN_LITERAL;
static const int THROWS;
static const int NEW;
static const int IMPORT;
static const int PACKAGE;
static const int INTERFACE;
static const int EQUALS_EQUALS;


#line 212 "/usr/share/bison++/bison.h"
 /* decl const */
 #else
  enum YY_parse_ENUM_TOKEN { YY_parse_NULL_TOKEN=0
  
 #line 215 "/usr/share/bison++/bison.h"
	,BITWISE_AND=258
	,BITWISE_OR=259
	,COMMA=260
	,FINALLY=261
	,LPAREN=262
	,RPAREN=263
	,IDENTIFIER=264
	,EQUALS=265
	,DOT=266
	,CLASS=267
	,PUBLIC=268
	,PRIVATE=269
	,SEMICOLON=270
	,COLON=271
	,OR=272
	,RETURN=273
	,TRY=274
	,SYNCHRONIZED=275
	,THROW=276
	,BREAK=277
	,CONTINUE=278
	,CATCH=279
	,FINAL=280
	,IF=281
	,ELSE=282
	,WHILE=283
	,FOR=284
	,LSPAR=285
	,RSPAR=286
	,TIMES_EQUALS=287
	,DIVIDE_EQUALS=288
	,MOD_EQUALS=289
	,PLUS_EQUALS=290
	,MINUS_EQUALS=291
	,LEFT_SHIFT_EQUALS=292
	,RIGHT_SHIFT_EQUALS=293
	,UNSIGNED_RIGHT_SHIFT_EQUALS=294
	,AND_EQUALS=295
	,XOR_EQUALS=296
	,OR_EQUALS=297
	,QUESTION=298
	,NOT_EQUALS=299
	,LT=300
	,GT=301
	,LE=302
	,GE=303
	,INSTANCEOF=304
	,AND=305
	,XOR=306
	,PLUS=307
	,MINUS=308
	,TIMES=309
	,DIVIDE=310
	,MOD=311
	,PLUS_PLUS=312
	,MINUS_MINUS=313
	,TILDE=314
	,THIS=315
	,SUPER=316
	,INT=317
	,LONG=318
	,SHORT=319
	,BYTE=320
	,CHAR=321
	,IMPLEMENTS=322
	,FLOAT=323
	,DOUBLE=324
	,BOOLEAN=325
	,VOID=326
	,NOT=327
	,EXTENDS=328
	,RMPARA=329
	,LMPARA=330
	,STATIC=331
	,LEFT_SHIFT=332
	,RIGHT_SHIFT=333
	,UNSIGNED_RIGHT_SHIFT=334
	,NULL_LITERAL=335
	,CHAR_LITERAL=336
	,STRING_LITERAL=337
	,TEXTBLOCK_LITERAL=338
	,FLOAT_LITERAL=339
	,INTEGER_LITERAL=340
	,BOOLEAN_LITERAL=341
	,THROWS=342
	,NEW=343
	,IMPORT=344
	,PACKAGE=345
	,INTERFACE=346
	,EQUALS_EQUALS=347


#line 215 "/usr/share/bison++/bison.h"
 /* enum token */
     }; /* end of enum declaration */
 #endif
public:
 int YY_parse_PARSE(YY_parse_PARSE_PARAM);
 virtual void YY_parse_ERROR(char *msg) YY_parse_ERROR_BODY;
 #ifdef YY_parse_PURE
  #ifdef YY_parse_LSP_NEEDED
   virtual int  YY_parse_LEX(YY_parse_STYPE *YY_parse_LVAL,YY_parse_LTYPE *YY_parse_LLOC) YY_parse_LEX_BODY;
  #else
   virtual int  YY_parse_LEX(YY_parse_STYPE *YY_parse_LVAL) YY_parse_LEX_BODY;
  #endif
 #else
  virtual int YY_parse_LEX() YY_parse_LEX_BODY;
  YY_parse_STYPE YY_parse_LVAL;
  #ifdef YY_parse_LSP_NEEDED
   YY_parse_LTYPE YY_parse_LLOC;
  #endif
  int YY_parse_NERRS;
  int YY_parse_CHAR;
 #endif
 #if YY_parse_DEBUG != 0
  public:
   int YY_parse_DEBUG_FLAG;	/*  nonzero means print parse trace	*/
 #endif
public:
 YY_parse_CLASS(YY_parse_CONSTRUCTOR_PARAM);
public:
 YY_parse_MEMBERS 
};
/* other declare folow */
#endif


#if YY_parse_COMPATIBILITY != 0
 /* backward compatibility */
 /* Removed due to bison problems
 /#ifndef YYSTYPE
 / #define YYSTYPE YY_parse_STYPE
 /#endif*/

 #ifndef YYLTYPE
  #define YYLTYPE YY_parse_LTYPE
 #endif
 #ifndef YYDEBUG
  #ifdef YY_parse_DEBUG 
   #define YYDEBUG YY_parse_DEBUG
  #endif
 #endif

#endif
/* END */

 #line 267 "/usr/share/bison++/bison.h"
#endif
