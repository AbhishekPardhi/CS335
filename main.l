%{
    /* Declaration */
    #include <bits/stdc++.h>
    using namespace std;
    #include "main.tab.h"
    #include "Tokens.h"
    // enum Tokens{_ABSTRACT=0, _CONTINUE=1, _FOR=2, _NEW_KEYWORD=3, _SWITCH=4, _ASSERT=5, _DEFAULT=6, _IF=7, _PACKAGE=8, _SYNCHRONIZED=9, _BOOLEAN=10, _DO=11, _GOTO=12, _PRIVATE=13, _THIS=14, _BREAK=15, _DOUBLE=16, _IMPLEMENTS=17, _PROTECTED=18, _THROW=19, _BYTE=20, _ELSE=21, _IMPORT=22, _PUBLIC=23, _THROWS=24, _CASE=25, _ENUM=26, _INSTANCEOF=27, _RETURN=28, _TRANSIENT=29, _CATCH=30, _EXTENDS=31, _INT=32, _SHORT=33, _TRY=34, _CHAR=35, _FINAL=36, _INTERFACE=37, _STATIC=38, _VOID=39, _CLASS=40, _FINALLY=41, _LONG=42, _STRICTFP=43, _VOLATILE=44, _CONST=45, _FLOAT=46, _NATIVE=47, _SUPER=48, _WHILE=49, _EXPORTS=50, _OPENS=51, _REQUIRES=52, _USES=53, _MODULE=54, _PERMITS=55, _SEALED=56, _VAR=57, _NON-SEALED=58, _PROVIDES=59, _TO=60, _WITH=61, _OPEN=62, _RECORD=63, _TRANSITIVE=64, _YIELD=65 , _LPAREN=66, _RPAREN=67, _LMPARA=68, _RMPARA=69, _LSPAR=70, _RSPAR=71, _SEMICOLON=72, _COMMA=73, _DOT=74, _ELLIPSIS=75, _AT=76, _EQUALS=77, _GT=78, _LT=79, _NOT=80, _TILDE=81, _QUESTION=82, _COLON=83, _EQUALS=84, _LE=85, _GE=86, _NOT_EQUALS=87, _AND=88, _OR=89, _PLUS_PLUS=90, _MINUS_MINUS=91, _PLUS=92, _MINUS=93, _TIMES=94, _DIVIDE=95, _XOR=96, _MOD=97, _LEFT_SHIFT=98, _RIGHT_SHIFT=99, _UNSIGNED_RIGHT_SHIFT=100, _PLUS_EQUALS=101, _MINUS_EQUALS=102, _TIMES_EQUALS=103, _DIVIDE_EQUALS=104, _AND_EQUALS=105, _OR_EQUALS=106, _XOR_EQUALS=107, _MOD_EQUALS=108, _LEFT_SHIFT_EQUALS=109, _RIGHT_SHIFT_EQUALS=110, _UNSIGNED_RIGHT_SHIFT_EQUALS=111};
    map<string, int >mp = {{"abstract", _ABSTRACT}, {"continue", _CONTINUE}, {"for", _FOR}, {"new", _NEW_KEYWORD}, {"switch", _SWITCH}, {"assert", _ASSERT}, {"default", _DEFAULT}, {"if", _IF}, {"package", _PACKAGE}, {"synchronized", _SYNCHRONIZED}, {"boolean", _BOOLEAN}, {"do", _DO}, {"goto", _GOTO}, {"private", _PRIVATE}, {"this", _THIS}, {"break", _BREAK}, {"double", _DOUBLE}, {"implements", _IMPLEMENTS}, {"protected", _PROTECTED}, {"throw", _THROW}, {"byte", _BYTE}, {"else", _ELSE}, {"import", _IMPORT}, {"public", _PUBLIC}, {"throws", _THROWS}, {"case", _CASE}, {"enum", _ENUM}, {"instanceof", _INSTANCEOF}, {"return", _RETURN}, {"transient", _TRANSIENT}, {"catch", _CATCH}, {"extends", _EXTENDS}, {"int", _INT}, {"short", _SHORT}, {"try", _TRY}, {"char", _CHAR}, {"final", _FINAL}, {"interface", _INTERFACE}, {"static", _STATIC}, {"void", _VOID}, {"class", _CLASS}, {"finally", _FINALLY}, {"long", _LONG}, {"strictfp", _STRICTFP}, {"volatile", _VOLATILE}, {"const", _CONST}, {"float", _FLOAT}, {"native", _NATIVE}, {"super", _SUPER}, {"while", _WHILE}, {"exports", _EXPORTS}, {"opens", _OPENS}, {"requires", _REQUIRES}, {"uses", _USES}, {"module", _MODULE}, {"permits", _PERMITS}, {"sealed", _SEALED}, {"var", _VAR}, {"non-sealed", _NON_SEALED}, {"provides", _PROVIDES}, {"to", _TO}, {"with", _WITH}, {"open", _OPEN}, {"record", _RECORD}, {"transitive", _TRANSITIVE}, {"yield", _YIELD}, {"(", _LPAREN}, {")", _RPAREN}, {"{", _LMPARA}, {"}", _RMPARA}, {"[", _LSPAR}, {"]", _RSPAR}, {";", _SEMICOLON}, {",", _COMMA}, {".", _DOT}, {"...", _ELLIPSIS}, {"@", _AT}, {"=", _EQUALS}, {">", _GT}, {"<", _LT}, {"!", _NOT}, {"~", _TILDE}, {"?", _QUESTION}, {":", _COLON}, {"==", _EQUALS}, {"<=", _LE}, {">=", _GE}, {"!=", _NOT_EQUALS}, {"&&", _AND}, {"||", _OR}, {"++", _PLUS_PLUS}, {"--", _MINUS_MINUS}, {"+", _PLUS}, {"-", _MINUS}, {"*", _TIMES}, {"/", _DIVIDE}, {"^", _XOR}, {"%", _MOD}, {"<<", _LEFT_SHIFT}, {">>", _RIGHT_SHIFT}, {">>>", _UNSIGNED_RIGHT_SHIFT}, {"+=", _PLUS_EQUALS}, {"-=", _MINUS_EQUALS}, {"*=", _TIMES_EQUALS}, {"/=", _DIVIDE_EQUALS}, {"&=", _AND_EQUALS}, {"|=", _OR_EQUALS}, {"^=", _XOR_EQUALS}, {"%=", _MOD_EQUALS}, {"<<=", _LEFT_SHIFT_EQUALS}, {">>=", _RIGHT_SHIFT_EQUALS}, {">>>=", _UNSIGNED_RIGHT_SHIFT_EQUALS}}; 
%}

%option yylineno

NEWLINE [\n]

KEYWORDS "abstract"|"continue"|"for"|"new"|"switch"|"assert"|"default"|"if"|"package"|"synchronized"|"boolean"|"do"|"goto"|"private"|"this"|"break"|"double"|"implements"|"protected"|"throw"|"byte"|"else"|"import"|"public"|"throws"|"case"|"enum"|"instanceof"|"return"|"transient"|"catch"|"extends"|"int"|"short"|"try"|"char"|"final"|"interface"|"static"|"void"|"class"|"finally"|"long"|"strictfp"|"volatile"|"const"|"float"|"native"|"super"|"while"|"exports"|"opens"|"requires"|"uses"|"module"|"permits"|"sealed"|"var"|"non-sealed"|"provides"|"to"|"with"|"open"|"record"|"transitive"|"yield"

OPERATORS "="|">"|"<"|"!"|"~"|"?"|":"|"->"|"=="|">="|"<="|"!="|"&&"|"||"|"++"|"--"|"+"|"-"|"*"|"/"|"&"|"|"|"^"|"%"|"<<"|">>"|">>>"|"+="|"-="|"*="|"/="|"&="|"|="|"^="|"%="|"<<="|">>="|">>>="

DELIMITERS "("|")"|"{"|"}"|"["|"]"|";"|","|"."|"..."|"@"|"::"

UNDERSCORE                      "_"
UNDERSCORES                     {UNDERSCORE}+
INTEGER_TYPE_SUFFIX             [lL]
NON_ZERO_DIGIT                  [1-9]
DIGIT                           [0-9]
DIGIT_OR_UNDERSCORE             {DIGIT}|{UNDERSCORE}  
DIGIT_AND_UNDERSCORES           {DIGIT_OR_UNDERSCORE}+
DIGITS                          {DIGIT}|{DIGIT}{DIGIT_AND_UNDERSCORES}?{DIGIT}
DECIMAL_NUMERAL                 [0]|({NON_ZERO_DIGIT}{DIGITS}?)|({NON_ZERO_DIGIT}{UNDERSCORES}{DIGITS})

HEX_DIGIT                       [0-9a-fA-F]
HEX_DIGIT_OR_UNDERSCORE         {HEX_DIGIT}|{UNDERSCORE}
HEX_DIGIT_AND_UNDERSCORES       {HEX_DIGIT_OR_UNDERSCORE}+
HEX_DIGITS                      {HEX_DIGIT}|{HEX_DIGIT}{HEX_DIGIT_AND_UNDERSCORES}?{HEX_DIGIT}
HEX_NUMERAL                     0[xX]{HEX_DIGITS}

OCTAL_DIGIT                     [0-7]
OCTAL_DIGIT_OR_UNDERSCORE       {OCTAL_DIGIT}|{UNDERSCORE}
OCTAL_DIGIT_AND_UNDERSCORES     {OCTAL_DIGIT_OR_UNDERSCORE}+
OCTAL_DIGITS                    {OCTAL_DIGIT}|{OCTAL_DIGIT}{OCTAL_DIGIT_AND_UNDERSCORES}?{OCTAL_DIGIT}
OCTAL_NUMERAL                   0{OCTAL_DIGITS}

BINARY_DIGIT                    [0-1]
BINARY_DIGIT_OR_UNDERSCORE      {BINARY_DIGIT}|{UNDERSCORE}
BINARY_DIGIT_AND_UNDERSCORES    {BINARY_DIGIT_OR_UNDERSCORE}+
BINARY_DIGITS                   {BINARY_DIGIT}|{BINARY_DIGIT}{BINARY_DIGIT_AND_UNDERSCORES}?{BINARY_DIGIT}
BINARY_NUMERAL                  0[bB]{BINARY_DIGITS}

DECIMAL_INTEGER_LITERAL         {DECIMAL_NUMERAL}{INTEGER_TYPE_SUFFIX}?
HEX_INTEGER_LITERAL             {HEX_NUMERAL}{INTEGER_TYPE_SUFFIX}?
OCTAL_INTEGER_LITERAL           {OCTAL_NUMERAL}{INTEGER_TYPE_SUFFIX}?
BINARY_INTEGER_LITERAL          {BINARY_NUMERAL}{INTEGER_TYPE_SUFFIX}?

INTEGER_LITERAL                 {DECIMAL_INTEGER_LITERAL}|{HEX_INTEGER_LITERAL}|{OCTAL_INTEGER_LITERAL}|{BINARY_INTEGER_LITERAL}

FLOAT_TYPE_SUFFIX               [fFdD]
SIGN                            [\+\-]
SIGNED_INTEGER                  {SIGN}?{DIGITS}
EXPONENT_INDICATOR              [eE]
EXPONENT_PART                   {EXPONENT_INDICATOR}{SIGNED_INTEGER}
DECIMAL_FLOATING_POINT          {DIGITS}\.{DIGITS}?{EXPONENT_PART}?{FLOAT_TYPE_SUFFIX}?|{DIGITS}{EXPONENT_PART}{FLOAT_TYPE_SUFFIX}?|\.{DIGITS}{EXPONENT_PART}?{FLOAT_TYPE_SUFFIX}?|{DIGITS}{EXPONENT_PART}?{FLOAT_TYPE_SUFFIX}

BINARY_EXPONENT_INDICATOR       [pP]
BINARY_EXPONENT_PART            {BINARY_EXPONENT_INDICATOR}{SIGNED_INTEGER}
HEX_SIGNIFICAND                 {HEX_NUMERAL}[\.]?|"0"[xX]{HEX_DIGITS}?\.{HEX_DIGITS}
HEX_FLOATING_POINT              {HEX_SIGNIFICAND}{BINARY_EXPONENT_PART}{FLOAT_TYPE_SUFFIX}?

FLOAT_LITERAL                   {DECIMAL_FLOATING_POINT}|{HEX_FLOATING_POINT}

BOOLEAN_LITERAL                 "true"|"false"

UNICODE_ESCAPES                 \\u[0-9a-fA-F]{4}
ESCAPES                         \\[bstnfr"'\\]
ZERO_TO_THREE                   [0-3]   
OCTAL_ESCAPE                    \\{OCTAL_DIGIT}|\\{ZERO_TO_THREE}?{OCTAL_DIGIT}{OCTAL_DIGIT}
ESCAPE_SEQUENCE                 {UNICODE_ESCAPES}|{ESCAPES}|{OCTAL_ESCAPE}
RAW_INPUT_CHARACTER             [^\r\n\f\\]
UNICODE_INPUT_CHRACTER          {UNICODE_ESCAPES}|{RAW_INPUT_CHARACTER}
INPUT_CHARACTER                 [^\'\\]
WHITE_SPACE                     [\t\f ]
LINE_TERMINATOR                 "\n"|"\r"|"\r\n"

TEXT_BLOCK_LITERAL              "\"\"\""{WHITE_SPACE}*{LINE_TERMINATOR}("\""[^\"\\]|("\"\""[^\\\"])|[^\\\"]|{ESCAPE_SEQUENCE}|{LINE_TERMINATOR})*"\"\"\""

CHAR_LITERAL                    "\'"({ESCAPE_SEQUENCE}|{INPUT_CHARACTER})?"\'"

STRING_INPUT_CHARACTER          [^\n\"]
STRING_CHARACTER                {STRING_INPUT_CHARACTER}|{ESCAPE_SEQUENCE}
STRINGS_LITERAL                 "\""{STRING_CHARACTER}*"\""

NULL_LITERAL                    "null"

LITERALS                        {CHAR_LITERAL}|{NULL_LITERAL}|{BOOLEAN_LITERAL}|{INTEGER_LITERAL}|{FLOAT_LITERAL}|{STRINGS_LITERAL}|{TEXT_BLOCK_LITERAL}

S_COMMENTS                      "//"[^\n]*
COMMENT_START                   "/*"
COMMENT_INTER                   [^*\n]*
COMMENT_INTER2                  "*"[^*/\n]*
COMMENT_END                     "*"+"/"

JAVA_LETTER                     [a-zA-Z_$]
JAVA_LETTER_OR_DIGIT            {JAVA_LETTER}|{DIGIT}
IDENTIFIERS                     {JAVA_LETTER}{JAVA_LETTER_OR_DIGIT}*

%x comment
%%
    /* Rules */
{WHITE_SPACE}               {;}
{NEWLINE}|{S_COMMENTS}       {;}
{COMMENT_START}             BEGIN(comment);
<comment>{COMMENT_INTER}    {;}
<comment>{COMMENT_INTER2}   {;}
<comment>{COMMENT_END}      BEGIN(INITIAL);

{LITERALS}                  {   
                                yylval.elem = create_node(strdup(yytext));
                                return LITERAL;
                            }
{KEYWORDS}                  {   
                                yylval.elem = create_node(strdup(yytext));
                                switch(mp[strdup(yytext)])
                                {
                                    case _ABSTRACT:return ABSTRACT;
                                    case _CONTINUE:return CONTINUE;
                                    case _FOR:return FOR;
                                    case _NEW_KEYWORD:return NEW;
                                    case _SWITCH:return SWITCH;
                                    case _ASSERT:return ASSERT;
                                    case _DEFAULT:return DEFAULT;
                                    case _IF:return IF;
                                    case _PACKAGE:return PACKAGE;
                                    case _SYNCHRONIZED:return SYNCHRONIZED;
                                    case _BOOLEAN:return BOOLEAN;
                                    case _DO:return DO;
                                    case _GOTO:return GOTO;
                                    case _PRIVATE:return PRIVATE;
                                    case _THIS:return THIS;
                                    case _BREAK:return BREAK;
                                    case _DOUBLE:return DOUBLE;
                                    case _IMPLEMENTS:return IMPLEMENTS;
                                    case _PROTECTED:return PROTECTED;
                                    case _THROW:return THROW;
                                    case _BYTE:return BYTE;
                                    case _ELSE:return ELSE;
                                    case _IMPORT:return IMPORT;
                                    case _PUBLIC:return PUBLIC;
                                    case _THROWS:return THROWS;
                                    case _CASE:return CASE;
                                    case _ENUM:return ENUM;
                                    case _INSTANCEOF:return INSTANCEOF;
                                    case _RETURN:return RETURN;
                                    case _TRANSIENT:return TRANSIENT;
                                    case _CATCH:return CATCH;
                                    case _EXTENDS:return EXTENDS;
                                    case _INT:return INT;
                                    case _SHORT:return SHORT;
                                    case _TRY:return TRY;
                                    case _CHAR:return CHAR;
                                    case _FINAL:return FINAL;
                                    case _INTERFACE:return INTERFACE;
                                    case _STATIC:return STATIC;
                                    case _VOID:return VOID;
                                    case _CLASS:return CLASS;
                                    case _FINALLY:return FINALLY;
                                    case _LONG:return LONG;
                                    case _STRICTFP:return STRICTFP;
                                    case _VOLATILE:return VOLATILE;
                                    case _CONST:return CONST;
                                    case _FLOAT:return FLOAT;
                                    case _NATIVE:return NATIVE;
                                    case _SUPER:return SUPER;
                                    case _WHILE:return WHILE;
                                    case _EXPORTS:return EXPORTS;
                                    case _OPENS:return OPENS;
                                    case _REQUIRES:return REQUIRES;
                                    case _USES:return USES;
                                    case _MODULE:return MODULE;
                                    case _PERMITS:return PERMITS;
                                    case _SEALED:return SEALED;
                                    case _VAR:return VAR;
                                    case _NON_SEALED:return NON_SEALED;
                                    case _PROVIDES:return PROVIDES;
                                    case _TO:return TO;
                                    case _WITH:return WITH;
                                    case _OPEN:return OPEN;
                                    case _RECORD:return RECORD;
                                    case _TRANSITIVE:return TRANSITIVE;
                                    case _YIELD:return YIELD;
                                }
                            }
{DELIMITERS}                {   
                                yylval.elem = create_node(strdup(yytext));
                                switch(mp[strdup(yytext)])
                                {
                                    case _LPAREN:return LPAREN;
                                    case _RPAREN:return RPAREN;
                                    case _LMPARA:return LMPARA;
                                    case _RMPARA:return RMPARA;
                                    case _LSPAR:return LSPAR;
                                    case _RSPAR:return RSPAR;
                                    case _SEMICOLON:return SEMICOLON;
                                    case _COMMA:return COMMA;
                                    case _DOT:return DOT;
                                    case _ELLIPSIS:return ELLIPSIS;
                                    case _AT:return AT;
                                }
                            }
{OPERATORS}                 {   
                                yylval.elem = create_node(strdup(yytext));
                                switch(mp[strdup(yytext)])
                                {
                                    case _GT:return GT;
                                    case _LT:return LT;
                                    case _NOT:return NOT;
                                    case _TILDE:return TILDE;
                                    case _QUESTION:return QUESTION;
                                    case _COLON:return COLON;
                                    case _EQUALS:return EQUALS;
                                    case _LE:return LE;
                                    case _GE:return GE;
                                    case _NOT_EQUALS:return NOT_EQUALS;
                                    case _AND:return AND;
                                    case _OR:return OR;
                                    case _PLUS_PLUS:return PLUS_PLUS;
                                    case _MINUS_MINUS:return MINUS_MINUS;
                                    case _PLUS:return PLUS;
                                    case _MINUS:return MINUS;
                                    case _TIMES:return TIMES;
                                    case _DIVIDE:return DIVIDE;
                                    case _XOR:return XOR;
                                    case _MOD:return MOD;
                                    case _LEFT_SHIFT:return LEFT_SHIFT;
                                    case _RIGHT_SHIFT:return RIGHT_SHIFT;
                                    case _UNSIGNED_RIGHT_SHIFT:return UNSIGNED_RIGHT_SHIFT;
                                    case _PLUS_EQUALS:return PLUS_EQUALS;
                                    case _MINUS_EQUALS:return MINUS_EQUALS;
                                    case _TIMES_EQUALS:return TIMES_EQUALS;
                                    case _DIVIDE_EQUALS:return DIVIDE_EQUALS;
                                    case _AND_EQUALS:return AND_EQUALS;
                                    case _OR_EQUALS:return OR_EQUALS;
                                    case _XOR_EQUALS:return XOR_EQUALS;
                                    case _MOD_EQUALS:return MOD_EQUALS;
                                    case _LEFT_SHIFT_EQUALS:return LEFT_SHIFT_EQUALS;
                                    case _RIGHT_SHIFT_EQUALS:return RIGHT_SHIFT_EQUALS;
                                    case _UNSIGNED_RIGHT_SHIFT_EQUALS:return UNSIGNED_RIGHT_SHIFT_EQUALS;
                                }
                            }
{IDENTIFIERS}               {   
                                yylval.elem = create_node(strdup(yytext));
                                return IDENTIFIER;
                            }
.                           {
                                cout << "Couldn't parse: " << strdup(yytext) << endl;
                            }
%%


case _BITWISE_AND:return BITWISE_AND;
case 0:return ;
case _BITWISE_OR:return BITWISE_OR;
case 1:return ;
case _COMMA:return COMMA;
case 2:return ;
case _FINALLY:return FINALLY;
case 3:return ;
case _LPAREN:return LPAREN;
case 4:return ;
case _RPAREN:return RPAREN;
case 5:return ;
case _IDENTIFIER:return IDENTIFIER;
case 6:return ;
case _EQUALS:return EQUALS;
case 7:return ;
case _DOT:return DOT;
case 8:return ;
case _CLASS:return CLASS;
case 9:return ;
case _PUBLIC:return PUBLIC;
case 10:return 0;
case _PRIVATE:return PRIVATE;
case 11:return 1;
case _SEMICOLON:return SEMICOLON;
case 12:return 2;
case _COLON:return COLON;
case 13:return 3;
case _OR:return OR;
case 14:return 4;
case _RETURN:return RETURN;
case 15:return 5;
case _TRY:return TRY;
case 16:return 6;
case _SYNCHRONIZED:return SYNCHRONIZED;
case 17:return 7;
case _THROW:return THROW;
case 18:return 8;
case _BREAK:return BREAK;
case 19:return 9;
case _CONTINUE:return CONTINUE;
case 20:return 0;
case _CATCH:return CATCH;
case 21:return 1;
case _FINAL:return FINAL;
case 22:return 2;
case _IF:return IF;
case 23:return 3;
case _ELSE:return ELSE;
case 24:return 4;
case _WHILE:return WHILE;
case 25:return 5;
case _FOR:return FOR;
case 26:return 6;
case _LSPAR:return LSPAR;
case 27:return 7;
case _RSPAR:return RSPAR;
case 28:return 8;
case _TIMES_EQUALS:return TIMES_EQUALS;
case 29:return 9;
case _DIVIDE_EQUALS:return DIVIDE_EQUALS;
case 30:return 0;
case _MOD_EQUALS:return MOD_EQUALS;
case 31:return 1;
case _PLUS_EQUALS:return PLUS_EQUALS;
case 32:return 2;
case _MINUS_EQUALS:return MINUS_EQUALS;
case 33:return 3;
case _LEFT_SHIFT_EQUALS:return LEFT_SHIFT_EQUALS;
case 34:return 4;
case _RIGHT_SHIFT_EQUALS:return RIGHT_SHIFT_EQUALS;
case 35:return 5;
case _UNSIGNED_RIGHT_SHIFT_EQUALS:return UNSIGNED_RIGHT_SHIFT_EQUALS;
case 36:return 6;
case _AND_EQUALS:return AND_EQUALS;
case 37:return 7;
case _XOR_EQUALS:return XOR_EQUALS;
case 38:return 8;
case _OR_EQUALS:return OR_EQUALS;
case 39:return 9;
case _QUESTION:return QUESTION;
case 40:return 0;
case _NOT_EQUALS:return NOT_EQUALS;
case 41:return 1;
case _LT:return LT;
case 42:return 2;
case _GT:return GT;