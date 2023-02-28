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

%token <str> IDENTIFIER_NOT DOUBLE_COLON COMMA AT LPAREN RPAREN IDENTIFIER EQUALS DOT FINALLY CLASS PUBLIC PRIVATE LANGULAR RANGULAR SEMICOLON OR COLON RETURN TRY SYNCHRONIZED THROW ASSERT BREAK CONTINUE YIELD CATCH ARROW FINAL IF ELSE WHILE FOR VAR LSPAR RSPAR ELLIPSIS TIMES_EQUALS DIVIDE_EQUALS MOD_EQUALS PLUS_EQUALS MINUS_EQUALS LEFT_SHIFT_EQUALS RIGHT_SHIFT_EQUALS UNSIGNED_RIGHT_SHIFT_EQUALS AND_EQUALS XOR_EQUALS OR_EQUALS QUESTION NOT_EQUALS LT GT LE GE INSTANCEOF AND XOR PLUS MINUS TIMES DIVIDE MOD PLUS_PLUS MINUS_MINUS TILDE THIS SUPER INT LONG SHORT BYTE FLOAT DOUBLE BOOLEAN VOID NOT EXTENDS IMPLEMENTS PERMITS RMPARA LMPARA PROTECTED STATIC TRANSIENT VOLATILE NATIVE STRICTFP  LEFT_SHIFT RIGHT_SHIFT UNSIGNED_RIGHT_SHIFT ABSTRACT RECORD ENUM LITERAL THROWS NEW INTERFACE SEALED NON_SEALED DEFAULT OPEN TRANSITIVE MODULE REQUIRES EXPORTS OPENS USES PROVIDES WITH IMPORT ASTERISK PACKAGE TO
/* %type <str>  type primitive_type array_initializer array_init variable_initializer module_or_package_or_expression_name local_class_or_interface_declaration local_variable_declaration_statement local_variable_declaration variable_modifiers local_variable_type statement block_statements block_statement variable_initializer_list variable_init element_value_array_initializer element_value_list element_values marker_annotation type_identifier package_identifier annotations annotation normal_annotation member_value_pairs_list member_value_pairs element_value    */

%%
/* Grammer */

// Start

compilation_unit:
    ordinary_complilation_unit
/* |   modular_compliation_unit */
;

ordinary_complilation_unit:
    /* package_declaration_opitonal import_declarations */ top_level_class_or_interface_declarations
;


top_level_class_or_interface_declarations:
    top_level_class_or_interface_declarations class_declaration
|    


// names 
module_or_package_or_expression_name:
    type_identifier
|   module_or_package_or_expression_name DOT type_identifier
;

// type identifier() cannot be  permits, record, sealed, var, or yield

type_identifier:
    IDENTIFIER
;

// unqualified method identifier cannot be yield 
method_name:
    unqualified_method_identifier
;

unqualified_method_identifier:
    IDENTIFIER
;



/* Block Statements */

block:
    LMPARA block_statements_opt RMPARA  
;

block_statements_opt:
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
   final
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

class_instance_creation_expression:
    NEW type_arguments_opt class_or_interface_type_to_instantiate LPAREN argument_list_optional RPAREN class_body
;

class_or_interface_type_to_instantiate:
    IDENTIFIER dot_annotation_indentifiers_optional type_arguments_opt
;

dot_annotation_indentifiers_optional:
    dot_annotation_indentifiers_optional DOT IDENTIFIER
|    
;

method_invocation:
    method_name LPAREN argument_list_optional RPAREN
|   module_or_package_or_expression_name DOT type_arguments IDENTIFIER LPAREN argument_list_optional RPAREN
|   primary DOT type_arguments IDENTIFIER LPAREN argument_list_optional RPAREN
|   SUPER DOT type_arguments IDENTIFIER LPAREN argument_list_optional RPAREN
|   module_or_package_or_expression_name DOT SUPER DOT type_arguments IDENTIFIER LPAREN argument_list_optional RPAREN
;

argument_list_optional:
    argument_list
|     
;

argument_list:
    argument_list COMMA expression
|   expression
;

method_reference:
|   SUPER DOUBLE_COLON type_arguments IDENTIFIER
|   module_or_package_or_expression_name DOT SUPER DOUBLE_COLON type_arguments IDENTIFIER
|   primary DOUBLE_COLON type_arguments IDENTIFIER
|   module_or_package_or_expression_name DOUBLE_COLON type_arguments IDENTIFIER
|   class_type DOUBLE_COLON type_arguments NEW
|   array_type DOUBLE_COLON NEW
;

type_arguments:
    LT type_argument_list GT
;

type_argument_list:
    type_argument_list COMMA type_argument
|   type_argument
;

type_argument:
    reference_type
|   wildcard
;

wildcard:
    QUESTION wildcard_bound_opt
;

wildcard_bound_opt:
    EXTENDS reference_type
|   SUPER reference_type
;

if_then_else_statement:
    if LPAREN expression RPAREN if_footer
;

if_footer:
    statement
|   statement_no_short_if else statement
;

statement_no_short_if:
    statement_without_trailing_substatement
|   labeled_statement_no_short_if
|   if_then_else_statement_no_short_if
|   while_statement_no_short_if
|   for_statement_no_short_if
;

labeled_statement_no_short_if:
    IDENTIFIER COLON statement_no_short_if
;

if_then_else_statement_no_short_if:
    if LPAREN expression RPAREN statement_no_short_if ELSE statement_no_short_if
;

while_statement_no_short_if:
    while LPAREN expression RPAREN statement_no_short_if
;

for_statement_no_short_if:
    for LPAREN for_init_opt SEMICOLON expression_opt SEMICOLON for_update_opt RPAREN statement_no_short_if
|   enhanced_for_statement_no_short_if
;

enhanced_for_statement_no_short_if:
    for LPAREN local_variable_declaration COLON expression RPAREN statement_no_short_if
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
    SYNCHRONIZED LPAREN expression RPAREN block
;

throw_statement:
    THROW expression SEMICOLON
;

try_statement:
    TRY block catches_opt finally_opt 
;

finally_opt:
    finally
|    
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
    FINALLY block
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
|   LPAREN lambda_parameter_list_opt RPAREN
;

lambda_parameter_list_opt:
    lambda_parameter_list
;

lambda_parameter_list:
    lambda_parameter more_lambda_parameters
|   IDENTIFIER more_identifiers
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
    LSPAR RSPAR dim
;

dim:
    LSPAR RSPAR
|
;

variable_arity_parameter:
    variable_modifiers unanntype variable_arity_parameter_id
;

variable_arity_parameter_id:
    ELLIPSIS IDENTIFIER
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
    module_or_package_or_expression_name
|   field_access
|   array_access
;

field_access:
    primary DOT IDENTIFIER
|   SUPER DOT IDENTIFIER
|   module_or_package_or_expression_name 
;

array_access:
    module_or_package_or_expression_name LSPAR expression RSPAR
|   primary_no_new_array LSPAR expression RSPAR
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
|   conditional_or_expression QUESTION expression COLON conditional_expression
|   conditional_or_expression QUESTION expression COLON lambda_expression
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
;

postfix_expression:
    primary  
|   post_increment_expression
|   post_decrement_expression
;

primary:
    primary_no_new_array
|   array_creation_expression
;


array_creation_expression:
    NEW array_creation_folllow
;
array_creation_folllow:
    primitive_type array_creation_type_follow
|   class_type array_creation_type_follow
;

array_creation_type_follow:
    dimexprs dims_opt
|   dims array_initializer
;

dimexprs:
    dimexprs dimexpr
|   dimexpr
;

dimexpr:
    LSPAR expression RSPAR
;

dims_opt:
    dims
|    
;

primary_no_new_array:
    LITERAL
|   class_literal
|   THIS
|   module_or_package_or_expression_name DOT THIS
|   LPAREN expression RPAREN
|   field_access
|   array_access
|   method_invocation
|   method_reference
;

class_literal:
    module_or_package_or_expression_name brackets DOT CLASS
|   numeric_type brackets DOT CLASS
|   BOOLEAN brackets DOT CLASS
|   VOID DOT CLASS
;

brackets:
    brackets LSPAR RSPAR 
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
/* |   enum_declaration
|   record_declaration */
;

normal_class_declaration:
    class_modifiers CLASS type_identifier type_parameters_opt class_extends_opt /*class_implements class_permits*/ class_body;
;

class_modifiers:
    class_modifiers class_modifier
|    

class_modifier:
    PUBLIC 
|   PRIVATE
|   ABSTRACT
|   STATIC
|   FINAL
|   STRICTFP
;

type_parameters_opt:
    type_parameters
|    
;

type_parameters:
    LANGULAR type_parameter_list RANGULAR
;

type_parameter_list:
    type_parameter_list COMMA type_parameter
|   type_parameter
;

type_parameter:
    /* type_parameter_modifier */ type_identifier type_bound_opt
;

/* type_parameter_modifier:
    annotations
; */

type_bound_opt:
    type_bound
|    
;

type_bound:
    EXTENDS type_variable_or_class_or_interface_type_list
;

type_variable_or_class_or_interface_type_list:
    class_type /* additional_bounds */
;   

class_type:
    type_identifier type_arguments_opt  
|   class_type DOT type_identifier type_arguments_opt
;

type_arguments_opt:
    type_arguments
|    
;

class_extends_opt:
    class_extends
|    
;

class_extends:
    EXTENDS class_type
;

class_body:
    LMPARA class_content RMPARA
;

class_content:
    class_content class_body_declaration
|    
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
|   SEMICOLON
;

field_declaration:
    field_modifier unanntype variable_declarators_list SEMICOLON
;

static_final:
    STATIC
|   FINAL
;

field_modifier:
    constructor_modifiers
|   static_final
|   TRANSIENT
|   VOLATILE
;

method_declaration:
    method_modifier method_header method_body
;

method_modifier:
    constructor_modifiers
|   static_final
|   SYNCHRONIZED
|   NATIVE
|   ABSTRACT
|   STRICTFP
;

method_header:
    result method_declarator throws_empty
|   type_parameters result method_declarator throws_empty
;

result:
    unanntype
|   VOID
;

throws_empty:
    throws
|    
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
;

method_body:
    block
|   SEMICOLON
;


method_declarator:
    IDENTIFIER LPAREN reciever_parameter formal_parameter_list RPAREN dim
;

reciever_parameter:
    unanntype IDENTIFIER DOT THIS 
|   unanntype THIS
|    
;

formal_parameter_list:
    formal_parameter_list COMMA formal_parameter
|   formal_parameter
|    
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
|    
;

constructor_modifier:
    PUBLIC
|   PRIVATE
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
|   LMPARA explicit_constructor_invocation RMPARA
|   LMPARA block_statements RMPARA
|   LMPARA RMPARA
;

explicit_constructor_invocation:
    type_arguments_opt THIS LPAREN argument_list_optional RPAREN SEMICOLON
|   type_arguments_opt SUPER LPAREN argument_list_optional RPAREN SEMICOLON
|   module_or_package_or_expression_name DOT type_arguments_opt SUPER LPAREN argument_list_optional RPAREN SEMICOLON
|   primary DOT type_arguments_opt SUPER LPAREN argument_list_optional RPAREN SEMICOLON
;

reference_type:
    class_type
|   array_type
;

array_type:
    primitive_type dims
|   class_type dims
;

primitive_type: 
    numeric_type
|   boolean
;

array_initializer: 
    LMPARA variable_initializer_list_opt comma_opt RMPARA
;

variable_initializer_list_opt: 
    variable_initializer_list 
;

comma_opt: 
    COMMA
|    
;

variable_initializer_list: 
    variable_initializer variable_init
;

variable_init: 
    variable_init COMMA variable_initializer 
|    
;

variable_initializer : 
    expression
|   array_initializer
;

%%

int main(){
    yyparse();
    return 0;
}