%{
    /* Declaration */
    #include <bits/stdc++.h>
    #include "data.h"
    // #include "data.cpp"
    using namespace std;
    int yylex();
    extern int yylineno;
    void yyerror(const char *s) {
        printf("\nError: %s at line %d\n", s, yylineno);
        exit(0);
        return;
    }
    NODE *start_node;
    ofstream fout("./result.dot");
    // #define YYSTYPE NODE
%}

%union {
    NODE *elem;
}

%token <elem>  BITWISE_AND BITWISE_OR COMMA FINALLY LPAREN RPAREN IDENTIFIER EQUALS DOT CLASS PUBLIC PRIVATE SEMICOLON COLON OR RETURN TRY SYNCHRONIZED THROW BREAK CONTINUE CATCH FINAL IF ELSE WHILE FOR LSPAR RSPAR TIMES_EQUALS DIVIDE_EQUALS MOD_EQUALS PLUS_EQUALS MINUS_EQUALS LEFT_SHIFT_EQUALS RIGHT_SHIFT_EQUALS UNSIGNED_RIGHT_SHIFT_EQUALS AND_EQUALS XOR_EQUALS OR_EQUALS QUESTION NOT_EQUALS LT GT LE GE INSTANCEOF AND XOR PLUS MINUS TIMES DIVIDE MOD PLUS_PLUS MINUS_MINUS TILDE THIS SUPER INT LONG SHORT BYTE CHAR IMPLEMENTS FLOAT DOUBLE BOOLEAN VOID NOT EXTENDS RMPARA LMPARA STATIC LEFT_SHIFT RIGHT_SHIFT UNSIGNED_RIGHT_SHIFT LITERAL THROWS NEW IMPORT ASTERISK PACKAGE INTERFACE EQUALS_EQUALS 
%type <elem> Goal CompilationUnit Type PrimitiveType NumericType IntegralType FloatingPointType ReferenceType ClassOrInterfaceType ClassType InterfaceType ArrayType Name SimpleName QualifiedName ImportDeclarations TypeDeclarations PackageDeclaration ImportDeclaration TypeDeclaration Modifiers Modifier ClassDeclaration Super Interfaces ClassBody ClassBodyDeclarations ClassBodyDeclaration ClassMemberDeclaration FieldDeclaration VariableDeclarators VariableDeclarator VariableDeclaratorId VariableInitializer MethodDeclaration MethodHeader MethodDeclarator FormalParameterList Throws ClassTypeList MethodBody StaticInitializer ConstructorDeclaration ConstructorDeclarator ConstructorBody InterfaceDeclaration Expression ArrayInitializer FormalParameter Block SingleTypeImportDeclaration TypeImportOnDemandDeclaration AssignmentExpression ConditionalExpression Assignment ConditionalOrExpression LeftHandSide ConditionalAndExpression InclusiveOrExpression ExclusiveOrExpression AndExpression EqualityExpression RelationalExpression ShiftExpression AdditiveExpression MultiplicativeExpression UnaryExpression PreIncrementExpression PreDecrementExpression UnaryExpressionNotPlusMinus PostIncrementExpression PostDecrementExpression CastExpression Primary PrimaryNoNewArray ArrayCreationExpression ArrayAccess FieldAccess MethodInvocation ClassInstanceCreationExpression ArgumentList PostfixExpression InterfaceTypeList ExplicitConstructorInvocation InterfaceBody InterfaceMemberDeclarations InterfaceMemberDeclaration ConstantDeclaration AbstractMethodDeclaration ExtendsInterfaces AssignmentOperator Dims DimExprs DimExpr VariableInitializers BlockStatements BlockStatement LocalVariableDeclarationStatement Statement StatementNoShortIf StatementWithoutTrailingSubstatement IfThenStatement IfThenElseStatement IfThenElseStatementNoShortIf WhileStatement WhileStatementNoShortIf ForStatement ForStatementNoShortIf ForInit ForUpdate StatementExpression StatementExpressionList LocalVariableDeclaration EmptyStatement LabeledStatement ExpressionStatement BreakStatement ContinueStatement ReturnStatement ThrowStatement SynchronizedStatement TryStatement Catches CatchClause Finally LabeledStatementNoShortIf

%%
// Grammer
// Start
Goal:
	CompilationUnit	{ $$ = create_node ( 2 ,"Goal", $1); } 
;

Type:
	PrimitiveType	{ $$ = create_node ( 2 ,"Type", $1); } 
|	ReferenceType	{ $$ = create_node ( 2 ,"Type", $1); } 
;

PrimitiveType:
	NumericType	{ $$ = create_node ( 2 ,"PrimitiveType", $1); } 
|	BOOLEAN	{ $$ = create_node ( 2 ,"PrimitiveType", $1); } 
;

NumericType:
	IntegralType	{ $$ = create_node ( 2 ,"NumericType", $1); } 
|	FloatingPointType	{ $$ = create_node ( 2 ,"NumericType", $1); } 
;

IntegralType:
	BYTE 	{ $$ = create_node ( 2 ,"IntegralType", $1); } 
|	SHORT 	{ $$ = create_node ( 2 ,"IntegralType", $1); } 
|	INT 	{ $$ = create_node ( 2 ,"IntegralType", $1); } 
|	LONG 	{ $$ = create_node ( 2 ,"IntegralType", $1); } 
|	CHAR	{ $$ = create_node ( 2 ,"IntegralType", $1); } 
;

FloatingPointType:
	FLOAT 	{ $$ = create_node ( 2 ,"FloatingPointType", $1); } 
|	DOUBLE	{ $$ = create_node ( 2 ,"FloatingPointType", $1); } 
;

ReferenceType:
	ClassOrInterfaceType	{ $$ = create_node ( 2 ,"ReferenceType", $1); } 
|	ArrayType	{ $$ = create_node ( 2 ,"ReferenceType", $1); } 
;

ClassOrInterfaceType:
	Name	{ $$ = create_node ( 2 ,"ClassOrInterfaceType", $1); } 
;

ClassType:
	ClassOrInterfaceType	{ $$ = create_node ( 2 ,"ClassType", $1); } 
;

InterfaceType:
	ClassOrInterfaceType	{ $$ = create_node ( 2 ,"InterfaceType", $1); } 
;

ArrayType:
	PrimitiveType LSPAR RSPAR 	{ $$ = create_node ( 4 ,"ArrayType", $1, $2, $3); } 
|	Name LSPAR RSPAR	{ $$ = create_node ( 4 ,"ArrayType", $1, $2, $3); } 
|	ArrayType LSPAR RSPAR	{ $$ = create_node ( 4 ,"ArrayType", $1, $2, $3); } 
;


Name:
	SimpleName	{ $$ = create_node ( 2 ,"Name", $1); } 
|	QualifiedName	{ $$ = create_node ( 2 ,"Name", $1); } 
;

SimpleName:
	IDENTIFIER	{ $$ = create_node ( 2 ,"SimpleName", $1); } 
;

QualifiedName:
	Name DOT IDENTIFIER	{ $$ = create_node ( 4 ,"QualifiedName", $1, $2, $3); } 
;

CompilationUnit:
	PackageDeclaration ImportDeclarations TypeDeclarations	{ $$ = create_node ( 4 ,"CompilationUnit", $1, $2, $3); } 
|	ImportDeclarations TypeDeclarations	{ $$ = create_node ( 3 ,"CompilationUnit", $1, $2); } 
|	PackageDeclaration TypeDeclarations	{ $$ = create_node ( 3 ,"CompilationUnit", $1, $2); } 
|	TypeDeclarations	{ $$ = create_node ( 2 ,"CompilationUnit", $1); } 
|	PackageDeclaration ImportDeclarations 	{ $$ = create_node ( 3 ,"CompilationUnit", $1, $2); } 
|	ImportDeclarations 	{ $$ = create_node ( 2 ,"CompilationUnit", $1); } 
|	PackageDeclaration 	{ $$ = create_node ( 2 ,"CompilationUnit", $1); } 
|	{;}
;


ImportDeclarations:
	ImportDeclaration	{ $$ = create_node ( 2 ,"ImportDeclarations", $1); } 
|	ImportDeclarations ImportDeclaration	{ $$ = create_node ( 3 ,"ImportDeclarations", $1, $2); } 
;

TypeDeclarations:
	TypeDeclaration	{ $$ = create_node ( 2 ,"TypeDeclarations", $1); } 
|	TypeDeclarations TypeDeclaration	{ $$ = create_node ( 3 ,"TypeDeclarations", $1, $2); } 
;

PackageDeclaration:
	PACKAGE Name SEMICOLON	{ $$ = create_node ( 4 ,"PackageDeclaration", $1, $2, $3); } 
;

ImportDeclaration:
	SingleTypeImportDeclaration	{ $$ = create_node ( 2 ,"ImportDeclaration", $1); } 
|	TypeImportOnDemandDeclaration	{ $$ = create_node ( 2 ,"ImportDeclaration", $1); } 
;

SingleTypeImportDeclaration:
	IMPORT Name SEMICOLON	{ $$ = create_node ( 4 ,"SingleTypeImportDeclaration", $1, $2, $3); } 
;

TypeImportOnDemandDeclaration:
	IMPORT Name DOT ASTERISK SEMICOLON	{ $$ = create_node ( 6 ,"TypeImportOnDemandDeclaration", $1, $2, $3, $4, $5); } 
;


TypeDeclaration:
	ClassDeclaration	{ $$ = create_node ( 2 ,"TypeDeclaration", $1); } 
|	InterfaceDeclaration	{ $$ = create_node ( 2 ,"TypeDeclaration", $1); } 
|	SEMICOLON	{ $$ = create_node ( 2 ,"TypeDeclaration", $1); } 
;

Modifiers:
	Modifier	{ $$ = create_node ( 2 ,"Modifiers", $1); } 
|	Modifiers Modifier	{ $$ = create_node ( 3 ,"Modifiers", $1, $2); } 
;

Modifier:
	PUBLIC	{ $$ = create_node ( 2 ,"Modifier", $1); } 
|	PRIVATE	{ $$ = create_node ( 2 ,"Modifier", $1); } 
|	STATIC	{ $$ = create_node ( 2 ,"Modifier", $1); } 
|	FINAL	{ $$ = create_node ( 2 ,"Modifier", $1); } 
;

ClassDeclaration:
	Modifiers CLASS IDENTIFIER Super Interfaces ClassBody	{ $$ = create_node ( 7 ,"ClassDeclaration", $1, $2, $3, $4, $5, $6); } 
|	CLASS IDENTIFIER Interfaces ClassBody	{ $$ = create_node ( 5 ,"ClassDeclaration", $1, $2, $3, $4); } 
|	Modifiers CLASS IDENTIFIER Super ClassBody	{ $$ = create_node ( 6 ,"ClassDeclaration", $1, $2, $3, $4, $5); } 
|	Modifiers CLASS IDENTIFIER Interfaces ClassBody	{ $$ = create_node ( 6 ,"ClassDeclaration", $1, $2, $3, $4, $5); } 
|	CLASS IDENTIFIER ClassBody	{ $$ = create_node ( 4 ,"ClassDeclaration", $1, $2, $3); } 
|	Modifiers CLASS IDENTIFIER ClassBody	{ $$ = create_node ( 5 ,"ClassDeclaration", $1, $2, $3, $4); } 
;

Super:
	EXTENDS ClassType	{ $$ = create_node ( 3 ,"Super", $1, $2); } 
;

Interfaces:
	IMPLEMENTS InterfaceTypeList	{ $$ = create_node ( 3 ,"Interfaces", $1, $2); } 
;

InterfaceTypeList:
	InterfaceType	{ $$ = create_node ( 2 ,"InterfaceTypeList", $1); } 
|	InterfaceTypeList COMMA InterfaceType	{ $$ = create_node ( 4 ,"InterfaceTypeList", $1, $2, $3); } 
;

ClassBody:
	LMPARA ClassBodyDeclarations RMPARA	{ $$ = create_node ( 4 ,"ClassBody", $1, $2, $3); } 
|	LMPARA RMPARA	{ $$ = create_node ( 3 ,"ClassBody", $1, $2); } 
;

ClassBodyDeclarations:
	ClassBodyDeclaration	{ $$ = create_node ( 2 ,"ClassBodyDeclarations", $1); } 
|	ClassBodyDeclarations ClassBodyDeclaration	{ $$ = create_node ( 3 ,"ClassBodyDeclarations", $1, $2); } 
;

ClassBodyDeclaration:
	ClassMemberDeclaration	{ $$ = create_node ( 2 ,"ClassBodyDeclaration", $1); } 
|	StaticInitializer	{ $$ = create_node ( 2 ,"ClassBodyDeclaration", $1); } 
|	ConstructorDeclaration	{ $$ = create_node ( 2 ,"ClassBodyDeclaration", $1); } 
;

ClassMemberDeclaration:
	FieldDeclaration	{ $$ = create_node ( 2 ,"ClassMemberDeclaration", $1); } 
|	MethodDeclaration	{ $$ = create_node ( 2 ,"ClassMemberDeclaration", $1); } 
;

FieldDeclaration:
	Modifiers Type VariableDeclarators SEMICOLON	{ $$ = create_node ( 5 ,"FieldDeclaration", $1, $2, $3, $4); } 
|	Type VariableDeclarator SEMICOLON	{ $$ = create_node ( 4 ,"FieldDeclaration", $1, $2, $3); } 
;

VariableDeclarators:
	VariableDeclarator	{ $$ = create_node ( 2 ,"VariableDeclarators", $1); } 
|	VariableDeclarators COMMA VariableDeclarator	{ $$ = create_node ( 4 ,"VariableDeclarators", $1, $2, $3); } 
;

VariableDeclarator:
	VariableDeclaratorId	{ $$ = create_node ( 2 ,"VariableDeclarator", $1); } 
|	VariableDeclaratorId EQUALS VariableInitializer	{ $$ = create_node ( 4 ,"VariableDeclarator", $1, $2, $3); } 
;

VariableDeclaratorId:
	IDENTIFIER	{ $$ = create_node ( 2 ,"VariableDeclaratorId", $1); } 
|	VariableDeclaratorId LSPAR RSPAR	{ $$ = create_node ( 4 ,"VariableDeclaratorId", $1, $2, $3); } 
;

VariableInitializer:
	Expression	{ $$ = create_node ( 2 ,"VariableInitializer", $1); } 
|	ArrayInitializer	{ $$ = create_node ( 2 ,"VariableInitializer", $1); } 
;

MethodDeclaration:
	MethodHeader MethodBody	{ $$ = create_node ( 3 ,"MethodDeclaration", $1, $2); } 
;

MethodHeader:
	Modifiers Type MethodDeclarator Throws	{ $$ = create_node ( 5 ,"MethodHeader", $1, $2, $3, $4); } 
|	Modifiers Type MethodDeclarator	{ $$ = create_node ( 4 ,"MethodHeader", $1, $2, $3); } 
|	Type MethodDeclarator Throws	{ $$ = create_node ( 4 ,"MethodHeader", $1, $2, $3); } 
|	Type MethodDeclarator	{ $$ = create_node ( 3 ,"MethodHeader", $1, $2); } 
|	Modifiers VOID MethodDeclarator Throws	{ $$ = create_node ( 5 ,"MethodHeader", $1, $2, $3, $4); } 
|	Modifiers VOID MethodDeclarator	{ $$ = create_node ( 4 ,"MethodHeader", $1, $2, $3); } 
|	VOID MethodDeclarator Throws	{ $$ = create_node ( 4 ,"MethodHeader", $1, $2, $3); } 
|	VOID MethodDeclarator	{ $$ = create_node ( 3 ,"MethodHeader", $1, $2); } 
;


MethodDeclarator:
	IDENTIFIER LPAREN FormalParameterList RPAREN	{ $$ = create_node ( 5 ,"MethodDeclarator", $1, $2, $3, $4); } 
|	MethodDeclarator LSPAR RSPAR	{ $$ = create_node ( 4 ,"MethodDeclarator", $1, $2, $3); } 
|	IDENTIFIER LPAREN RPAREN	{ $$ = create_node ( 4 ,"MethodDeclarator", $1, $2, $3); } 
;

FormalParameterList:
	FormalParameter	{ $$ = create_node ( 2 ,"FormalParameterList", $1); } 
|	FormalParameterList COMMA FormalParameter	{ $$ = create_node ( 4 ,"FormalParameterList", $1, $2, $3); } 
;

FormalParameter:
	Type VariableDeclaratorId	{ $$ = create_node ( 3 ,"FormalParameter", $1, $2); } 
;

Throws:
	THROWS ClassTypeList	{ $$ = create_node ( 3 ,"Throws", $1, $2); } 
;

ClassTypeList:
	ClassType	{ $$ = create_node ( 2 ,"ClassTypeList", $1); } 
|	ClassTypeList COMMA ClassType	{ $$ = create_node ( 4 ,"ClassTypeList", $1, $2, $3); } 
;

MethodBody:
	Block 	{ $$ = create_node ( 2 ,"MethodBody", $1); } 
|	SEMICOLON	{ $$ = create_node ( 2 ,"MethodBody", $1); } 
;


StaticInitializer:
	STATIC Block	{ $$ = create_node ( 3 ,"StaticInitializer", $1, $2); } 
;


ConstructorDeclaration:
	Modifiers ConstructorDeclarator Throws ConstructorBody	{ $$ = create_node ( 5 ,"ConstructorDeclaration", $1, $2, $3, $4); } 
|	Modifiers ConstructorDeclarator ConstructorBody	{ $$ = create_node ( 4 ,"ConstructorDeclaration", $1, $2, $3); } 
|	ConstructorDeclarator Throws ConstructorBody	{ $$ = create_node ( 4 ,"ConstructorDeclaration", $1, $2, $3); } 
|	ConstructorDeclarator ConstructorBody		{ $$ = create_node ( 3 ,"ConstructorDeclaration", $1, $2); } 
;

ConstructorDeclarator:
	SimpleName LPAREN FormalParameterList RPAREN	{ $$ = create_node ( 5 ,"ConstructorDeclarator", $1, $2, $3, $4); } 
|	SimpleName LPAREN RPAREN	{ $$ = create_node ( 4 ,"ConstructorDeclarator", $1, $2, $3); } 
;

ConstructorBody:
	LMPARA ExplicitConstructorInvocation BlockStatements RMPARA	{ $$ = create_node ( 5 ,"ConstructorBody", $1, $2, $3, $4); } 
|	LMPARA ExplicitConstructorInvocation RMPARA	{ $$ = create_node ( 4 ,"ConstructorBody", $1, $2, $3); } 
|	LMPARA BlockStatements RMPARA	{ $$ = create_node ( 4 ,"ConstructorBody", $1, $2, $3); } 
|	LMPARA RMPARA	{ $$ = create_node ( 3 ,"ConstructorBody", $1, $2); } 
;


ExplicitConstructorInvocation:
	THIS LPAREN ArgumentList RPAREN SEMICOLON	{ $$ = create_node ( 6 ,"ExplicitConstructorInvocation", $1, $2, $3, $4, $5); } 
|	THIS LPAREN RPAREN SEMICOLON	{ $$ = create_node ( 5 ,"ExplicitConstructorInvocation", $1, $2, $3, $4); } 
|	SUPER LPAREN ArgumentList RPAREN SEMICOLON	{ $$ = create_node ( 6 ,"ExplicitConstructorInvocation", $1, $2, $3, $4, $5); } 
|	SUPER LPAREN RPAREN SEMICOLON	{ $$ = create_node ( 5 ,"ExplicitConstructorInvocation", $1, $2, $3, $4); } 
;

InterfaceDeclaration:
	Modifiers INTERFACE IDENTIFIER ExtendsInterfaces InterfaceBody	{ $$ = create_node ( 6 ,"InterfaceDeclaration", $1, $2, $3, $4, $5); } 
|	Modifiers INTERFACE IDENTIFIER InterfaceBody	{ $$ = create_node ( 5 ,"InterfaceDeclaration", $1, $2, $3, $4); } 
|	INTERFACE IDENTIFIER ExtendsInterfaces InterfaceBody	{ $$ = create_node ( 5 ,"InterfaceDeclaration", $1, $2, $3, $4); } 
|	INTERFACE IDENTIFIER InterfaceBody	{ $$ = create_node ( 4 ,"InterfaceDeclaration", $1, $2, $3); } 
;

ExtendsInterfaces:
	EXTENDS InterfaceType	{ $$ = create_node ( 3 ,"ExtendsInterfaces", $1, $2); } 
|	ExtendsInterfaces COMMA InterfaceType	{ $$ = create_node ( 4 ,"ExtendsInterfaces", $1, $2, $3); } 
;

InterfaceBody:
	LMPARA InterfaceMemberDeclarations RMPARA	{ $$ = create_node ( 4 ,"InterfaceBody", $1, $2, $3); } 
|	LMPARA RMPARA	{ $$ = create_node ( 3 ,"InterfaceBody", $1, $2); } 
;

InterfaceMemberDeclarations:
	InterfaceMemberDeclaration	{ $$ = create_node ( 2 ,"InterfaceMemberDeclarations", $1); } 
|	InterfaceMemberDeclarations InterfaceMemberDeclaration	{ $$ = create_node ( 3 ,"InterfaceMemberDeclarations", $1, $2); } 
;

InterfaceMemberDeclaration:
	ConstantDeclaration	{ $$ = create_node ( 2 ,"InterfaceMemberDeclaration", $1); } 
|	AbstractMethodDeclaration	{ $$ = create_node ( 2 ,"InterfaceMemberDeclaration", $1); } 
;

ConstantDeclaration:
	FieldDeclaration	{ $$ = create_node ( 2 ,"ConstantDeclaration", $1); } 
;

AbstractMethodDeclaration:
	MethodHeader SEMICOLON	{ $$ = create_node ( 3 ,"AbstractMethodDeclaration", $1, $2); } 
;


ArrayInitializer:
	LMPARA VariableInitializers COMMA RMPARA	{ $$ = create_node ( 5 ,"ArrayInitializer", $1, $2, $3, $4); } 
|	LMPARA VariableInitializers RMPARA	{ $$ = create_node ( 4 ,"ArrayInitializer", $1, $2, $3); } 
|	LMPARA COMMA RMPARA	{ $$ = create_node ( 4 ,"ArrayInitializer", $1, $2, $3); } 
|	LMPARA RMPARA	{ $$ = create_node ( 3 ,"ArrayInitializer", $1, $2); } 
;

VariableInitializers:
	VariableInitializer	{ $$ = create_node ( 2 ,"VariableInitializers", $1); } 
|	VariableInitializers COMMA VariableInitializer	{ $$ = create_node ( 4 ,"VariableInitializers", $1, $2, $3); } 
;


Block:
	LMPARA BlockStatements RMPARA	{ $$ = create_node ( 4 ,"Block", $1, $2, $3); } 
|	LMPARA RMPARA	{ $$ = create_node ( 3 ,"Block", $1, $2); } 
;

BlockStatements:
	BlockStatement	{ $$ = create_node ( 2 ,"BlockStatements", $1); } 
|	BlockStatements BlockStatement	{ $$ = create_node ( 3 ,"BlockStatements", $1, $2); } 
;

BlockStatement:
	LocalVariableDeclarationStatement	{ $$ = create_node ( 2 ,"BlockStatement", $1); } 
|	Statement	{ $$ = create_node ( 2 ,"BlockStatement", $1); } 
;

LocalVariableDeclarationStatement:
	LocalVariableDeclaration SEMICOLON	{ $$ = create_node ( 3 ,"LocalVariableDeclarationStatement", $1, $2); } 
;

LocalVariableDeclaration:
	Type VariableDeclarators	{ $$ = create_node ( 3 ,"LocalVariableDeclaration", $1, $2); } 
;

Statement:
	StatementWithoutTrailingSubstatement	{ $$ = create_node ( 2 ,"Statement", $1); } 
|	LabeledStatement	{ $$ = create_node ( 2 ,"Statement", $1); } 
|	IfThenStatement	{ $$ = create_node ( 2 ,"Statement", $1); } 
|	IfThenElseStatement	{ $$ = create_node ( 2 ,"Statement", $1); } 
|	WhileStatement	{ $$ = create_node ( 2 ,"Statement", $1); } 
|	ForStatement	{ $$ = create_node ( 2 ,"Statement", $1); } 
;

StatementNoShortIf:
	StatementWithoutTrailingSubstatement	{ $$ = create_node ( 2 ,"StatementNoShortIf", $1); } 
|	LabeledStatementNoShortIf	{ $$ = create_node ( 2 ,"StatementNoShortIf", $1); } 
|	IfThenElseStatementNoShortIf	{ $$ = create_node ( 2 ,"StatementNoShortIf", $1); } 
|	WhileStatementNoShortIf	{ $$ = create_node ( 2 ,"StatementNoShortIf", $1); } 
|	ForStatementNoShortIf	{ $$ = create_node ( 2 ,"StatementNoShortIf", $1); } 
;

StatementWithoutTrailingSubstatement:
	Block	{ $$ = create_node ( 2 ,"StatementWithoutTrailingSubstatement", $1); } 
|	EmptyStatement	{ $$ = create_node ( 2 ,"StatementWithoutTrailingSubstatement", $1); } 
|	ExpressionStatement	{ $$ = create_node ( 2 ,"StatementWithoutTrailingSubstatement", $1); } 
|	BreakStatement	{ $$ = create_node ( 2 ,"StatementWithoutTrailingSubstatement", $1); } 
|	ContinueStatement	{ $$ = create_node ( 2 ,"StatementWithoutTrailingSubstatement", $1); } 
|	ReturnStatement	{ $$ = create_node ( 2 ,"StatementWithoutTrailingSubstatement", $1); } 
|	SynchronizedStatement	{ $$ = create_node ( 2 ,"StatementWithoutTrailingSubstatement", $1); } 
|	ThrowStatement	{ $$ = create_node ( 2 ,"StatementWithoutTrailingSubstatement", $1); } 
|	TryStatement	{ $$ = create_node ( 2 ,"StatementWithoutTrailingSubstatement", $1); } 
;

EmptyStatement:
	SEMICOLON	{ $$ = create_node ( 2 ,"EmptyStatement", $1); } 
;

LabeledStatement:
	IDENTIFIER COLON Statement	{ $$ = create_node ( 4 ,"LabeledStatement", $1, $2, $3); } 
;

LabeledStatementNoShortIf:
	IDENTIFIER COLON StatementNoShortIf	{ $$ = create_node ( 4 ,"LabeledStatementNoShortIf", $1, $2, $3); } 
;

ExpressionStatement:
	StatementExpression SEMICOLON	{ $$ = create_node ( 3 ,"ExpressionStatement", $1, $2); } 
;

StatementExpression:
	Assignment	{ $$ = create_node ( 2 ,"StatementExpression", $1); } 
|	PreIncrementExpression	{ $$ = create_node ( 2 ,"StatementExpression", $1); } 
|	PreDecrementExpression	{ $$ = create_node ( 2 ,"StatementExpression", $1); } 
|	PostIncrementExpression	{ $$ = create_node ( 2 ,"StatementExpression", $1); } 
|	PostDecrementExpression	{ $$ = create_node ( 2 ,"StatementExpression", $1); } 
|	MethodInvocation	{ $$ = create_node ( 2 ,"StatementExpression", $1); } 
|	ClassInstanceCreationExpression	{ $$ = create_node ( 2 ,"StatementExpression", $1); } 
;

IfThenStatement:
	IF LPAREN Expression RPAREN Statement	{ $$ = create_node ( 6 ,"IfThenStatement", $1, $2, $3, $4, $5); } 
;

IfThenElseStatement:
	IF LPAREN Expression RPAREN StatementNoShortIf ELSE Statement	{ $$ = create_node ( 8 ,"IfThenElseStatement", $1, $2, $3, $4, $5, $6, $7); } 
;

IfThenElseStatementNoShortIf:
	IF LPAREN Expression RPAREN StatementNoShortIf ELSE StatementNoShortIf	{ $$ = create_node ( 8 ,"IfThenElseStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7); } 
;

WhileStatement:
	WHILE LPAREN Expression RPAREN Statement	{ $$ = create_node ( 6 ,"WhileStatement", $1, $2, $3, $4, $5); } 
;

WhileStatementNoShortIf:
	WHILE LPAREN Expression RPAREN StatementNoShortIf	{ $$ = create_node ( 6 ,"WhileStatementNoShortIf", $1, $2, $3, $4, $5); } 
;

ForStatement:
	FOR LPAREN ForInit SEMICOLON Expression SEMICOLON ForUpdate RPAREN Statement	{ $$ = create_node ( 10 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7, $8, $9); } 
|	FOR LPAREN ForInit SEMICOLON SEMICOLON ForUpdate RPAREN Statement	{ $$ = create_node ( 9 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7, $8); } 
|	FOR LPAREN SEMICOLON Expression SEMICOLON ForUpdate RPAREN Statement	{ $$ = create_node ( 9 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7, $8); } 
|	FOR LPAREN SEMICOLON SEMICOLON ForUpdate RPAREN Statement	{ $$ = create_node ( 8 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7); } 
|	FOR LPAREN ForInit SEMICOLON Expression SEMICOLON RPAREN Statement	{ $$ = create_node ( 9 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7, $8); } 
|	FOR LPAREN ForInit SEMICOLON SEMICOLON RPAREN Statement	{ $$ = create_node ( 8 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7); } 
|	FOR LPAREN SEMICOLON Expression SEMICOLON RPAREN Statement	{ $$ = create_node ( 8 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7); } 
|	FOR LPAREN SEMICOLON SEMICOLON RPAREN Statement	{ $$ = create_node ( 7 ,"ForStatement", $1, $2, $3, $4, $5, $6); } 
;

ForStatementNoShortIf:
	FOR LPAREN ForInit SEMICOLON Expression SEMICOLON ForUpdate RPAREN StatementNoShortIf	{ $$ = create_node ( 10 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7, $8, $9); } 
|	FOR LPAREN ForInit SEMICOLON SEMICOLON ForUpdate RPAREN StatementNoShortIf	{ $$ = create_node ( 9 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7, $8); } 
|	FOR LPAREN SEMICOLON Expression SEMICOLON ForUpdate RPAREN StatementNoShortIf	{ $$ = create_node ( 9 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7, $8); } 
|	FOR LPAREN SEMICOLON SEMICOLON ForUpdate RPAREN StatementNoShortIf	{ $$ = create_node ( 8 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7); } 
|	FOR LPAREN ForInit SEMICOLON Expression SEMICOLON RPAREN StatementNoShortIf	{ $$ = create_node ( 9 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7, $8); } 
|	FOR LPAREN ForInit SEMICOLON SEMICOLON RPAREN StatementNoShortIf	{ $$ = create_node ( 8 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7); } 
|	FOR LPAREN SEMICOLON Expression SEMICOLON RPAREN StatementNoShortIf	{ $$ = create_node ( 8 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7); } 
|	FOR LPAREN SEMICOLON SEMICOLON RPAREN StatementNoShortIf	{ $$ = create_node ( 7 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6); } 
;

ForInit:
	StatementExpressionList	{ $$ = create_node ( 2 ,"ForInit", $1); } 
|	LocalVariableDeclaration	{ $$ = create_node ( 2 ,"ForInit", $1); } 
;

ForUpdate:
	StatementExpressionList	{ $$ = create_node ( 2 ,"ForUpdate", $1); } 
;

StatementExpressionList:
	StatementExpression	{ $$ = create_node ( 2 ,"StatementExpressionList", $1); } 
|	StatementExpressionList COMMA StatementExpression	{ $$ = create_node ( 4 ,"StatementExpressionList", $1, $2, $3); } 
;

BreakStatement:
	BREAK IDENTIFIER SEMICOLON	{ $$ = create_node ( 4 ,"BreakStatement", $1, $2, $3); } 
|	BREAK SEMICOLON	{ $$ = create_node ( 3 ,"BreakStatement", $1, $2); } 
;

ContinueStatement:
	CONTINUE IDENTIFIER SEMICOLON	{ $$ = create_node ( 4 ,"ContinueStatement", $1, $2, $3); } 
|	CONTINUE SEMICOLON	{ $$ = create_node ( 3 ,"ContinueStatement", $1, $2); } 
;

ReturnStatement:
	RETURN Expression SEMICOLON	{ $$ = create_node ( 4 ,"ReturnStatement", $1, $2, $3); } 
|	RETURN SEMICOLON	{ $$ = create_node ( 3 ,"ReturnStatement", $1, $2); } 
;

ThrowStatement:
	THROW Expression SEMICOLON	{ $$ = create_node ( 4 ,"ThrowStatement", $1, $2, $3); } 
;

SynchronizedStatement:
	SYNCHRONIZED LPAREN Expression RPAREN Block	{ $$ = create_node ( 6 ,"SynchronizedStatement", $1, $2, $3, $4, $5); } 
;

TryStatement:
	TRY Block Catches	{ $$ = create_node ( 4 ,"TryStatement", $1, $2, $3); } 
|	TRY Block Catches Finally	{ $$ = create_node ( 5 ,"TryStatement", $1, $2, $3, $4); } 
|	TRY Block Finally	{ $$ = create_node ( 4 ,"TryStatement", $1, $2, $3); } 
;


Catches:
	CatchClause	{ $$ = create_node ( 2 ,"Catches", $1); } 
|	Catches CatchClause	{ $$ = create_node ( 3 ,"Catches", $1, $2); } 
;

CatchClause:
	CATCH LPAREN FormalParameter RPAREN Block	{ $$ = create_node ( 6 ,"CatchClause", $1, $2, $3, $4, $5); } 
;

Finally:
	FINALLY Block	{ $$ = create_node ( 3 ,"Finally", $1, $2); } 
;

Primary:
	PrimaryNoNewArray	{ $$ = create_node ( 2 ,"Primary", $1); } 
|	ArrayCreationExpression	{ $$ = create_node ( 2 ,"Primary", $1); } 
;

PrimaryNoNewArray:
	LITERAL	{ $$ = create_node ( 2 ,"PrimaryNoNewArray", $1); } 
|	THIS	{ $$ = create_node ( 2 ,"PrimaryNoNewArray", $1); } 
|	LPAREN Expression RPAREN	{ $$ = create_node ( 4 ,"PrimaryNoNewArray", $1, $2, $3); } 
|	ClassInstanceCreationExpression	{ $$ = create_node ( 2 ,"PrimaryNoNewArray", $1); } 
|	FieldAccess	{ $$ = create_node ( 2 ,"PrimaryNoNewArray", $1); } 
|	MethodInvocation	{ $$ = create_node ( 2 ,"PrimaryNoNewArray", $1); } 
|	ArrayAccess	{ $$ = create_node ( 2 ,"PrimaryNoNewArray", $1); } 
;

ClassInstanceCreationExpression:
	NEW ClassType LPAREN ArgumentList RPAREN	{ $$ = create_node ( 6 ,"ClassInstanceCreationExpression", $1, $2, $3, $4, $5); } 
|	NEW ClassType LPAREN RPAREN	{ $$ = create_node ( 5 ,"ClassInstanceCreationExpression", $1, $2, $3, $4); } 
;

ArgumentList:
	Expression	{ $$ = create_node ( 2 ,"ArgumentList", $1); } 
|	ArgumentList COMMA Expression	{ $$ = create_node ( 4 ,"ArgumentList", $1, $2, $3); } 
;

ArrayCreationExpression:
	NEW PrimitiveType DimExprs Dims	{ $$ = create_node ( 5 ,"ArrayCreationExpression", $1, $2, $3, $4); } 
|	NEW PrimitiveType DimExprs	{ $$ = create_node ( 4 ,"ArrayCreationExpression", $1, $2, $3); } 
|	NEW ClassOrInterfaceType DimExprs Dims	{ $$ = create_node ( 5 ,"ArrayCreationExpression", $1, $2, $3, $4); } 
|	NEW ClassOrInterfaceType DimExprs	{ $$ = create_node ( 4 ,"ArrayCreationExpression", $1, $2, $3); } 
;

DimExprs:
	DimExpr	{ $$ = create_node ( 2 ,"DimExprs", $1); } 
|	DimExprs DimExpr	{ $$ = create_node ( 3 ,"DimExprs", $1, $2); } 
;

DimExpr:
	LSPAR Expression RSPAR	{ $$ = create_node ( 4 ,"DimExpr", $1, $2, $3); } 
;

Dims:
	LSPAR RSPAR	{ $$ = create_node ( 3 ,"Dims", $1, $2); } 
|	Dims LSPAR RSPAR	{ $$ = create_node ( 4 ,"Dims", $1, $2, $3); } 
;

FieldAccess:
	Primary DOT IDENTIFIER	{ $$ = create_node ( 4 ,"FieldAccess", $1, $2, $3); } 
|	SUPER DOT IDENTIFIER	{ $$ = create_node ( 4 ,"FieldAccess", $1, $2, $3); } 
;

MethodInvocation:
	Name LPAREN ArgumentList RPAREN	{ $$ = create_node ( 5 ,"MethodInvocation", $1, $2, $3, $4); } 
|	Name LPAREN RPAREN	{ $$ = create_node ( 4 ,"MethodInvocation", $1, $2, $3); } 
|	Primary DOT IDENTIFIER LPAREN ArgumentList RPAREN	{ $$ = create_node ( 7 ,"MethodInvocation", $1, $2, $3, $4, $5, $6); } 
|	Primary DOT IDENTIFIER LPAREN RPAREN	{ $$ = create_node ( 6 ,"MethodInvocation", $1, $2, $3, $4, $5); } 
|	SUPER DOT IDENTIFIER LPAREN ArgumentList RPAREN	{ $$ = create_node ( 7 ,"MethodInvocation", $1, $2, $3, $4, $5, $6); } 
|	SUPER DOT IDENTIFIER LPAREN RPAREN	{ $$ = create_node ( 6 ,"MethodInvocation", $1, $2, $3, $4, $5); } 
;


ArrayAccess:
	Name LSPAR Expression RSPAR	{ $$ = create_node ( 5 ,"ArrayAccess", $1, $2, $3, $4); } 
|	PrimaryNoNewArray LSPAR Expression RSPAR	{ $$ = create_node ( 5 ,"ArrayAccess", $1, $2, $3, $4); } 
;

PostfixExpression:
	Primary	{ $$ = create_node ( 2 ,"PostfixExpression", $1); } 
|	Name	{ $$ = create_node ( 2 ,"PostfixExpression", $1); } 
|	PostIncrementExpression	{ $$ = create_node ( 2 ,"PostfixExpression", $1); } 
|	PostDecrementExpression	{ $$ = create_node ( 2 ,"PostfixExpression", $1); } 
;

PostIncrementExpression:
	PostfixExpression PLUS_PLUS	{ $$ = create_node ( 3 ,"PostIncrementExpression", $1, $2); } 
;

PostDecrementExpression:
	PostfixExpression MINUS_MINUS	{ $$ = create_node ( 3 ,"PostDecrementExpression", $1, $2); } 
;

UnaryExpression:
	PreIncrementExpression	{ $$ = create_node ( 2 ,"UnaryExpression", $1); } 
|	PreDecrementExpression	{ $$ = create_node ( 2 ,"UnaryExpression", $1); } 
|	PLUS UnaryExpression	{ $$ = create_node ( 3 ,"UnaryExpression", $1, $2); } 
|	MINUS UnaryExpression	{ $$ = create_node ( 3 ,"UnaryExpression", $1, $2); } 
|	UnaryExpressionNotPlusMinus	{ $$ = create_node ( 2 ,"UnaryExpression", $1); } 
;

PreIncrementExpression:
	PLUS_PLUS UnaryExpression	{ $$ = create_node ( 3 ,"PreIncrementExpression", $1, $2); } 
;

PreDecrementExpression:
	MINUS_MINUS UnaryExpression	{ $$ = create_node ( 3 ,"PreDecrementExpression", $1, $2); } 
;

UnaryExpressionNotPlusMinus:
	PostfixExpression	{ $$ = create_node ( 2 ,"UnaryExpressionNotPlusMinus", $1); } 
|	TILDE UnaryExpression	{ $$ = create_node ( 3 ,"UnaryExpressionNotPlusMinus", $1, $2); } 
|	NOT UnaryExpression	{ $$ = create_node ( 3 ,"UnaryExpressionNotPlusMinus", $1, $2); } 
|	CastExpression	{ $$ = create_node ( 2 ,"UnaryExpressionNotPlusMinus", $1); } 
;

CastExpression:
	LPAREN PrimitiveType Dims RPAREN UnaryExpression	{ $$ = create_node ( 6 ,"CastExpression", $1, $2, $3, $4, $5); } 
|	LPAREN PrimitiveType RPAREN UnaryExpression	{ $$ = create_node ( 5 ,"CastExpression", $1, $2, $3, $4); } 
|	LPAREN Expression RPAREN UnaryExpressionNotPlusMinus	{ $$ = create_node ( 5 ,"CastExpression", $1, $2, $3, $4); } 
|	LPAREN Name Dims RPAREN UnaryExpressionNotPlusMinus	{ $$ = create_node ( 6 ,"CastExpression", $1, $2, $3, $4, $5); } 
;

MultiplicativeExpression:
	UnaryExpression	{ $$ = create_node ( 2 ,"MultiplicativeExpression", $1); } 
|	MultiplicativeExpression TIMES UnaryExpression	{ $$ = create_node ( 4 ,"MultiplicativeExpression", $1, $2, $3); } 
|	MultiplicativeExpression DIVIDE UnaryExpression	{ $$ = create_node ( 4 ,"MultiplicativeExpression", $1, $2, $3); } 
|	MultiplicativeExpression MOD UnaryExpression	{ $$ = create_node ( 4 ,"MultiplicativeExpression", $1, $2, $3); } 
;

AdditiveExpression:
	MultiplicativeExpression	{ $$ = create_node ( 2 ,"AdditiveExpression", $1); } 
|	AdditiveExpression PLUS MultiplicativeExpression	{ $$ = create_node ( 4 ,"AdditiveExpression", $1, $2, $3); } 
|	AdditiveExpression MINUS MultiplicativeExpression	{ $$ = create_node ( 4 ,"AdditiveExpression", $1, $2, $3); } 
;

ShiftExpression:
	AdditiveExpression	{ $$ = create_node ( 2 ,"ShiftExpression", $1); } 
|	ShiftExpression LEFT_SHIFT AdditiveExpression	{ $$ = create_node ( 4 ,"ShiftExpression", $1, $2, $3); } 
|	ShiftExpression RIGHT_SHIFT AdditiveExpression	{ $$ = create_node ( 4 ,"ShiftExpression", $1, $2, $3); } 
|	ShiftExpression UNSIGNED_RIGHT_SHIFT AdditiveExpression	{ $$ = create_node ( 4 ,"ShiftExpression", $1, $2, $3); } 
;

RelationalExpression:
	ShiftExpression	{ $$ = create_node ( 2 ,"RelationalExpression", $1); } 
|	RelationalExpression LT ShiftExpression	{ $$ = create_node ( 4 ,"RelationalExpression", $1, $2, $3); } 
|	RelationalExpression GT ShiftExpression	{ $$ = create_node ( 4 ,"RelationalExpression", $1, $2, $3); } 
|	RelationalExpression LE ShiftExpression	{ $$ = create_node ( 4 ,"RelationalExpression", $1, $2, $3); } 
|	RelationalExpression GE ShiftExpression	{ $$ = create_node ( 4 ,"RelationalExpression", $1, $2, $3); } 
|	RelationalExpression INSTANCEOF ReferenceType	{ $$ = create_node ( 4 ,"RelationalExpression", $1, $2, $3); } 
;

EqualityExpression:
	RelationalExpression	{ $$ = create_node ( 2 ,"EqualityExpression", $1); } 
|	EqualityExpression EQUALS_EQUALS RelationalExpression	{ $$ = create_node ( 4 ,"EqualityExpression", $1, $2, $3); } 
|	EqualityExpression NOT_EQUALS RelationalExpression	{ $$ = create_node ( 4 ,"EqualityExpression", $1, $2, $3); } 
;
AndExpression:
	EqualityExpression	{ $$ = create_node ( 2 ,"AndExpression", $1); } 
|	AndExpression BITWISE_AND EqualityExpression	{ $$ = create_node ( 4 ,"AndExpression", $1, $2, $3); } 
;

ExclusiveOrExpression:
	AndExpression	{ $$ = create_node ( 2 ,"ExclusiveOrExpression", $1); } 
|	ExclusiveOrExpression XOR AndExpression	{ $$ = create_node ( 4 ,"ExclusiveOrExpression", $1, $2, $3); } 
;

InclusiveOrExpression:
	ExclusiveOrExpression	{ $$ = create_node ( 2 ,"InclusiveOrExpression", $1); } 
|	InclusiveOrExpression BITWISE_OR ExclusiveOrExpression	{ $$ = create_node ( 4 ,"InclusiveOrExpression", $1, $2, $3); } 
;

ConditionalAndExpression:
	InclusiveOrExpression	{ $$ = create_node ( 2 ,"ConditionalAndExpression", $1); } 
|	ConditionalAndExpression AND InclusiveOrExpression	{ $$ = create_node ( 4 ,"ConditionalAndExpression", $1, $2, $3); } 
;

ConditionalOrExpression:
	ConditionalAndExpression	{ $$ = create_node ( 2 ,"ConditionalOrExpression", $1); } 
|	ConditionalOrExpression OR ConditionalAndExpression	{ $$ = create_node ( 4 ,"ConditionalOrExpression", $1, $2, $3); } 
;

ConditionalExpression:
	ConditionalOrExpression	{ $$ = create_node ( 2 ,"ConditionalExpression", $1); } 
|	ConditionalOrExpression QUESTION Expression COLON ConditionalExpression	{ $$ = create_node ( 6 ,"ConditionalExpression", $1, $2, $3, $4, $5); } 
;

AssignmentExpression:
	ConditionalExpression	{ $$ = create_node ( 2 ,"AssignmentExpression", $1); } 
|	Assignment	{ $$ = create_node ( 2 ,"AssignmentExpression", $1); } 
;

Assignment:
	LeftHandSide AssignmentOperator AssignmentExpression	{ $$ = create_node ( 4 ,"Assignment", $1, $2, $3); } 
;

LeftHandSide:
	Name	{ $$ = create_node ( 2 ,"LeftHandSide", $1); } 
|	FieldAccess	{ $$ = create_node ( 2 ,"LeftHandSide", $1); } 
|	ArrayAccess	{ $$ = create_node ( 2 ,"LeftHandSide", $1); } 
;

AssignmentOperator: 
	EQUALS 	{ $$ = create_node ( 2 ,"AssignmentOperator", $1); } 
|	TIMES_EQUALS 	{ $$ = create_node ( 2 ,"AssignmentOperator", $1); } 
|	DIVIDE_EQUALS	{ $$ = create_node ( 2 ,"AssignmentOperator", $1); } 
|	MOD_EQUALS 	{ $$ = create_node ( 2 ,"AssignmentOperator", $1); } 
|	PLUS_EQUALS 	{ $$ = create_node ( 2 ,"AssignmentOperator", $1); } 
|	MINUS_EQUALS 	{ $$ = create_node ( 2 ,"AssignmentOperator", $1); } 
|	LEFT_SHIFT_EQUALS RIGHT_SHIFT_EQUALS UNSIGNED_RIGHT_SHIFT_EQUALS 	{ $$ = create_node ( 4 ,"AssignmentOperator", $1, $2, $3); } 
|	AND_EQUALS 	{ $$ = create_node ( 2 ,"AssignmentOperator", $1); } 
|	XOR_EQUALS 	{ $$ = create_node ( 2 ,"AssignmentOperator", $1); } 
|	OR_EQUALS	{ $$ = create_node ( 2 ,"AssignmentOperator", $1); } 
;

Expression:
	AssignmentExpression	{ $$ = create_node ( 2 ,"Expression", $1); } 
;

%%

void MakeDOTFile(NODE*cell)
{
    if(!cell)
        return;
    string value = string(cell->val);
    if(value.length()>2 && value[0]=='"' && value[value.length()-1]=='"')
    {
        value = value.substr(1,value.length()-2);
        value="\\\""+value+"\\\"";
    }
    fout << "\t" << cell->id << "\t\t[ style = solid label = \"" + value + "\"  ];" << endl;
    for(int i=0;i<cell->children.size();i++)
    {
        if(!cell->children[i])
            continue;
        fout << "\t" << cell->id << " -> " << cell->children[i]->id << endl;
        MakeDOTFile(cell->children[i]);
    }
}

int main(){
    yydebug = 1;
    ifstream infile("./DOT_Template.txt");
    string line;
    while (getline(infile, line))
        fout << line << endl;
    yyparse();
    cout<<"done";
    MakeDOTFile(start_node);
    fout << "}";
    fout.close();
    return 0;
}