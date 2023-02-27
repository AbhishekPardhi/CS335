%{
/* Declaration */
#include <bits/stdc++.h>
using namespace std;
int yylex();
extern int yylineno;
void yyerror(const char *s) {
    printf("Error: %s at line %d\n", s, yylineno);
    exit(0);
    return;
}
%}

%union {
    char *str;
}

%token <>  COMMA EXPRESSION AT LPAREN RPAREN IDENTIFIER EQUALS DOT SEMICOLON
%type <str>  type primitive_type array_initializer array_init variable_initializer type_name

%%
/* Grammer */
blocks:
    blocks block
|
;

block:
    block_statements
|
;

block_statements:
    block_statements block_statement
|   block_statement
;

block_statement:
    local_class_or_interface_declaration
|   local_variable_declaration_statement
|   statement
;

local_class_or_interface_declaration:
    class_declaration
|   interface_declaration
;

local_variable_declaration_statement:
    local_variable_declaration SEMICOLON
;

local_variable_declaration:
    variable_modifiers local_variable_type variable_declarators_list
;

variable_modifiers:
    variable_modifiers variable_modifier
|
;

local_variable_type:
    unanntype
|  var
;

statement:



type: primitive_type;

primitive_type: 
    annotation_wrap numeric_type
|   annotation_wrap boolean
;

annotation_wrap: 
    annotation_wrap annotation
|
;

annotation:
    normal_annotation
|   marker_annotation
|   single_element_annotation

normal_annotation: 
    at type_name LPAREN member_value_pairs_list RPAREN

member_value_pairs_list:
    member_value_pair member_value_pairs
| 
;

member_value_pairs: 
    member_value_pairs COMMA member_value_pair
|
;

member_value_pair:
    IDENTIFIER EQUALS element_value
;

element_value:
    conditional_if_expression
|   annotation
|   element_value_array_initializer

element_value_array_initializer:
    element_value_array_initializer Y Z
| 
;

Z:
    element_value_list
;

element_value_list:
    element_value element_values
;

element_values:
    element_values COMMA element_value
|
;

marker_annotation:
    at type_name
;

type_name:
    type_identifier
|   package_identifier DOT type_identifier

type_identifier:
    IDENTIFIER
;

package_identifier:
    IDENTIFIER
;
array_initializer: 
    array_initializer array_init 
|   
;

array_init: X Y;

X: 
    variable_initializer_list 
|   
;

Y: 
    comma
|   
;

variable_initializer_list: variable_initializer variable_init

variable_init: variable_init comma variable_initializer | ;

variable_initializer : 
    EXPRESSION
|   array_initializer
;

comma: 
    COMMA
;

at:
    AT
;
%%

int main(){
    yyparse();
    return 0;
}