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

%token <>  COMMA AT LPAREN RPAREN IDENTIFIER EQUALS DOT CLASS PUBLIC PRIVATE LANGULAR RANGULAR SEMICOLON COLON OR RETURN TRY SYNCHRONIZED THROW ASSERT BREAK CONTINUE YIELD CATCH ARROW FINAL IF ELSE WHILE FOR VAR LSPAR RSPAR ELLIPSIS TIMES_EQUALS DIVIDE_EQUALS MOD_EQUALS PLUS_EQUALS MINUS_EQUALS LEFT_SHIFT_EQUALS RIGHT_SHIFT_EQUALS UNSIGNED_RIGHT_SHIFT_EQUALS AND_EQUALS XOR_EQUALS OR_EQUALS QUES NOT_EQUALS LT GT LE GE INSTANCEOF AND XOR PLUS MINUS TIMES DIVIDE MOD PLUS_PLUS MINUS_MINUS TILDE THIS SUPER INT LONG SHORT BYTE FLOAT DOUBLE BOOLEAN VOID NOT EXTENDS IMPLEMENTS PERMITS RMPARA LMPARA PROTECTED STATIC TRANSIENT VOLATILE NATIVE STRICTFP  LEFT_SHIFT RIGHT_SHIFT UNSIGNED_RIGHT_SHIFT ABSTRACT RECORD ENUM LITERAL THROWS
%type <str>  type primitive_type array_initializer array_init variable_initializer type_name local_class_or_interface_declaration local_variable_declaration_statement local_variable_declaration variable_modifiers local_variable_type statement block_statements block_statement variable_initializer_list variable_init element_value_array_initializer element_value_list element_values marker_annotation type_identifier package_identifier annotations annotation normal_annotation member_value_pairs_list member_value_pairs element_value empty 

%%
/* Grammer */

/* Block Statements */

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

variable_declarators_list:
    variable_declarators_list COMMA variable_declarator
|   variable_declarator
;

variable_declarator:
    variable_declarator_id variable_initializer_opt
;

variable_initializer_opt:
    EQUALS variable_initializer
|
;

variable_modifiers:
    variable_modifiers variable_modifier
|
;

variable_modifier:
    annotation
|   final
;

final:
    FINAL
;

local_variable_type:
    unanntype
|   var
;

statement:
    statement_without_trailing_substatement
|   labeled_statement
|   if_then_statement
|   if_then_else_statement
|   while_statement
|   for_statement
;

statement_without_trailing_substatement:
    block
|   empty_statement
|   expression_statement
|   assert_statement
|   break_statement
|   continue_statement
|   return_statement
|   synchronized_statement
|   throw_statement
|   try_statement
|   yield_statement
;

empty_statement:
    SEMICOLON
;

labeled_statement:
    IDENTIFIER COLON statement
;

expression_statement:
    statement_expression SEMICOLON
;

statement_expression:
    assignment
|   pre_increment_expression
|   pre_decrement_expression
|   post_increment_expression
|   post_decrement_expression
|   method_invocation
|   class_instance_creation_expression
;

if_then_statement:
    if LPAREN expression RPAREN statement 
;

if_then_else_statement:
    if LPAREN expression RPAREN statement_no_short_if else statement
;

if:
    IF
;

else:
    ELSE
;
while_statement:
    while LPAREN expression RPAREN statement
;

while:
    WHILE
;

for_statement:
    for LPAREN for_init_opt SEMICOLON expression_opt SEMICOLON for_update_opt RPAREN statement
;

for:
    FOR
;

for_init_opt:
    for_init
|   
;

for_init:
    statement_expression_list
|   local_variable_declaration
;

statement_expression_list:
    statement_expression statement_expressions
;

statement_expressions:
    statement_expressions COMMA statement_expression
|
;

expression_opt:
    expression
|   
;

for_update_opt:
    for_update
|
;

for_update:
    statement_expression_list
;

assert_statement:
    assert expression SEMICOLON
|   assert expression COLON expression SEMICOLON
;

assert:
    ASSERT
;

break_statement:
    break SEMICOLON
|   break IDENTIFIER SEMICOLON
;

break:
    BREAK
;
continue_statement:
    continue SEMICOLON
|   continue IDENTIFIER SEMICOLON
;

continue:
    CONTINUE
;
return_statement:
    return SEMICOLON
|   return expression SEMICOLON
;

return:
    RETURN
;

synchronized_statement:
    synchronized LPAREN expression RPAREN block
;

synchronized:
    SYNCHRONIZED
;
throw_statement:
    throw expression SEMICOLON
;

throw:
    THROW
;
try_statement:
    try block catches
|   try block catches_opt finally
;

try:
    TRY
;

catches:
    catch_clause catches
|   catch_clause
;

catches_opt:
    catches
|
;

catch_clause:
    catch LPAREN catch_formal_parameter RPAREN block
;

catch:
    CATCH
;

catch_formal_parameter:
    catch_type IDENTIFIER
;

catch_type:
    unanntype
|   catch_type OR unanntype

finally:
    finally block
;

yield_statement:
    yield expression SEMICOLON
;

yield:
    YIELD
;

/* Expressions */

expression:
   lambda_expression
|  assignment_expression
;

lambda_expression:
    lambda_parameters ARROW lambda_body
;

lambda_parameters:
    IDENTIFIER
|   LPAREN lambda_parameter_list RPAREN
;

lambda_parameter_list:
    more_lambda_parameters lambda_parameter
|   more_identifiers IDENTIFIER
;

more_lambda_parameters:
    more_lambda_parameters COMMA lambda_parameter
|   
;

more_identifiers:
    more_identifiers COMMA IDENTIFIER
|
;

lambda_parameter:
    variable_modifiers lambda_parameter_type variable_declarator_id
|   variable_arity_parameter
;

lambda_parameter_type:
    unanntype
|   var
;

var:
    VAR
;
variable_declarator_id:
    IDENTIFIER dims
;

dims:
    annotations LSPAR RSPAR dim
;

dim:
    annotations LSPAR RSPAR
|
;

variable_arity_parameter:
    variable_modifiers unanntype variable_arity_parameter_id
;

variable_arity_parameter_id:
    annotations ELLIPSIS IDENTIFIER
;

lambda_body:
    expression
|   block
;

assignment_expression:
    conditional_expression
|   assignment
;

assignment:
    left_hand_side assignment_operator expression
;

left_hand_side:
    expression_name
|   field_access
|   array_access
;

expression_name: 
    IDENTIFIER
|   ambiguous_name DOT IDENTIFIER
;

ambiguous_name:
    ambiguous_name DOT IDENTIFIER
|   IDENTIFIER
;

assignment_operator:
    EQUALS
|   TIMES_EQUALS
|   DIVIDE_EQUALS
|   MOD_EQUALS
|   PLUS_EQUALS
|   MINUS_EQUALS
|   LEFT_SHIFT_EQUALS
|   RIGHT_SHIFT_EQUALS
|   UNSIGNED_RIGHT_SHIFT_EQUALS
|   AND_EQUALS
|   XOR_EQUALS
|   OR_EQUALS
;

conditional_expression:
    conditional_or_expression
|   conditional_or_expression QUES expression COLON conditional_expression
|   conditional_or_expression QUES expression COLON lambda_expression
;

conditional_or_expression:
    conditional_and_expression
|   conditional_or_expression OR conditional_and_expression
;

conditional_and_expression:
    inclusive_or_expression
|   conditional_and_expression AND inclusive_or_expression
;

inclusive_or_expression:
    exclusive_or_expression
|   inclusive_or_expression OR exclusive_or_expression
;

exclusive_or_expression:
    and_expression
|   exclusive_or_expression XOR and_expression
;

and_expression:
    equality_expression
|   and_expression AND equality_expression
;

equality_expression:
    relational_expression
|   equality_expression EQUALS relational_expression
|   equality_expression NOT_EQUALS relational_expression
;

relational_expression:
    shift_expression
|   relational_expression LT shift_expression
|   relational_expression GT shift_expression
|   relational_expression LE shift_expression
|   relational_expression GE shift_expression
|   relational_expression INSTANCEOF reference_type
;

shift_expression:
    additive_expression
|   shift_expression LEFT_SHIFT additive_expression
|   shift_expression RIGHT_SHIFT additive_expression
|   shift_expression UNSIGNED_RIGHT_SHIFT additive_expression
;

additive_expression:
    multiplicative_expression
|   additive_expression PLUS multiplicative_expression
|   additive_expression MINUS multiplicative_expression
;

multiplicative_expression:
    unary_expression
|   multiplicative_expression TIMES unary_expression
|   multiplicative_expression DIVIDE unary_expression
|   multiplicative_expression MOD unary_expression
;

unary_expression:
    pre_increment_expression
|   pre_decrement_expression
|   PLUS unary_expression
|   MINUS unary_expression
|   unary_expression_not_plus_minus
;

pre_increment_expression:
    PLUS_PLUS unary_expression
;

pre_decrement_expression:
    MINUS_MINUS unary_expression
;

post_increment_expression:
    postfix_expression PLUS_PLUS
;

post_decrement_expression:
    postfix_expression MINUS_MINUS
;

unary_expression_not_plus_minus:
    postfix_expression
|   TILDE unary_expression
|   NOT unary_expression
/* |   cast_expression */
;

postfix_expression:
    primary  
|   expression_name
|   post_increment_expression
|   post_decrement_expression
;

primary:
    primary_no_new_array
|   array_creation_expression
;

primary_no_new_array:
    LITERAL
|   class_literal
|   THIS
|   type_name DOT THIS
|   LPAREN expression RPAREN
|   field_access
|   array_access
|   method_invocation
|   method_reference
;

class_literal:
    type_name brackets DOT CLASS
|   numeric_type brackets DOT CLASS
|   BOOLEAN brackets DOT CLASS
|   VOID DOT CLASS
;

brackets:
    LSPAR RSPAR brackets
|   
;

unanntype:
    unann_primitive_type
;

unann_primitive_type:
    numeric_type
|   boolean
;

numeric_type:
    integral_type
|   floating_point_type
;

integral_type:
    BYTE 
|   SHORT
|   INT
|   LONG
;

floating_point_type:
    FLOAT
|   DOUBLE
;

boolean:
    BOOLEAN
;

/* Class Declaration */
class_declaration :
    normal_class_declaration
|   enum_declaration
|   record_declaration
;

normal_class_declaration:
    class_modifiers CLASS type_identifier type_parameters class_extends class_implements class_permits class_body;
;


class_modifiers:
    class_modifier class_modifiers
|   empty

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

variable_declarator_id_follow:
    EQUALS variable_initializer
|   empty
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

throws:
    THROWS exception_type_list
;

exception_type_list:
    exception_type_list COMMA exception_type
|   exception_type
;

exception_type:
    class_type
|   type_variable
;

method_body:
    block
|   SEMICOLON
;


method_declarator:
    IDENTIFIER LPAREN reciever_parameter formal_parameter_list RPAREN dim
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
|   variable_arity_parameter
;

instance_initializer:
    block
;

static_initializer:
    STATIC block
;

constructor_declaration:
    constructor_modifiers constructor_declarator throws_empty constructor_body
;

constructor_modifiers:
    constructor_modifier constructor_modifiers
|   empty
;

constructor_modifier:
    PUBLIC
|   PRIVATE
|   annotation
|   PROTECTED
;

constructor_declarator:
    type_parameters simple_type_name LPAREN reciever_parameter formal_parameter_list RPAREN
;

simple_type_name:
    type_identifier
;

constructor_body:
    LMPARA explicit_constructor_invocation block_statements RMPARA
|   LMPARA constructor_body_declaration RMPARA
|   LMPARA block_statements RMPARA
|   LMPARA RMPARA
;

explicit_constructor_invocation:
    type_arguments_empty THIS LPAREN argument_list_empty RPAREN SEMICOLON
|   type_arguments_empty SUPER LPAREN argument_list_empty RPAREN SEMICOLON
|   expression_name DOT type_arguments_empty SUPER LPAREN argument_list_empty RPAREN SEMICOLON
|   primary DOT type_arguments_empty SUPER LPAREN argument_list_empty RPAREN SEMICOLON
;

type_arguments_empty:
    type_arguments
|   empty
;


enum_declaration:
    class_modifiers ENUM type_identifier class_implements enum_body
;

enum_body:
    LMPARA enum_constant_list COMMA enum_body_declarations RMPARA
;

enum_constant_list:
    enum_constant_list COMMA enum_constant
|   empty
;

// fix the arguments ke paas wale brackets optional optional betichod
enum_constant:
    annotations IDENTIFIER argument_list_empty class_body_empty
;

class_body_empty:
    class_body
|   empty
;

argument_list_empty:
    argument_list
|   empty
;

enum_body_declarations:
    SEMICOLON class_body_declarations
|   empty
;

class_body_declarations:
    class_body_declarations class_body_declaration
|   empty
;

record_declaration:
    class_modifiers RECORD type_identifier type_parameters record_header class_implements record_body
;

record_header:
    LPAREN record_component_list RPAREN
;

record_component_list:
    record_component_list COMMA record_component
|   empty
;

record_component:
    annotations unanntype IDENTIFIER
|   variable_arity_record_component
;

variable_arity_record_component:
    annotations unanntype annotations ELLIPSIS IDENTIFIER
;

record_body:
    LMPARA record_body_declarations RMPARA
;

record_body_declarations:
    record_body_declarations record_body_declaration
|   empty
;

record_body_declaration:
    class_member_declaration
|   compact_constructor_declaration
;

compact_constructor_declaration:
    constructor_modifiers simple_type_name constructor_body
;






type: primitive_type;

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
    conditional_expression
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
    expression
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