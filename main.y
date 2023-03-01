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
    ofstream fout("./result.dot");
    typedef struct node{
        int id;
        string val;
        vector<struct node *> list;
    }NODE;

    NODE* create_node(string val)
    {
        NODE *element = (NODE *)calloc(1, sizeof(NODE));
        element->id = num++;
        element->val;
        return element;
    }
%}

%union {
    NODE *elem;
}

%token <elem>  BITWISE_AND BITWISE_OR COMMA FINALLY DOUBLE_COLON LPAREN RPAREN IDENTIFIER EQUALS DOT CLASS PUBLIC PRIVATE LANGULAR RANGULAR SEMICOLON COLON OR RETURN TRY SYNCHRONIZED THROW ASSERT BREAK CONTINUE CATCH ARROW FINAL IF ELSE WHILE FOR VAR LSPAR RSPAR ELLIPSIS TIMES_EQUALS DIVIDE_EQUALS MOD_EQUALS PLUS_EQUALS MINUS_EQUALS LEFT_SHIFT_EQUALS RIGHT_SHIFT_EQUALS UNSIGNED_RIGHT_SHIFT_EQUALS AND_EQUALS XOR_EQUALS OR_EQUALS QUESTION NOT_EQUALS LT GT LE GE INSTANCEOF AND XOR PLUS MINUS TIMES DIVIDE MOD PLUS_PLUS MINUS_MINUS TILDE THIS SUPER INT LONG SHORT BYTE FLOAT DOUBLE BOOLEAN VOID NOT EXTENDS RMPARA LMPARA PROTECTED STATIC TRANSIENT VOLATILE NATIVE STRICTFP  LEFT_SHIFT RIGHT_SHIFT UNSIGNED_RIGHT_SHIFT ABSTRACT LITERAL THROWS NEW OPEN TRANSITIVE MODULE REQUIRES EXPORTS OPENS USES PROVIDES WITH IMPORT ASTERISK PACKAGE TO
%type <elem>  compilation_unit modular_compliation_unit module_declaration module_directive module_or_package_or_expression_name_list ordinary_complilation_unit package_declaration import_declarations top_level_class_or_interface_declarations import_declaration class_declaration  class_body class_member_declaration  field_declaration method_declaration constructor_declaration  formal_parameter_list formal_parameter variable_declarator variable_declarator_id variable_initializer variable_initializer_list array_initializer block_statements block_statement local_variable_declaration_statement statement statement_no_short_if statement_without_trailing_substatement expression statement_expression module_or_package_or_expression_name type_identifier type type_arguments type_argument type_parameters type_parameter type_bound  method_name method_body method_header method_declarator throws unqualified_method_identifier block local_class_or_interface_declaration local_variable_declaration variable_declarators_list variable_modifiers local_variable_type empty_statement class_instance_creation_expression labeled_statement class_or_interface_type_to_instantiate method_invocation argument_list method_reference type_argument_list wildcard if_then_else_statement if_footer labeled_statement_no_short_if if_then_else_statement_no_short_if while_statement_no_short_if for_statement_no_short_if enhanced_for_statement_no_short_if while_statement for_statement for_init statement_expression_list statement_expressions for_update assert_statement assert break_statement continue_statement return_statement throw_statement synchronized_statement try_statement catch_clause catches finally lambda_body lambda_expression lambda_parameter lambda_parameter_list lambda_parameters more_identifiers expression_statement catch_formal_parameter catch_type more_lambda_parameters dims dim variable_arity_parameter variable_arity_parameter_id assignment_expression assignment left_hand_side field_access array_access assignment_operator conditional_expression conditional_and_expression conditional_or_expression inclusive_or_expression exclusive_or_expression and_expression equality_expression relational_expression shift_expression additive_expression multiplicative_expression unary_expression unary_expression_not_plus_minus postfix_expression primary primary_no_new_array pre_decrement_expression pre_increment_expression post_decrement_expression post_increment_expression array_creation_expression array_creation_folllow array_creation_type_follow dimexpr dimexprs class_literal numeric_type integral_type floating_point_type normal_class_declaration class_modifiers modifier type_parameter_list type_variable_or_class_or_interface_type_list class_type class_extends class_content class_body_declaration exception_type exception_type_list reciever_parameter instance_initializer static_initializer constructor_modifiers constructor_declarator constructor_body simple_type_name explicit_constructor_invocation reference_type array_type primitive_type 

%%
// Grammer
// Start

compilation_unit:
    ordinary_complilation_unit	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   modular_compliation_unit	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

modular_compliation_unit:
    module_declaration	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

module_declaration:
    OPEN MODULE module_or_package_or_expression_name LMPARA module_directive RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   MODULE module_or_package_or_expression_name LMPARA module_directive RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   OPEN MODULE module_or_package_or_expression_name LMPARA RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   MODULE module_or_package_or_expression_name LMPARA RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
;

module_directive:
    REQUIRES TRANSITIVE module_or_package_or_expression_name SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   REQUIRES STATIC module_or_package_or_expression_name SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   REQUIRES module_or_package_or_expression_name SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   EXPORTS module_or_package_or_expression_name SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   EXPORTS module_or_package_or_expression_name SEMICOLON TO module_or_package_or_expression_name_list	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   OPENS module_or_package_or_expression_name SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   OPENS module_or_package_or_expression_name SEMICOLON TO module_or_package_or_expression_name_list	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   USES module_or_package_or_expression_name SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   PROVIDES module_or_package_or_expression_name SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   PROVIDES module_or_package_or_expression_name WITH module_or_package_or_expression_name_list SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
;

module_or_package_or_expression_name_list:
    module_or_package_or_expression_name_list COMMA module_or_package_or_expression_name	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   module_or_package_or_expression_name	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

ordinary_complilation_unit:
    package_declaration import_declarations top_level_class_or_interface_declarations	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   import_declarations top_level_class_or_interface_declarations	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   package_declaration top_level_class_or_interface_declarations	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   top_level_class_or_interface_declarations	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

package_declaration:
    PACKAGE module_or_package_or_expression_name SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

import_declarations:
    import_declarations import_declaration	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   import_declaration	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

import_declaration:
    IMPORT IDENTIFIER SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   IMPORT STATIC IDENTIFIER DOT ASTERISK SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   IMPORT STATIC IDENTIFIER DOT IDENTIFIER SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   IMPORT IDENTIFIER DOT ASTERISK SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
;


top_level_class_or_interface_declarations:
    top_level_class_or_interface_declarations class_declaration	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;    


// names 
module_or_package_or_expression_name:
    type_identifier	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   module_or_package_or_expression_name DOT type_identifier	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

// type identifier() cannot be  permits, record, sealed, var, or yield

type_identifier:
    IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

// unqualified method identifier cannot be yield 
method_name:
    unqualified_method_identifier	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

unqualified_method_identifier:
    IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;



/* Block Statements */

block:
    LMPARA block_statements RMPARA  	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   LMPARA RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;


block_statements:
    block_statements block_statement	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   block_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

block_statement:
    local_class_or_interface_declaration	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   local_variable_declaration_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

local_class_or_interface_declaration:
    class_declaration	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }

;

local_variable_declaration_statement:
    local_variable_declaration SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

local_variable_declaration:
    variable_modifiers local_variable_type variable_declarators_list	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   local_variable_type variable_declarators_list	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

variable_declarators_list:
    variable_declarators_list COMMA variable_declarator	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   variable_declarator	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

variable_declarator:
    variable_declarator_id EQUALS variable_initializer	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   variable_declarator_id	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

variable_modifiers:
    FINAL	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;


local_variable_type:
    type	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   VAR	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

statement:
    statement_without_trailing_substatement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   labeled_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   if_then_else_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   while_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   for_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

statement_without_trailing_substatement:
    block	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   empty_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   expression_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   assert_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   break_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   continue_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   return_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   synchronized_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   throw_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   try_statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

empty_statement:
    SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

labeled_statement:
    IDENTIFIER COLON statement	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

expression_statement:
    statement_expression SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

statement_expression:
    assignment	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   pre_increment_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   pre_decrement_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   post_increment_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   post_decrement_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   method_invocation	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   class_instance_creation_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

class_instance_creation_expression:
    NEW type_arguments class_or_interface_type_to_instantiate LPAREN argument_list RPAREN class_body	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
|   NEW type_arguments class_or_interface_type_to_instantiate LPAREN RPAREN class_body	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   NEW class_or_interface_type_to_instantiate LPAREN RPAREN class_body	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   NEW class_or_interface_type_to_instantiate LPAREN argument_list RPAREN class_body	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
;

class_or_interface_type_to_instantiate:
    module_or_package_or_expression_name type_arguments	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   module_or_package_or_expression_name 	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

method_invocation:
    method_name LPAREN argument_list RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   module_or_package_or_expression_name DOT type_arguments IDENTIFIER LPAREN argument_list RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
|   primary DOT type_arguments IDENTIFIER LPAREN argument_list RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
|   SUPER DOT type_arguments IDENTIFIER LPAREN argument_list RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
|   module_or_package_or_expression_name DOT SUPER DOT type_arguments IDENTIFIER LPAREN argument_list RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7, $8, $9}; $$ = cell; }
|   method_name LPAREN  RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   module_or_package_or_expression_name DOT type_arguments IDENTIFIER LPAREN  RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   primary DOT type_arguments IDENTIFIER LPAREN  RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   SUPER DOT type_arguments IDENTIFIER LPAREN  RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   module_or_package_or_expression_name DOT SUPER DOT type_arguments IDENTIFIER LPAREN RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7, $8}; $$ = cell; }
;

argument_list:
    argument_list COMMA expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

method_reference:
    SUPER DOUBLE_COLON type_arguments IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   module_or_package_or_expression_name DOT SUPER DOUBLE_COLON type_arguments IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   primary DOUBLE_COLON type_arguments IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   module_or_package_or_expression_name DOUBLE_COLON type_arguments IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   class_type DOUBLE_COLON type_arguments NEW	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   SUPER DOUBLE_COLON IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   module_or_package_or_expression_name DOT SUPER DOUBLE_COLON IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   primary DOUBLE_COLON IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   module_or_package_or_expression_name DOUBLE_COLON IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   class_type DOUBLE_COLON NEW	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   array_type DOUBLE_COLON NEW	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

type_arguments:
    LT type_argument_list GT	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

type_argument_list:
    type_argument_list COMMA type_argument	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   type_argument	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

type_argument:
    reference_type	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   wildcard	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

wildcard:
    QUESTION EXTENDS reference_type	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   QUESTION SUPER reference_type	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   QUESTION	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

if_then_else_statement:
    IF LPAREN expression RPAREN if_footer	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
;

if_footer:
    statement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   statement_no_short_if ELSE statement	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

statement_no_short_if:
    statement_without_trailing_substatement	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   labeled_statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   if_then_else_statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   while_statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   for_statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

labeled_statement_no_short_if:
    IDENTIFIER COLON statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

if_then_else_statement_no_short_if:
    IF LPAREN expression RPAREN statement_no_short_if ELSE statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
;

while_statement_no_short_if:
    WHILE LPAREN expression RPAREN statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
;

for_statement_no_short_if:
    FOR LPAREN SEMICOLON expression SEMICOLON for_update RPAREN statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7, $8}; $$ = cell; }
|   FOR LPAREN for_init SEMICOLON expression SEMICOLON for_update RPAREN statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7, $8, $9}; $$ = cell; }
|   FOR LPAREN SEMICOLON SEMICOLON for_update RPAREN statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
|   FOR LPAREN for_init SEMICOLON SEMICOLON for_update RPAREN statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7, $8}; $$ = cell; }
|   FOR LPAREN SEMICOLON expression SEMICOLON RPAREN statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
|   FOR LPAREN for_init SEMICOLON expression SEMICOLON RPAREN statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7, $8}; $$ = cell; }
|   FOR LPAREN SEMICOLON SEMICOLON RPAREN statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   FOR LPAREN for_init SEMICOLON SEMICOLON  RPAREN statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
|   enhanced_for_statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

enhanced_for_statement_no_short_if:
    FOR LPAREN local_variable_declaration COLON expression RPAREN statement_no_short_if	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
;

while_statement:
    WHILE LPAREN expression RPAREN statement	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
;

for_statement:
    FOR LPAREN SEMICOLON expression SEMICOLON for_update RPAREN statement	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7, $8}; $$ = cell; }
|   FOR LPAREN for_init SEMICOLON expression SEMICOLON for_update RPAREN statement	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7, $8, $9}; $$ = cell; }
|   FOR LPAREN SEMICOLON SEMICOLON for_update RPAREN statement	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
|   FOR LPAREN for_init SEMICOLON SEMICOLON for_update RPAREN statement	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7, $8}; $$ = cell; }
|   FOR LPAREN SEMICOLON expression SEMICOLON RPAREN statement	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
|   FOR LPAREN for_init SEMICOLON expression SEMICOLON RPAREN statement	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7, $8}; $$ = cell; }
|   FOR LPAREN SEMICOLON SEMICOLON RPAREN statement	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   FOR LPAREN for_init SEMICOLON SEMICOLON  RPAREN statement	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
;


for_init:
    statement_expression_list	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   local_variable_declaration	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

statement_expression_list:
    statement_expression statement_expressions	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

statement_expressions:
    statement_expressions COMMA statement_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|	{ NODE *cell = create_node(""); cell->list = {}; $$ = cell; }
;

for_update:
    statement_expression_list	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

assert_statement:
    assert expression SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   assert expression COLON expression SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
;

assert:
    ASSERT	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

break_statement:
    BREAK SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   BREAK IDENTIFIER SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

continue_statement:
    CONTINUE SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   CONTINUE IDENTIFIER SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

return_statement:
    RETURN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   RETURN expression SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

synchronized_statement:
    SYNCHRONIZED LPAREN expression RPAREN block	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
;

throw_statement:
    THROW expression SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

try_statement:
    TRY block catches finally	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   TRY block catches	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   TRY block finally	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   TRY block 	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

catches:
    catch_clause catches	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   catch_clause	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

catch_clause:
    CATCH LPAREN catch_formal_parameter RPAREN block	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
;

catch_formal_parameter:
    catch_type IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

catch_type:
    type	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   catch_type OR type	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }

finally:
    FINALLY block	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

/* Expressions */

expression:
   lambda_expression
|  assignment_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

lambda_expression:
    lambda_parameters ARROW lambda_body	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

lambda_parameters:
    IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   LPAREN lambda_parameter_list RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   LPAREN RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

lambda_parameter_list:
    lambda_parameter more_lambda_parameters	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   IDENTIFIER more_identifiers	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

more_lambda_parameters:
    more_lambda_parameters COMMA lambda_parameter	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|    	{ NODE *cell = create_node(""); cell->list = {}; $$ = cell; }
;

more_identifiers:
    more_identifiers COMMA IDENTIFIER 	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   COMMA IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

lambda_parameter:
    variable_modifiers local_variable_type variable_declarator_id	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   local_variable_type variable_declarator_id	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   variable_arity_parameter	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

variable_declarator_id:
    IDENTIFIER dims	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

dims:
    dims dim	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   dim	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

dim:
    LSPAR RSPAR	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

variable_arity_parameter:
    variable_modifiers type variable_arity_parameter_id	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|    type variable_arity_parameter_id	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

variable_arity_parameter_id:
    ELLIPSIS IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

lambda_body:
    expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   block	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

assignment_expression:
    conditional_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   assignment	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

assignment:
    left_hand_side assignment_operator expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

left_hand_side:
    field_access	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   array_access	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

field_access:
    primary DOT IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   SUPER DOT IDENTIFIER	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
/* |   module_or_package_or_expression_name  */
;

array_access:
    module_or_package_or_expression_name LSPAR expression RSPAR	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   primary_no_new_array LSPAR expression RSPAR	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
;

assignment_operator:
    EQUALS	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   TIMES_EQUALS	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   DIVIDE_EQUALS	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   MOD_EQUALS	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   PLUS_EQUALS	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   MINUS_EQUALS	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   LEFT_SHIFT_EQUALS	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   RIGHT_SHIFT_EQUALS	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   UNSIGNED_RIGHT_SHIFT_EQUALS	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   AND_EQUALS	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   XOR_EQUALS	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   OR_EQUALS	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

conditional_expression:
    conditional_or_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   conditional_or_expression QUESTION expression COLON conditional_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   conditional_or_expression QUESTION expression COLON lambda_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
;

conditional_or_expression:
    conditional_and_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   conditional_or_expression OR conditional_and_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

conditional_and_expression:
    inclusive_or_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   conditional_and_expression AND inclusive_or_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

inclusive_or_expression:
    exclusive_or_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   inclusive_or_expression BITWISE_OR exclusive_or_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

exclusive_or_expression:
    and_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   exclusive_or_expression XOR and_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

and_expression:
    equality_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   and_expression BITWISE_AND equality_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

equality_expression:
    relational_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   equality_expression EQUALS relational_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   equality_expression NOT_EQUALS relational_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

relational_expression:
    shift_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   relational_expression LT shift_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   relational_expression GT shift_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   relational_expression LE shift_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   relational_expression GE shift_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   relational_expression INSTANCEOF reference_type	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

shift_expression:
    additive_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   shift_expression LEFT_SHIFT additive_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   shift_expression RIGHT_SHIFT additive_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   shift_expression UNSIGNED_RIGHT_SHIFT additive_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

additive_expression:
    multiplicative_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   additive_expression PLUS multiplicative_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   additive_expression MINUS multiplicative_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

multiplicative_expression:
    unary_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   multiplicative_expression TIMES unary_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   multiplicative_expression DIVIDE unary_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   multiplicative_expression MOD unary_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

unary_expression:
    pre_increment_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   pre_decrement_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   PLUS unary_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   MINUS unary_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   unary_expression_not_plus_minus	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

pre_increment_expression:
    PLUS_PLUS unary_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

pre_decrement_expression:
    MINUS_MINUS unary_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

post_increment_expression:
    postfix_expression PLUS_PLUS	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

post_decrement_expression:
    postfix_expression MINUS_MINUS	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

unary_expression_not_plus_minus:
    postfix_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   TILDE unary_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   NOT unary_expression	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

postfix_expression:
    primary  	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   post_increment_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   post_decrement_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

primary:
    primary_no_new_array	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   array_creation_expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

array_creation_expression:
    NEW array_creation_folllow	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;
array_creation_folllow:
    primitive_type array_creation_type_follow	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   class_type array_creation_type_follow	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

array_creation_type_follow:
    dimexprs dims	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   dimexprs 	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   dims array_initializer	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

dimexprs:
    dimexprs dimexpr	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   dimexpr	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

dimexpr:
    LSPAR expression RSPAR	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

primary_no_new_array:
    LITERAL	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   class_literal	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   THIS	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   module_or_package_or_expression_name DOT THIS	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   LPAREN expression RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   left_hand_side    { NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   method_invocation	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   method_reference	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

class_literal:
    module_or_package_or_expression_name dims DOT CLASS	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   primitive_type DOT CLASS	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   primitive_type dims DOT CLASS	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   module_or_package_or_expression_name DOT CLASS	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   VOID DOT CLASS	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

type:
    primitive_type	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   reference_type	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

numeric_type:
    integral_type	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   floating_point_type	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

integral_type:
    BYTE 	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   SHORT	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   INT	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   LONG	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

floating_point_type:
    FLOAT	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   DOUBLE	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

/* Class Declaration */
class_declaration :
    normal_class_declaration	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

normal_class_declaration:
    class_modifiers CLASS type_identifier type_parameters class_extends class_body	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   class_modifiers CLASS type_identifier type_parameters class_body	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   class_modifiers CLASS type_identifier class_extends class_body	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   class_modifiers CLASS type_identifier class_body	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
;

class_modifiers:
    class_modifiers modifier	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   modifier	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

modifier:
    PUBLIC 	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   PRIVATE	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   ABSTRACT	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   STATIC	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   FINAL	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   STRICTFP	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   SYNCHRONIZED	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   NATIVE	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   PROTECTED	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   TRANSIENT	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   VOLATILE	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

type_parameters:
    LANGULAR type_parameter_list RANGULAR	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

type_parameter_list:
    type_parameter_list COMMA type_parameter	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   type_parameter	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

type_parameter:
    type_identifier type_bound	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   type_identifier 	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

type_bound:
    EXTENDS type_variable_or_class_or_interface_type_list	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

type_variable_or_class_or_interface_type_list:
    class_type	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;   

class_type:
    class_type type_arguments	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   module_or_package_or_expression_name	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

class_extends:
    EXTENDS class_type	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

class_body:
    LMPARA class_content RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   LMPARA RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

class_content:
    class_content class_body_declaration	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   class_body_declaration    	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

class_body_declaration:
    class_member_declaration	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   instance_initializer	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   static_initializer	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   constructor_declaration	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

class_member_declaration:
    field_declaration	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   method_declaration	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

field_declaration:
    modifier type variable_declarators_list SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
;

method_declaration:
    modifier method_header method_body	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

method_header:
    type method_declarator throws	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   VOID method_declarator throws	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   type_parameters type method_declarator throws	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   type_parameters VOID method_declarator throws	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   type method_declarator	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   VOID method_declarator	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   type_parameters type method_declarator	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   type_parameters VOID method_declarator	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

throws:
    THROWS exception_type_list	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

exception_type_list:
    exception_type_list COMMA exception_type	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   exception_type	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

exception_type:
    class_type	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

method_body:
    block	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;


method_declarator:
    IDENTIFIER LPAREN reciever_parameter COMMA formal_parameter_list RPAREN dims	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
|   IDENTIFIER LPAREN formal_parameter_list RPAREN dims	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   IDENTIFIER LPAREN reciever_parameter COMMA RPAREN dims	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   IDENTIFIER LPAREN reciever_parameter COMMA formal_parameter_list RPAREN 	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   IDENTIFIER LPAREN formal_parameter_list RPAREN 	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   IDENTIFIER LPAREN reciever_parameter COMMA RPAREN 	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   IDENTIFIER LPAREN RPAREN dims	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   IDENTIFIER LPAREN RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
;

reciever_parameter:
    type IDENTIFIER DOT THIS 	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   type THIS	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

formal_parameter_list:
    formal_parameter_list COMMA formal_parameter	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   formal_parameter	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

formal_parameter:
    variable_modifiers type variable_declarator_id	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|    type variable_declarator_id	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   variable_arity_parameter	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

instance_initializer:
    block	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

static_initializer:
    STATIC block	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

constructor_declaration:
    constructor_modifiers constructor_declarator throws constructor_body	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   constructor_modifiers constructor_declarator constructor_body	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   constructor_declarator throws constructor_body	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   constructor_declarator constructor_body	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

constructor_modifiers:
    constructor_modifiers modifier	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   modifier	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

constructor_declarator:
    type_parameters simple_type_name LPAREN reciever_parameter formal_parameter_list RPAREN	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
;

simple_type_name:
    type_identifier	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

constructor_body:
    LMPARA explicit_constructor_invocation block_statements RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   LMPARA explicit_constructor_invocation RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   LMPARA block_statements RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   LMPARA RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

explicit_constructor_invocation:
    type_arguments THIS LPAREN argument_list RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   THIS LPAREN argument_list RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   type_arguments THIS LPAREN RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   THIS LPAREN RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   type_arguments SUPER LPAREN argument_list RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   type_arguments SUPER LPAREN  RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   SUPER LPAREN argument_list RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5}; $$ = cell; }
|   SUPER LPAREN RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   module_or_package_or_expression_name DOT type_arguments SUPER LPAREN argument_list RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7, $8}; $$ = cell; }
|   module_or_package_or_expression_name DOT  SUPER LPAREN argument_list RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
|   module_or_package_or_expression_name DOT type_arguments SUPER LPAREN RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
|   module_or_package_or_expression_name DOT  SUPER LPAREN RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
|   primary DOT type_arguments SUPER LPAREN argument_list RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7, $8}; $$ = cell; }
|   primary DOT  SUPER LPAREN argument_list RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
|   primary DOT type_arguments SUPER LPAREN  RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6, $7}; $$ = cell; }
|   primary DOT  SUPER LPAREN  RPAREN SEMICOLON	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4, $5, $6}; $$ = cell; }
;

reference_type:
    class_type	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   array_type	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

array_type:
    primitive_type dims	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
|   class_type dims	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

primitive_type: 
    numeric_type	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   BOOLEAN	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

array_initializer: 
    LMPARA variable_initializer_list COMMA RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3, $4}; $$ = cell; }
|   LMPARA COMMA RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   LMPARA variable_initializer_list RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   LMPARA  RMPARA	{ NODE *cell = create_node(""); cell->list = {$1, $2}; $$ = cell; }
;

variable_initializer_list: 
    variable_initializer_list COMMA variable_initializer 	{ NODE *cell = create_node(""); cell->list = {$1, $2, $3}; $$ = cell; }
|   variable_initializer	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

variable_initializer : 
    expression	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
|   array_initializer	{ NODE *cell = create_node(""); cell->list = {$1}; $$ = cell; }
;

%%

void MakeDOTFile(NODE*cell)
{
    fout << "\t" << cell->id << "\t\t[ style = solid label = \"" + cell->val + "\"  ];" << endl;
    for(auto &child:cell->list)
    {
        fout << "\t" << cell->id << " -> " << child->id << endl;
        MakeDOTFile(child);
    }
}

int main(){
    ifstream infile("./DOT_Template.txt");
    string line;
    while (getline(infile, line))
        fout << line << endl;
    yyparse();
    MakeDOTFile(head);
    fout << "}";
    fout.close();
    return 0;
}