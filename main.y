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

%token <>  COMMA EXPRESSION AT LPAREN RPAREN IDENTIFIER EQUALS DOT SEMICOLON CLASS PUBLIC PRIVATE LANGULAR RANGULAR X Y Z
%type <str>  type primitive_type array_initializer array_init variable_initializer type_name local_class_or_interface_declaration local_variable_declaration_statement local_variable_declaration variable_modifiers local_variable_type statement block_statements block_statement variable_initializer_list variable_init element_value_array_initializer element_value_list element_values marker_annotation type_identifier package_identifier annotations annotation normal_annotation member_value_pairs_list member_value_pairs element_value 

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



// Class Declaration
class_declaration :
    normal_declaration
|   enum_declaration
|   record_declaration
;

normal_annotation:
    class_modifier CLASS type_identifier type_parameters class_extends class_implements class_permits class_body;
;

class_modifier:
    PUBLIC 
|   PRIVATE
;

type_parameters:
    LANGULAR type_parameter_list RANGULAR
|   empty
;

type_parameter_list:
    type_parameter_list COMMA type_parameter
|   type_parameter
;

class_extends:
    EXTENDS class_type
|   empty
;   

class_implements:
    IMPLEMENTS interface_type_list
|   empty
;

interface_type_list:
    interface_type_list COMMA interface_type
;

class_permits:
    PERMITS type_name_list
|   empty
;

type_name_list:
    type_name_list COMMA type_name
|   type_name
;

class_body:
    LMPARA class_body class_body_declaration RMPARA
|   class_body_declaration
;
class_body_declaration:
    class_member_declaration
|   instance_initializer
|   static_initializer
|   constructor_declaration
;

class_member_declaration:
    field_declaration
|   method_declaration
/* |   class_declaration */
|   interface_declaration
|   SEMICOLON
;

field_declaration:
    field_modifier unanntype variable_declarators_list SEMICOLON
;

field_modifier:
    PUBLIC
|   PRIVATE
|   annotation
|   STATIC
|   FINAL
|   TRANSIENT
|   VOLATILE
|   PROTECTED
;

variable_declarators_list:
    variable_declarators_list COMMA variable_declarator
|   variable_declarator
;

variable_declarator:
    variable_declarator_id variable_declarator_id_follow
|   variable_declarator_id
;

variable_declarator_id_follow:
    EQUAL variable_initializer
|   empty
;

dims_empty:
    dims
|   empty
;

variable_declarator_id:
    IDENTIFIER dims_empty
|   IDENTIFIER
;

method_declaration:
    method_modifier method_header method_body
;

method_modifier:
    PUBLIC
|   PRIVATE
|   annotation
|   STATIC
|   FINAL
|   SYNCHRONIZED
|   NATIVE
|   ABSTRACT
|   STRICTFP
|   PROTECTED
;

method_header:
    result method_declarator throws_empty
|   type_parameters annotations result method_declarator throws_empty
;

result:
    unanntype
|   VOID
;

throws_empty:
    throws
|   empty
;

method_declarator:
    IDENTIFIER LPAREN reciever_parameter formal_parameter_list RPAREN dims_empty
;

reciever_parameter:
    annotations unanntype IDENTIFIER DOT THIS 
|   annotations unanntype THIS
|   empty
;

formal_parameter_list:
    formal_parameter_list COMMA formal_parameter
|   formal_parameter
|   empty
;

formal_parameter:
    variable_modifiers unanntype variable_declarator_id
|   variablearity_parameter
;


type: 
primitive_type
;

primitive_type: 
    annotations numeric_type
|   annotations boolean
;

annotations: 
    annotations annotation
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