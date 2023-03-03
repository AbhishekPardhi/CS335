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

%token <elem>  BITWISE_AND BITWISE_OR COMMA FINALLY LPAREN RPAREN IDENTIFIER EQUALS DOT CLASS PUBLIC PRIVATE SEMICOLON COLON OR RETURN TRY SYNCHRONIZED THROW BREAK CONTINUE CATCH FINAL IF ELSE WHILE FOR LSPAR RSPAR TIMES_EQUALS DIVIDE_EQUALS MOD_EQUALS PLUS_EQUALS MINUS_EQUALS LEFT_SHIFT_EQUALS RIGHT_SHIFT_EQUALS UNSIGNED_RIGHT_SHIFT_EQUALS AND_EQUALS XOR_EQUALS OR_EQUALS QUESTION NOT_EQUALS LT GT LE GE INSTANCEOF AND XOR PLUS MINUS TIMES DIVIDE MOD PLUS_PLUS MINUS_MINUS TILDE THIS SUPER INT LONG SHORT BYTE CHAR IMPLEMENTS FLOAT DOUBLE BOOLEAN VOID NOT EXTENDS RMPARA LMPARA STATIC LEFT_SHIFT RIGHT_SHIFT UNSIGNED_RIGHT_SHIFT LITERAL THROWS NEW IMPORT ASTERISK PACKAGE INTERFACE EQUALS_EQUALS
%type <elem> Goal CompilationUnit Type PrimitiveType NumericType IntegralType FloatingPointType ReferenceType ClassOrInterfaceType ClassType InterfaceType ArrayType Name SimpleName QualifiedName ImportDeclarations TypeDeclarations PackageDeclaration ImportDeclaration TypeDeclaration Modifiers Modifier ClassDeclaration Super Interfaces ClassBody ClassBodyDeclarations ClassBodyDeclaration ClassMemberDeclaration FieldDeclaration VariableDeclarators VariableDeclarator VariableDeclaratorId VariableInitializer MethodDeclaration MethodHeader MethodDeclarator FormalParameterList Throws ClassTypeList MethodBody StaticInitializer ConstructorDeclaration ConstructorDeclarator ConstructorBody InterfaceDeclaration Expression ArrayInitializer FormalParameter Block SingleTypeImportDeclaration TypeImportOnDemandDeclaration AssignmentExpression ConditionalExpression Assignment ConditionalOrExpression LeftHandSide ConditionalAndExpression InclusiveOrExpression ExclusiveOrExpression AndExpression EqualityExpression RelationalExpression ShiftExpression AdditiveExpression MultiplicativeExpression UnaryExpression PreIncrementExpression PreDecrementExpression UnaryExpressionNotPlusMinus PostIncrementExpression PostDecrementExpression CastExpression Primary PrimaryNoNewArray ArrayCreationExpression ArrayAccess FieldAccess MethodInvocation ClassInstanceCreationExpression ArgumentList PostfixExpression

%%
// Grammer
// Start
Goal:
	CompilationUnit
;

Type:
	PrimitiveType
|	ReferenceType
;

PrimitiveType:
	NumericType
|	BOOLEAN
;

NumericType:
	IntegralType
|	FloatingPointType
;

IntegralType:
	BYTE 
|	SHORT 
|	INT 
|	LONG 
|	CHAR
;

FloatingPointType:
	FLOAT 
|	DOUBLE
;

ReferenceType:
	ClassOrInterfaceType
|	ArrayType
;

ClassOrInterfaceType:
	Name
;

ClassType:
	ClassOrInterfaceType
;

InterfaceType:
	ClassOrInterfaceType
;

ArrayType:
	PrimitiveType LSPAR RSPAR 
|	Name LSPAR RSPAR
|	ArrayType LSPAR RSPAR
;


Name:
	SimpleName
|	QualifiedName
;

SimpleName:
	IDENTIFIER
;

QualifiedName:
	Name DOT IDENTIFIER
;

CompilationUnit:
	PackageDeclaration ImportDeclarations TypeDeclarations
|	ImportDeclarations TypeDeclarations
|	PackageDeclaration TypeDeclarations
|	TypeDeclarations
|	PackageDeclaration ImportDeclarations 
|	ImportDeclarations 
|	PackageDeclaration 
|	{}
;


ImportDeclarations:
	ImportDeclaration
|	ImportDeclarations ImportDeclaration
;

TypeDeclarations:
	TypeDeclaration
|	TypeDeclarations TypeDeclaration
;

PackageDeclaration:
	PACKAGE Name SEMICOLON
;

ImportDeclaration:
	SingleTypeImportDeclaration
|	TypeImportOnDemandDeclaration
;

SingleTypeImportDeclaration:
	IMPORT Name SEMICOLON
;

TypeImportOnDemandDeclaration:
	IMPORT Name DOT ASTERISK SEMICOLON
;


TypeDeclaration:
	ClassDeclaration
|	InterfaceDeclaration
|	SEMICOLON
;

Modifiers:
	Modifier
|	Modifiers Modifier
;

Modifier:
	PUBLIC
|	PRIVATE
|	STATIC
|	FINAL
;

ClassDeclaration:
	Modifiers CLASS IDENTIFIER Super Interfaces ClassBody
|	CLASS IDENTIFIER Interfaces ClassBody
|	Modifiers CLASS IDENTIFIER Super ClassBody
|	Modifiers CLASS IDENTIFIER Interfaces ClassBody
|	CLASS IDENTIFIER ClassBody
|	Modifiers CLASS IDENTIFIER ClassBody
;

Super:
	EXTENDS ClassType
;

Interfaces:
	IMPLEMENTS InterfaceTypeList
;

InterfaceTypeList:
	InterfaceType
|	InterfaceTypeList COMMA InterfaceType
;

ClassBody:
	LMPARA ClassBodyDeclarations RMPARA
|	LMPARA RMPARA
;

ClassBodyDeclarations:
	ClassBodyDeclaration
|	ClassBodyDeclarations ClassBodyDeclaration
;

ClassBodyDeclaration:
	ClassMemberDeclaration
|	StaticInitializer
|	ConstructorDeclaration
;

ClassMemberDeclaration:
	FieldDeclaration
|	MethodDeclaration
;

FieldDeclaration:
	Modifiers Type VariableDeclarators SEMICOLON
|	Type VariableDeclarator SEMICOLON
;

VariableDeclarators:
	VariableDeclarator
|	VariableDeclarators COMMA VariableDeclarator
;

VariableDeclarator:
	VariableDeclaratorId
|	VariableDeclaratorId EQUALS VariableInitializer
;

VariableDeclaratorId:
	IDENTIFIER
|	VariableDeclaratorId LSPAR RSPAR
;

VariableInitializer:
	Expression
|	ArrayInitializer
;

MethodDeclaration:
	MethodHeader MethodBody
;

MethodHeader:
	Modifiers Type MethodDeclarator Throws
|	Modifiers Type MethodDeclarator
|	Type MethodDeclarator Throws
|	Type MethodDeclarator
|	Modifiers VOID MethodDeclarator Throws
|	Modifiers VOID MethodDeclarator
|	VOID MethodDeclarator Throws
|	VOID MethodDeclarator
;


MethodDeclarator:
	IDENTIFIER LPAREN FormalParameterList RPAREN
|	MethodDeclarator LSPAR RSPAR
|	IDENTIFIER LPAREN RPAREN
;

FormalParameterList:
	FormalParameter
|	FormalParameterList COMMA FormalParameter
;

FormalParameter:
	Type VariableDeclaratorId
;

Throws:
	THROWS ClassTypeList
;

ClassTypeList:
	ClassType
|	ClassTypeList COMMA ClassType
;

MethodBody:
	Block 
|	SEMICOLON
;


StaticInitializer:
	STATIC Block
;


ConstructorDeclaration:
	Modifiers ConstructorDeclarator Throws ConstructorBody
|	Modifiers ConstructorDeclarator ConstructorBody
|	ConstructorDeclarator Throws ConstructorBody
|	ConstructorDeclarator ConstructorBody	
;

ConstructorDeclarator:
	SimpleName LPAREN FormalParameterList RPAREN
|	SimpleName LPAREN RPAREN
;

ConstructorBody:
	LMPARA ExplicitConstructorInvocation BlockStatements RMPARA
|	LMPARA ExplicitConstructorInvocation RMPARA
|	LMPARA BlockStatements RMPARA
|	LMPARA RMPARA
;


ExplicitConstructorInvocation:
	THIS LPAREN ArgumentList RPAREN SEMICOLON
|	THIS LPAREN RPAREN SEMICOLON
|	SUPER LPAREN ArgumentList RPAREN SEMICOLON
|	SUPER LPAREN RPAREN SEMICOLON
;

InterfaceDeclaration:
	Modifiers INTERFACE IDENTIFIER ExtendsInterfaces InterfaceBody
|	Modifiers INTERFACE IDENTIFIER InterfaceBody
|	INTERFACE IDENTIFIER ExtendsInterfaces InterfaceBody
|	INTERFACE IDENTIFIER InterfaceBody
;

ExtendsInterfaces:
	EXTENDS InterfaceType
|	ExtendsInterfaces COMMA InterfaceType
;

InterfaceBody:
	LMPARA InterfaceMemberDeclarations RMPARA
|	LMPARA RMPARA
;

InterfaceMemberDeclarations:
	InterfaceMemberDeclaration
|	InterfaceMemberDeclarations InterfaceMemberDeclaration
;

InterfaceMemberDeclaration:
	ConstantDeclaration
|	AbstractMethodDeclaration
;

ConstantDeclaration:
	FieldDeclaration
;

AbstractMethodDeclaration:
	MethodHeader SEMICOLON
;


ArrayInitializer:
	LMPARA VariableInitializers COMMA RMPARA
|	LMPARA VariableInitializers RMPARA
|	LMPARA COMMA RMPARA
|	LMPARA RMPARA
;

VariableInitializers:
	VariableInitializer
|	VariableInitializers COMMA VariableInitializer
;


Block:
	LMPARA BlockStatements RMPARA
|	LMPARA RMPARA
;

BlockStatements:
	BlockStatement
|	BlockStatements BlockStatement
;

BlockStatement:
	LocalVariableDeclarationStatement
|	Statement
;

LocalVariableDeclarationStatement:
	LocalVariableDeclaration SEMICOLON
;

LocalVariableDeclaration:
	Type VariableDeclarators
;

Statement:
	StatementWithoutTrailingSubstatement
|	LabeledStatement
|	IfThenStatement
|	IfThenElseStatement
|	WhileStatement
|	ForStatement
;

StatementNoShortIf:
	StatementWithoutTrailingSubstatement
|	LabeledStatementNoShortIf
|	IfThenElseStatementNoShortIf
|	WhileStatementNoShortIf
|	ForStatementNoShortIf
;

StatementWithoutTrailingSubstatement:
	Block
|	EmptyStatement
|	ExpressionStatement
|	BreakStatement
|	ContinueStatement
|	ReturnStatement
|	SynchronizedStatement
|	ThrowStatement
|	TryStatement
;

EmptyStatement:
	SEMICOLON
;

LabeledStatement:
	IDENTIFIER COLON Statement
;

LabeledStatementNoShortIf:
	IDENTIFIER COLON StatementNoShortIf
;

ExpressionStatement:
	StatementExpression SEMICOLON
;

StatementExpression:
	Assignment
|	PreIncrementExpression
|	PreDecrementExpression
|	PostIncrementExpression
|	PostDecrementExpression
|	MethodInvocation
|	ClassInstanceCreationExpression
;

IfThenStatement:
	IF LPAREN Expression RPAREN Statement
;

IfThenElseStatement:
	IF LPAREN Expression RPAREN StatementNoShortIf ELSE Statement
;

IfThenElseStatementNoShortIf:
	IF LPAREN Expression RPAREN StatementNoShortIf ELSE StatementNoShortIf
;

WhileStatement:
	WHILE LPAREN Expression RPAREN Statement
;

WhileStatementNoShortIf:
	WHILE LPAREN Expression RPAREN StatementNoShortIf
;

ForStatement:
	FOR LPAREN ForInit SEMICOLON Expression SEMICOLON ForUpdate RPAREN Statement
|	FOR LPAREN ForInit SEMICOLON SEMICOLON ForUpdate RPAREN Statement
|	FOR LPAREN SEMICOLON Expression SEMICOLON ForUpdate RPAREN Statement
|	FOR LPAREN SEMICOLON SEMICOLON ForUpdate RPAREN Statement
|	FOR LPAREN ForInit SEMICOLON Expression SEMICOLON RPAREN Statement
|	FOR LPAREN ForInit SEMICOLON SEMICOLON RPAREN Statement
|	FOR LPAREN SEMICOLON Expression SEMICOLON RPAREN Statement
|	FOR LPAREN SEMICOLON SEMICOLON RPAREN Statement
;

ForStatementNoShortIf:
	FOR LPAREN ForInit SEMICOLON Expression SEMICOLON ForUpdate RPAREN StatementNoShortIf
|	FOR LPAREN ForInit SEMICOLON SEMICOLON ForUpdate RPAREN StatementNoShortIf
|	FOR LPAREN SEMICOLON Expression SEMICOLON ForUpdate RPAREN StatementNoShortIf
|	FOR LPAREN SEMICOLON SEMICOLON ForUpdate RPAREN StatementNoShortIf
|	FOR LPAREN ForInit SEMICOLON Expression SEMICOLON RPAREN StatementNoShortIf
|	FOR LPAREN ForInit SEMICOLON SEMICOLON RPAREN StatementNoShortIf
|	FOR LPAREN SEMICOLON Expression SEMICOLON RPAREN StatementNoShortIf
|	FOR LPAREN SEMICOLON SEMICOLON RPAREN StatementNoShortIf
;

ForInit:
	StatementExpressionList
|	LocalVariableDeclaration
;

ForUpdate:
	StatementExpressionList
;

StatementExpressionList:
	StatementExpression
|	StatementExpressionList COMMA StatementExpression
;

BreakStatement:
	BREAK IDENTIFIER SEMICOLON
|	BREAK SEMICOLON
;

ContinueStatement:
	CONTINUE IDENTIFIER SEMICOLON
|	CONTINUE SEMICOLON
;

ReturnStatement:
	RETURN Expression SEMICOLON
|	RETURN SEMICOLON
;

ThrowStatement:
	THROW Expression SEMICOLON
;

SynchronizedStatement:
	SYNCHRONIZED LPAREN Expression RPAREN Block
;

TryStatement:
	TRY Block Catches
|	TRY Block Catches Finally
|	TRY Block Finally
;


Catches:
	CatchClause
|	Catches CatchClause
;

CatchClause:
	CATCH LPAREN FormalParameter RPAREN Block
;

Finally:
	FINALLY Block
;

Primary:
	PrimaryNoNewArray
|	ArrayCreationExpression
;

PrimaryNoNewArray:
	LITERAL
|	THIS
|	LPAREN Expression RPAREN
|	ClassInstanceCreationExpression
|	FieldAccess
|	MethodInvocation
|	ArrayAccess
;

ClassInstanceCreationExpression:
	NEW ClassType LPAREN ArgumentList RPAREN
|	NEW ClassType LPAREN RPAREN
;

ArgumentList:
	Expression
|	ArgumentList COMMA Expression
;

ArrayCreationExpression:
	NEW PrimitiveType DimExprs Dims
|	NEW PrimitiveType DimExprs
|	NEW ClassOrInterfaceType DimExprs Dims
|	NEW ClassOrInterfaceType DimExprs
;

DimExprs:
	DimExpr
|	DimExprs DimExpr
;

DimExpr:
	LSPAR Expression RSPAR
;

Dims:
	LSPAR RSPAR
|	Dims LSPAR RSPAR
;

FieldAccess:
	Primary DOT IDENTIFIER
|	SUPER DOT IDENTIFIER
;

MethodInvocation:
	Name LPAREN ArgumentList RPAREN
|	Name LPAREN RPAREN
|	Primary DOT IDENTIFIER LPAREN ArgumentList RPAREN
|	Primary DOT IDENTIFIER LPAREN RPAREN
|	SUPER DOT IDENTIFIER LPAREN ArgumentList RPAREN
|	SUPER DOT IDENTIFIER LPAREN RPAREN
;


ArrayAccess:
	Name LSPAR Expression RSPAR
|	PrimaryNoNewArray LSPAR Expression RSPAR
;

PostfixExpression:
	Primary
|	Name
|	PostIncrementExpression
|	PostDecrementExpression
;

PostIncrementExpression:
	PostfixExpression PLUS_PLUS
;

PostDecrementExpression:
	PostfixExpression MINUS_MINUS
;

UnaryExpression:
	PreIncrementExpression
|	PreDecrementExpression
|	PLUS UnaryExpression
|	MINUS UnaryExpression
|	UnaryExpressionNotPlusMinus
;

PreIncrementExpression:
	PLUS_PLUS UnaryExpression
;

PreDecrementExpression:
	MINUS_MINUS UnaryExpression
;

UnaryExpressionNotPlusMinus:
	PostfixExpression
|	TILDE UnaryExpression
|	NOT UnaryExpression
|	CastExpression
;

CastExpression:
	LPAREN PrimitiveType Dims RPAREN UnaryExpression
|	LPAREN PrimitiveType RPAREN UnaryExpression
|	LPAREN Expression RPAREN UnaryExpressionNotPlusMinus
|	LPAREN Name Dims RPAREN UnaryExpressionNotPlusMinus
;

MultiplicativeExpression:
	UnaryExpression
|	MultiplicativeExpression TIMES UnaryExpression
|	MultiplicativeExpression DIVIDE UnaryExpression
|	MultiplicativeExpression MOD UnaryExpression
;

AdditiveExpression:
	MultiplicativeExpression
|	AdditiveExpression PLUS MultiplicativeExpression
|	AdditiveExpression MINUS MultiplicativeExpression
;

ShiftExpression:
	AdditiveExpression
|	ShiftExpression LEFT_SHIFT AdditiveExpression
|	ShiftExpression RIGHT_SHIFT AdditiveExpression
|	ShiftExpression UNSIGNED_RIGHT_SHIFT AdditiveExpression
;

RelationalExpression:
	ShiftExpression
|	RelationalExpression LT ShiftExpression
|	RelationalExpression GT ShiftExpression
|	RelationalExpression LE ShiftExpression
|	RelationalExpression GE ShiftExpression
|	RelationalExpression INSTANCEOF ReferenceType
;

EqualityExpression:
	RelationalExpression
|	EqualityExpression EQUALS_EQUALS RelationalExpression
|	EqualityExpression NOT_EQUALS RelationalExpression
;
AndExpression:
	EqualityExpression
|	AndExpression BITWISE_AND EqualityExpression
;

ExclusiveOrExpression:
	AndExpression
|	ExclusiveOrExpression XOR AndExpression
;

InclusiveOrExpression:
	ExclusiveOrExpression
|	InclusiveOrExpression BITWISE_OR ExclusiveOrExpression
;

ConditionalAndExpression:
	InclusiveOrExpression
|	ConditionalAndExpression AND InclusiveOrExpression
;

ConditionalOrExpression:
	ConditionalAndExpression
|	ConditionalOrExpression OR ConditionalAndExpression
;

ConditionalExpression:
	ConditionalOrExpression
|	ConditionalOrExpression QUESTION Expression COLON ConditionalExpression
;

AssignmentExpression:
	ConditionalExpression
|	Assignment
;

Assignment:
	LeftHandSide AssignmentOperator AssignmentExpression
;

LeftHandSide:
	Name
|	FieldAccess
|	ArrayAccess
;

AssignmentOperator: 
	EQUALS 
|	TIMES_EQUALS 
|	DIVIDE_EQUALS
|	MOD_EQUALS 
|	PLUS_EQUALS 
|	MINUS_EQUALS 
|	LEFT_SHIFT_EQUALS RIGHT_SHIFT_EQUALS UNSIGNED_RIGHT_SHIFT_EQUALS 
|	AND_EQUALS 
|	XOR_EQUALS 
|	OR_EQUALS
;

Expression:
	AssignmentExpression
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