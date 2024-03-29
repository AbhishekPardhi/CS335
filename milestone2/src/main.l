%{
    /* Declaration */
    #include <bits/stdc++.h>
    using namespace std;
    #include "Tokens.h"
    #include "data.h"
    #include "data.cpp"
    #include "main.tab.h"
    map<string, int >mp = { {"continue", _CONTINUE}, {"for", _FOR}, {"new", _NEW_KEYWORD}, {"if", _IF}, {"package", _PACKAGE}, {"synchronized", _SYNCHRONIZED}, {"boolean", _BOOLEAN}, {"private", _PRIVATE}, {"this", _THIS}, {"break", _BREAK}, {"double", _DOUBLE}, {"implements", _IMPLEMENTS}, {"throw", _THROW}, {"byte", _BYTE}, {"else", _ELSE}, {"import", _IMPORT}, {"public", _PUBLIC}, {"throws", _THROWS}, {"instanceof", _INSTANCEOF}, {"return", _RETURN}, {"catch", _CATCH}, {"extends", _EXTENDS}, {"int", _INT}, {"short", _SHORT}, {"try", _TRY}, {"char", _CHAR}, {"final", _FINAL}, {"interface", _INTERFACE}, {"static", _STATIC}, {"void", _VOID}, {"class", _CLASS}, {"finally", _FINALLY}, {"long", _LONG}, {"float", _FLOAT}, {"super", _SUPER}, {"while", _WHILE}, {"(", _LPAREN}, {")", _RPAREN}, {"{", _LMPARA}, {"}", _RMPARA}, {"[", _LSPAR}, {"]", _RSPAR}, {";", _SEMICOLON}, {",", _COMMA}, {".", _DOT}, {"=", _EQUALS}, {">", _GT}, {"<", _LT}, {"!", _NOT}, {"~", _TILDE}, {"?", _QUESTION}, {":", _COLON}, {"==", _EQUALS_EQUALS}, {"<=", _LE}, {">=", _GE}, {"!=", _NOT_EQUALS}, {"&&", _AND}, {"||", _OR}, {"++", _PLUS_PLUS}, {"--", _MINUS_MINUS}, {"+", _PLUS}, {"-", _MINUS}, {"*", _TIMES}, {"/", _DIVIDE}, {"^", _XOR}, {"%", _MOD}, {"<<", _LEFT_SHIFT}, {">>", _RIGHT_SHIFT}, {">>>", _UNSIGNED_RIGHT_SHIFT}, {"+=", _PLUS_EQUALS}, {"-=", _MINUS_EQUALS}, {"*=", _TIMES_EQUALS}, {"/=", _DIVIDE_EQUALS}, {"&=", _AND_EQUALS}, {"|=", _OR_EQUALS}, {"^=", _XOR_EQUALS}, {"%=", _MOD_EQUALS}, {"<<=", _LEFT_SHIFT_EQUALS}, {">>=", _RIGHT_SHIFT_EQUALS}, {">>>=", _UNSIGNED_RIGHT_SHIFT_EQUALS}}; 
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

{NULL_LITERAL}                  {   
                                yylval.elem = create_node(1, strdup(yytext));
                                yylval.elem->lineno=yylineno;
                                
                                return NULL_LITERAL;
                            }
{CHAR_LITERAL}              {   
                                yylval.elem = create_node(1, strdup(yytext));
                                yylval.elem->lineno=yylineno;

                                return CHAR_LITERAL;
                            }
{BOOLEAN_LITERAL}              {   
                                yylval.elem = create_node(1, strdup(yytext));
                                yylval.elem->lineno=yylineno;

                                return BOOLEAN_LITERAL;
                            }
{INTEGER_LITERAL}              {   
                                yylval.elem = create_node(1, strdup(yytext));
                                yylval.elem->lineno=yylineno;
                                return INTEGER_LITERAL;
                            }
{FLOAT_LITERAL}              {   
                                yylval.elem = create_node(1, strdup(yytext));
                                yylval.elem->lineno=yylineno;

                                return FLOAT_LITERAL;
                            }
{STRINGS_LITERAL}           {   
                                yylval.elem = create_node(1, strdup(yytext));
                                yylval.elem->lineno=yylineno;

                                return STRING_LITERAL;
                            }
{TEXT_BLOCK_LITERAL}        {   
                                yylval.elem = create_node(1, strdup(yytext));
                                yylval.elem->lineno=yylineno;

                                return TEXTBLOCK_LITERAL;
                            }
{KEYWORDS}                  {   
                                yylval.elem = create_node(1, strdup(yytext));
                                yylval.elem->lineno=yylineno;
                                switch(mp[strdup(yytext)])
                                {
                                    case _CONTINUE:return CONTINUE;
                                    case _FOR:return FOR;
                                    case _NEW_KEYWORD:return NEW;
                                    case _IF:return IF;
                                    case _PACKAGE:return PACKAGE;
                                    case _SYNCHRONIZED:return SYNCHRONIZED;
                                    case _BOOLEAN:return BOOLEAN;
                                    case _PRIVATE:return PRIVATE;
                                    case _THIS:return THIS;
                                    case _BREAK:return BREAK;
                                    case _DOUBLE:return DOUBLE;
                                    case _IMPLEMENTS:return IMPLEMENTS;
                                    case _THROW:return THROW;
                                    case _BYTE:return BYTE;
                                    case _ELSE:return ELSE;
                                    case _IMPORT:return IMPORT;
                                    case _PUBLIC:return PUBLIC;
                                    case _THROWS:return THROWS;
                                    case _INSTANCEOF:return INSTANCEOF;
                                    case _RETURN:return RETURN;
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
                                    case _FLOAT:return FLOAT;
                                    case _SUPER:return SUPER;
                                    case _WHILE:return WHILE;
                                }
                            }
{DELIMITERS}                {   
                                yylval.elem = create_node(1, strdup(yytext));
                                yylval.elem->lineno=yylineno;
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
                                }
                            }
{OPERATORS}                 {   
                                yylval.elem = create_node(1, strdup(yytext));
                                yylval.elem->lineno=yylineno;
                                switch(mp[strdup(yytext)])
                                {
                                    case _BITWISE_AND:return BITWISE_AND;
                                    case _BITWISE_OR:return BITWISE_OR;
                                    case _GT:return GT;
                                    case _LT:return LT;
                                    case _NOT:return NOT;
                                    case _TILDE:return TILDE;
                                    case _QUESTION:return QUESTION;
                                    case _COLON:return COLON;
                                    case _EQUALS_EQUALS:return EQUALS_EQUALS;
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
                                yylval.elem = create_node(1, strdup(yytext));
                                yylval.elem->lineno=yylineno;
                                return IDENTIFIER;
                            }
.                           {
                                cout << "Couldn't parse: " << strdup(yytext) << endl;
                            }
%%

int yywrap()
{
    return 1;
}
