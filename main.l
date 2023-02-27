%{
/* Declaration */
#include "main.tab.h"
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
                                
                            }
{KEYWORDS}                  {   
                                
                            }
{DELIMITERS}                {   
                                
                            }
{OPERATORS}                 {   
                                
                            }
{IDENTIFIERS}               {   
                                
                            }
.                           {
                                
                            }
%%
