%{
    /* Declaration */
    #include <bits/stdc++.h>
    #include "data.h"
	#include "symbol_table.cpp"
    using namespace std;
    int yylex();
    extern int yylineno;
	void searchAST(NODE *);
	void branchMethodSymtable(NODE* );
	void ParameterSymtable(NODE* );
	int vardim(NODE* );
	void fieldSymTable(NODE *);
	string typecast(string , string, string);
	string handle_function(NODE*);
	string get_type(NODE* );
	vector<int> makelist(int i);
	vector<int> merge(vector<int> p1,vector<int> p2);
	void backpatch(vector<int> p,int i);
	vector<vector<string>> instructions;
	void create_ins(int type,string i,string op,string arg1,string arg2); // type = 1=>normal 0=>abnormal

	int tempCount;
	string newTemp();
	int instCount;
	char * str_to_ch(string s);
	string get_invocation_name(NODE* );
	string handle_array_access(NODE*);
	string handle_arrayinit(NODE* );
	string handle_array_creation_Expression(NODE* );
	int lineno;
	void print_ste(ste* ,int);
	string cur_class;
    NODE *start_node;
	ste* start_ste = new ste;
	ste * current_ste = start_ste;

	void yerror(string s)
	{
		cout<<s<<" at line number "<<lineno<<endl;
		exit(1);
	}

    void yyerror(const char *s) {
        printf("Error: %s at line %d\n", s, yylineno);
        exit(1);
    }
	fstream fout;
	fstream code_out;
	extern FILE *yyin;

	unordered_map <string, stme*> tableMap;

	
	
	stack<ste*> branch;

	int forFlag = 0;
	unordered_map <string,stme*> classMap;	

	unordered_map <string, int> typeMap;

%}

%union {
    NODE *elem;
}

%token <elem>  BITWISE_AND BITWISE_OR COMMA FINALLY LPAREN RPAREN IDENTIFIER EQUALS DOT CLASS PUBLIC PRIVATE SEMICOLON COLON OR RETURN TRY SYNCHRONIZED THROW BREAK CONTINUE CATCH FINAL IF ELSE WHILE FOR LSPAR RSPAR TIMES_EQUALS DIVIDE_EQUALS MOD_EQUALS PLUS_EQUALS MINUS_EQUALS LEFT_SHIFT_EQUALS RIGHT_SHIFT_EQUALS UNSIGNED_RIGHT_SHIFT_EQUALS AND_EQUALS XOR_EQUALS OR_EQUALS QUESTION NOT_EQUALS LT GT LE GE INSTANCEOF AND XOR PLUS MINUS TIMES DIVIDE MOD PLUS_PLUS MINUS_MINUS TILDE THIS SUPER INT LONG SHORT BYTE CHAR IMPLEMENTS FLOAT DOUBLE BOOLEAN VOID NOT EXTENDS RMPARA LMPARA STATIC LEFT_SHIFT RIGHT_SHIFT UNSIGNED_RIGHT_SHIFT NULL_LITERAL CHAR_LITERAL STRING_LITERAL TEXTBLOCK_LITERAL FLOAT_LITERAL INTEGER_LITERAL BOOLEAN_LITERAL THROWS NEW IMPORT PACKAGE INTERFACE EQUALS_EQUALS 
%type <elem> Goal CompilationUnit Type PrimitiveType NumericType IntegralType FloatingPointType ReferenceType ClassOrInterfaceType ClassType InterfaceType ArrayType Name SimpleName QualifiedName ImportDeclarations TypeDeclarations PackageDeclaration ImportDeclaration TypeDeclaration Modifiers Modifier ClassDeclaration Super Interfaces ClassBody ClassBodyDeclarations ClassBodyDeclaration ClassMemberDeclaration FieldDeclaration VariableDeclarators VariableDeclarator VariableDeclaratorId VariableInitializer MethodDeclaration MethodHeader MethodDeclarator FormalParameterList Throws ClassTypeList MethodBody StaticInitializer ConstructorDeclaration ConstructorDeclarator ConstructorBody InterfaceDeclaration Expression ArrayInitializer FormalParameter Block SingleTypeImportDeclaration TypeImportOnDemandDeclaration AssignmentExpression ConditionalExpression Assignment ConditionalOrExpression LeftHandSide ConditionalAndExpression InclusiveOrExpression ExclusiveOrExpression AndExpression EqualityExpression RelationalExpression ShiftExpression AdditiveExpression MultiplicativeExpression UnaryExpression PreIncrementExpression PreDecrementExpression UnaryExpressionNotPlusMinus PostIncrementExpression PostDecrementExpression CastExpression Primary PrimaryNoNewArray ArrayCreationExpression ArrayAccess FieldAccess MethodInvocation ClassInstanceCreationExpression ArgumentList PostfixExpression InterfaceTypeList ExplicitConstructorInvocation InterfaceBody InterfaceMemberDeclarations InterfaceMemberDeclaration ConstantDeclaration AbstractMethodDeclaration ExtendsInterfaces AssignmentOperator Dims DimExprs DimExpr VariableInitializers BlockStatements BlockStatement LocalVariableDeclarationStatement Statement StatementNoShortIf StatementWithoutTrailingSubstatement IfThenStatement IfThenElseStatement IfThenElseStatementNoShortIf WhileStatement WhileStatementNoShortIf ForStatement ForStatementNoShortIf ForInit ForUpdate StatementExpression StatementExpressionList LocalVariableDeclaration EmptyStatement LabeledStatement ExpressionStatement BreakStatement ContinueStatement ReturnStatement ThrowStatement SynchronizedStatement TryStatement Catches CatchClause Finally LabeledStatementNoShortIf Else

%%
// Grammer
// Start
Goal:
	CompilationUnit	{ $$ = create_node ( 2 ,"Goal", $1); start_node=$$; } 
;

Type:
	PrimitiveType	{ $$ = $1; }
|	ReferenceType	{ $$ = $1; }
;

Else:
	ELSE 	{
				$$ = $1;
				create_ins(0,"goto","","","");
				$$->ins = instCount;
				$$->nextlist = makelist($$->ins);
			}
;

PrimitiveType:
	NumericType	{ $$ = $1; }
|	BOOLEAN	{ $$ = $1; }
;

NumericType:
	IntegralType	{ $$ = $1; }
|	FloatingPointType	{ $$ = $1; }
;

IntegralType:
	BYTE 	{ $$ = $1; }
|	SHORT 	{ $$ = $1; }
|	INT 	{ $$ = $1; }
|	LONG 	{ $$ = $1; }
|	CHAR	{ $$ = $1; }
;

FloatingPointType:
	FLOAT 	{ $$ = $1; }
|	DOUBLE	{ $$ = $1; }
;

ReferenceType:
	ClassOrInterfaceType	{ $$ = $1; }
|	ArrayType	{ $$ = $1; }
;

ClassOrInterfaceType:
	Name	{ $$ = $1; }
;

ClassType:
	ClassOrInterfaceType	{ $$ = $1; }
;

InterfaceType:
	ClassOrInterfaceType	{ $$ = $1; }
;

ArrayType:
	PrimitiveType LSPAR RSPAR 	{
									$$ = create_node ( 4 ,"Array_Type", $1, $2, $3);
									$$->addr = $1->addr;
								}
|	Name LSPAR RSPAR	{
							$$ = create_node ( 4 ,"Array_Type", $1, $2, $3);
							$$->addr = $1->addr;
						}
|	ArrayType LSPAR RSPAR	{
								$$ = create_node ( 4 ,"Array_Type", $1, $2, $3);
								$$->addr = $1->addr;
							}
;


Name:
	SimpleName	{ $$ = $1; }
|	QualifiedName	{ $$ = $1; }
;

SimpleName:
	IDENTIFIER	{ $$ = $1; $$->addr = $$->val; }
;

QualifiedName:
	Name DOT IDENTIFIER	{
							$$ = create_node ( 4 ,"Qualified_Name", $1, $2, $3);
							$$->addr = str_to_ch(string($1->addr)+string($3->addr));
						} 
;

CompilationUnit:
	PackageDeclaration ImportDeclarations TypeDeclarations	{ $$ = create_node ( 4 ,"Compilation_Unit", $1, $2, $3); }
|	ImportDeclarations TypeDeclarations	{ $$ = create_node ( 3 ,"Compilation_Unit", $1, $2); } 
|	PackageDeclaration TypeDeclarations	{ $$ = create_node ( 3 ,"Compilation_Unit", $1, $2); } 
|	TypeDeclarations	{ $$ = $1; }
|	PackageDeclaration ImportDeclarations 	{ $$ = create_node ( 3 ,"Compilation_Unit", $1, $2); } 
|	ImportDeclarations 	{ $$ = $1; }
|	PackageDeclaration 	{ $$ = $1; }
|	{$$ = create_node(1,"EMPTY");}
;


ImportDeclarations:
	ImportDeclaration	{ $$ = create_node(2,"Import_Declarations",$1) ; }
|	ImportDeclarations ImportDeclaration	{ $1->children.push_back($2); $$ =$1 ;} 
;

TypeDeclarations:
	TypeDeclaration	{ $$ = create_node(2,"Type_Declarations",$1) ; }
|	TypeDeclarations TypeDeclaration	{ $1->children.push_back($2); $$ =$1 ; } 
;

PackageDeclaration:
	PACKAGE Name SEMICOLON	{ $$ = create_node ( 4 ,"Package_Declaration", $1, $2, $3); } 
;

ImportDeclaration:
	SingleTypeImportDeclaration	{ $$ = $1; }
|	TypeImportOnDemandDeclaration	{ $$ = $1; }
;

SingleTypeImportDeclaration:
	IMPORT Name SEMICOLON	{ $$ = create_node ( 4 ,"Single_Type_Import_Declaration", $1, $2, $3); } 
;

TypeImportOnDemandDeclaration:
	IMPORT Name DOT TIMES SEMICOLON	{ $$ = create_node ( 6 ,"Type_Import_On_Demand_Declaration", $1, $2, $3, $4, $5); } 
;


TypeDeclaration:
	ClassDeclaration	{ $$ = $1; }
|	InterfaceDeclaration	{ $$ = $1; }
|	SEMICOLON	{ $$ = $1; }
;

Modifiers:
	Modifier	{ $$ = create_node(2,"Modifiers",$1) ; }
|	Modifiers Modifier	{ $1->children.push_back($2); $$ =$1 ; } 
;

Modifier:
	PUBLIC	{ $$ = $1; }
|	PRIVATE	{ $$ = $1; }
|	STATIC	{ $$ = $1; }
|	FINAL	{ $$ = $1; }
;

ClassDeclaration:
	Modifiers CLASS IDENTIFIER Super Interfaces ClassBody	{
																$$ = create_node ( 7 ,"Class_Declaration", $1, $2, $3, $4, $5, $6);
															} 
|	CLASS IDENTIFIER Interfaces ClassBody	{
												$$ = create_node ( 5 ,"Class_Declaration", $1, $2, $3, $4);
											}
|	Modifiers CLASS IDENTIFIER Super ClassBody	{
													$$ = create_node ( 6 ,"Class_Declaration", $1, $2, $3, $4, $5);
												} 
|	Modifiers CLASS IDENTIFIER Interfaces ClassBody	{
														$$ = create_node ( 6 ,"Class_Declaration", $1, $2, $3, $4, $5);
													} 
|	CLASS IDENTIFIER ClassBody	{	
									$$ = create_node ( 4 ,"Class_Declaration", $1, $2, $3);
								}
|	Modifiers CLASS IDENTIFIER ClassBody	{
												$$ = create_node ( 5 ,"Class_Declaration", $1, $2, $3, $4);
											}
;

Super:
	EXTENDS ClassType	{ $$ = create_node ( 3 ,"Super", $1, $2); } 
;

Interfaces:
	IMPLEMENTS InterfaceTypeList	{ $$ = create_node ( 3 ,"Interfaces", $1, $2); } 
;

InterfaceTypeList:
	InterfaceType	{ $$ = create_node(2,"Interface_Type_List",$1) ; }
|	InterfaceTypeList COMMA InterfaceType	{ $1->children.push_back($2);$1->children.push_back($3); $$ =$1 ;} 
;

ClassBody:
	LMPARA ClassBodyDeclarations RMPARA	{ $$ = create_node ( 4 ,"ClassBody", $1, $2, $3); } 
|	LMPARA RMPARA	{ $$ = create_node ( 3 ,"ClassBody", $1, $2); } 
;

ClassBodyDeclarations:
	ClassBodyDeclaration	{$$ = create_node(2,"Class_Body_Declarations",$1) ; }
|	ClassBodyDeclarations ClassBodyDeclaration	{ $1->children.push_back($2); $$ =$1 ; } 
;

ClassBodyDeclaration:
	ClassMemberDeclaration	{ $$ = $1; }
|	StaticInitializer	{ $$ = $1; }
|	ConstructorDeclaration	{ $$ = $1; }
;

ClassMemberDeclaration:
	FieldDeclaration	{ $$ = $1; }
|	MethodDeclaration	{ $$ = $1; }
;

FieldDeclaration:
	Modifiers Type VariableDeclarators SEMICOLON	{ $$ = create_node ( 5 ,"FieldDeclaration", $1, $2, $3, $4); } 
|	Type VariableDeclarator SEMICOLON	{ $$ = create_node ( 4 ,"FieldDeclaration", $1, $2, $3); } 
;

VariableDeclarators:
	VariableDeclarator	{ $$ = create_node(2,"Variable_declarators",$1) ; }
|	VariableDeclarators COMMA VariableDeclarator	{ $1->children.push_back($2);$1->children.push_back($3); $$ =$1 ;} 
;

VariableDeclarator:
	VariableDeclaratorId	{ $$ = $1; }
|	VariableDeclaratorId EQUALS VariableInitializer	{
														$$ = create_node ( 3 ,$2->val, $1, $3);
														$$->ins = instCount+1;
														create_ins(0,$1->addr,$2->val,$3->addr,"");
													}
;

VariableDeclaratorId:
	IDENTIFIER	{ $$ = create_node(2,"Variable_Declarator_Id",$1) ;  $1->isvar=1; $$->addr = $1->addr; }
|	VariableDeclaratorId LSPAR RSPAR	{ $1->children.push_back($2);$1->children.push_back($3); $$ =$1 ;} 
;

VariableInitializer:
	Expression	{ $$ = $1; }
|	ArrayInitializer	{ $$ = $1; }
;

MethodDeclaration:
	MethodHeader MethodBody	{ $$ = create_node ( 3 ,"MethodDeclaration", $1, $2); } 
;

MethodHeader:
	Modifiers Type MethodDeclarator Throws	{
												$$ = create_node ( 5 ,"MethodHeader", $1, $2, $3, $4);
											}
|	Modifiers Type MethodDeclarator	{
										$$ = create_node ( 4 ,"MethodHeader", $1, $2, $3);
									}
|	Type MethodDeclarator Throws	{
										$$ = create_node ( 4 ,"MethodHeader", $1, $2, $3);
									}
|	Type MethodDeclarator	{
								$$ = create_node ( 3 ,"MethodHeader", $1, $2);
							}
|	Modifiers VOID MethodDeclarator Throws	{
												$$ = create_node ( 5 ,"MethodHeader", $1, $2, $3, $4);
											}
|	Modifiers VOID MethodDeclarator	{
										$$ = create_node ( 4 ,"MethodHeader", $1, $2, $3);

									}
|	VOID MethodDeclarator Throws	{
										$$ = create_node ( 4 ,"MethodHeader", $1, $2, $3);
									}
|	VOID MethodDeclarator	{
								$$ = create_node ( 3 ,"MethodHeader", $1, $2);
							}
;


MethodDeclarator:
	IDENTIFIER LPAREN FormalParameterList RPAREN	{
														$$ = create_node ( 5 ,"MethodDeclarator", $1, $2, $3, $4);
														$$->ins = instCount+1;
														bool flag=false;
														string funcName=string($1->addr);
														for(auto class_ptr:classMap)
														{
															stme* temp=class_ptr.second;
															while(temp!=NULL)
															{
																if($1->val==temp->id)
																{
																	flag=true;
																	funcName+=class_ptr.first;
																	break;
																}
																temp=temp->next;
															}
															if(flag) break;
														}
														// funcName+=string($3->addr);
														create_ins(0,funcName,":","","");
														create_ins(0,"BeginFunc","","","");
													} 
|	MethodDeclarator LSPAR RSPAR	{
										$$ = create_node ( 4 ,"MethodDeclarator", $1, $2, $3);
										// add "v" to funcName
									} 
|	IDENTIFIER LPAREN RPAREN	{
									$$ = create_node ( 4 ,"MethodDeclarator", $1, $2, $3);
									$$->ins = instCount+1;
									bool flag=false;
									string funcName=string($1->addr);
									for(auto class_ptr:classMap)
									{
										stme* temp=class_ptr.second;
										while(temp!=NULL)
										{
											if($1->val==temp->id)
											{
												flag=true;
												funcName+=class_ptr.first;
												break;
											}
											temp=temp->next;
										}
										if(flag) break;
									}
									create_ins(0,funcName,":","","");
									create_ins(0,"BeginFunc","","","");
								} 
;

FormalParameterList:
	FormalParameter	{
						$$ = create_node(2,"Formal_Parameter_List",$1) ;
						// $$->addr = str_to_ch(string(""+*string($1->addr).begin()));
						// string str="";
						// str.push_back(*string($1->addr).begin());
						// $$->addr = str_to_ch(str);
					}
|	FormalParameterList COMMA FormalParameter	{
													$1->children.push_back($2);$1->children.push_back($3); $$ =$1 ;
													// $$->addr=str_to_ch(string($1->addr)+string($3->addr));
												} 
;

FormalParameter:
	Type VariableDeclaratorId	{
									$$ = create_node ( 3 ,"FormalParameter", $1, $2);
									$$->addr = $1->addr;
								}
|	FINAL Type VariableDeclaratorId	{
										$$ = create_node ( 4 ,"FormalParameter", $1, $2, $3);
										$$->addr = $1->addr;
									}
;

Throws:
	THROWS ClassTypeList	{ $$ = create_node ( 3 ,"Throws", $1, $2); } 
;

ClassTypeList:
	ClassType	{ $$ = create_node(2,"Class_Type_List",$1) ; }
|	ClassTypeList COMMA ClassType	{ $1->children.push_back($2);$1->children.push_back($3); $$ =$1 ;} 
;

MethodBody:
	Block 	{
				$$ = $1;
				$$->ins = instCount+1;
				create_ins(0,"EndFunc","","","");
				backpatch($1->nextlist,$$->ins);
			}
|	SEMICOLON	{ $$ = $1; }
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
	EXTENDS InterfaceType	{ $$ = create_node(3,"Extends_Interfaces",$1,$2) ; } 
|	ExtendsInterfaces COMMA InterfaceType	{ $1->children.push_back($2);$1->children.push_back($3); $$ =$1 ; } 
;

InterfaceBody:
	LMPARA InterfaceMemberDeclarations RMPARA	{ $$ = create_node ( 4 ,"InterfaceBody", $1, $2, $3); } 
|	LMPARA RMPARA	{ $$ = create_node ( 3 ,"InterfaceBody", $1, $2); } 
;

InterfaceMemberDeclarations:
	InterfaceMemberDeclaration	{$$ = create_node(2,"Interface_Member_Declarations",$1) ; }
|	InterfaceMemberDeclarations InterfaceMemberDeclaration	{ $1->children.push_back($2); $$ =$1 ; } 
;

InterfaceMemberDeclaration:
	ConstantDeclaration	{ $$ = $1; }
|	AbstractMethodDeclaration	{ $$ = $1; }
;

ConstantDeclaration:
	FieldDeclaration	{ $$ = $1; }
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
	VariableInitializer	{ $$ = create_node(2,"Variable_Initializers",$1) ; }
|	VariableInitializers COMMA VariableInitializer	{$1->children.push_back($2);$1->children.push_back($3); $$ =$1 ; } 
;


Block:
	LMPARA BlockStatements RMPARA	{
										$$ = create_node ( 4 ,"Block", $1, $2, $3);
										$$->ins = $2->ins;
										$$->nextlist = $2->nextlist;
										$$->falselist = $2->falselist;
									} 
|	LMPARA RMPARA	{ $$ = create_node ( 3 ,"Block", $1, $2); } 
;

BlockStatements:
	BlockStatement	{
						$$ = create_node(2,"Block_Statements",$1) ;
						$$->ins = $1->ins;
						$$->nextlist = $1->nextlist;
					}
|	BlockStatements BlockStatement	{
										$1->children.push_back($2);
										$$ = $1;
										backpatch($1->nextlist,$2->ins);
										// This is a temporary solution to assist break statements
										vector<int> next;
										for(auto ins:$1->nextlist){
											if(ins<0){
												next.push_back(ins);
											}
										}
										$$->nextlist = merge(next,$2->nextlist);
									} 
;

BlockStatement:
	LocalVariableDeclarationStatement	{ $$ = $1; }
|	Statement	{ $$ = $1;}
;

LocalVariableDeclarationStatement:
	LocalVariableDeclaration SEMICOLON	{ $$ = create_node ( 3 ,"LocalVariableDeclarationStatement", $1, $2); $$->ins = $1->ins; } 
;

LocalVariableDeclaration:
	Type VariableDeclarators	{ $$ = create_node ( 3 ,"LocalVariableDeclaration", $1, $2); } 
|	FINAL Type VariableDeclarators	{ $$ = create_node ( 4 ,"LocalVariableDeclaration", $1, $2, $3); }
;

Statement:
	StatementWithoutTrailingSubstatement	{ $$ = $1; }
|	LabeledStatement	{ $$ = $1; }
|	IfThenStatement	{ $$ = $1; }
|	IfThenElseStatement	{ $$ = $1; }
|	WhileStatement	{ $$ = $1; }
|	ForStatement	{ $$ = $1; }
;

StatementNoShortIf:
	StatementWithoutTrailingSubstatement	{ $$ = $1; }
|	LabeledStatementNoShortIf	{ $$ = $1; }
|	IfThenElseStatementNoShortIf	{ $$ = $1; }
|	WhileStatementNoShortIf	{ $$ = $1; }
|	ForStatementNoShortIf	{ $$ = $1; }
;

StatementWithoutTrailingSubstatement:
	Block	{ $$ = $1; }
|	EmptyStatement	{ $$ = $1; }
|	ExpressionStatement	{ $$ = $1; }
|	BreakStatement	{ $$ = $1; }
|	ContinueStatement	{ $$ = $1; }
|	ReturnStatement	{ $$ = $1; }
|	SynchronizedStatement	{ $$ = $1; }
|	ThrowStatement	{ $$ = $1; }
|	TryStatement	{ $$ = $1; }
;

EmptyStatement:
	SEMICOLON	{ $$ = $1; }
;

LabeledStatement:
	IDENTIFIER COLON Statement	{ $$ = create_node ( 4 ,"LabeledStatement", $1, $2, $3); } 
;

LabeledStatementNoShortIf:
	IDENTIFIER COLON StatementNoShortIf	{ $$ = create_node ( 4 ,"LabeledStatementNoShortIf", $1, $2, $3); } 
;

ExpressionStatement:
	StatementExpression SEMICOLON	{ $$ = create_node ( 3 ,"ExpressionStatement", $1, $2); $$->ins = $1->ins; } 
;

StatementExpression:
	Assignment	{ $$ = $1; }
|	PreIncrementExpression	{ $$ = $1; }
|	PreDecrementExpression	{ $$ = $1; }
|	PostIncrementExpression	{ $$ = $1; }
|	PostDecrementExpression	{ $$ = $1; }
|	MethodInvocation	{ $$ = $1; }
|	ClassInstanceCreationExpression	{ $$ = $1; }
;

IfThenStatement:
	IF LPAREN Expression RPAREN Statement	{
												$$ = create_node ( 6 ,"IfThenStatement", $1, $2, $3, $4, $5);
												$$->ins = instCount+1;
												backpatch($3->truelist,$5->ins);
												$$->nextlist = merge($3->falselist,$5->nextlist);
											} 
;

IfThenElseStatement:
	IF LPAREN Expression RPAREN StatementNoShortIf Else Statement	{
																		$$ = create_node ( 8 ,"IfThenElseStatement", $1, $2, $3, $4, $5, $6, $7);
																		$$->ins = $3->ins;
																		backpatch($3->truelist,$5->ins);
																		backpatch($3->falselist,$7->ins);
																		$$->nextlist = merge(merge($5->nextlist,makelist($6->ins)),$7->nextlist);
																	} 
;

IfThenElseStatementNoShortIf:
	IF LPAREN Expression RPAREN StatementNoShortIf Else StatementNoShortIf	{
																				$$ = create_node ( 8 ,"IfThenElseStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7);
																				$$->ins = $3->ins;
																				backpatch($3->truelist,$5->ins);
																				backpatch($3->falselist,$7->ins);
																				$$->nextlist = merge(merge($5->nextlist,makelist($6->ins)),$7->nextlist);
																			}
;

WhileStatement:
	WHILE LPAREN Expression RPAREN Statement	{
													$$ = create_node ( 6 ,"WhileStatement", $1, $2, $3, $4, $5);
													backpatch($5->nextlist,$3->ins);
													backpatch($3->truelist,$5->ins);
													$5->nextlist = $3->falselist;
													create_ins(0,"goto",to_string($3->ins),"","");
												} 
;

WhileStatementNoShortIf:
	WHILE LPAREN Expression RPAREN StatementNoShortIf	{
															$$ = create_node ( 6 ,"WhileStatementNoShortIf", $1, $2, $3, $4, $5);
															backpatch($5->nextlist,$3->ins);
															backpatch($3->truelist,$5->ins);
															$5->nextlist = $3->falselist;
															create_ins(0,"goto",to_string($3->ins),"","");
														} 
;

ForStatement:
	FOR LPAREN ForInit SEMICOLON Expression SEMICOLON ForUpdate RPAREN Statement	{
																						$$ = create_node ( 10 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7, $8, $9);
																						$$->ins = instCount+1;
																						backpatch($9->nextlist,$7->ins); // statement,forupdate
																						backpatch($5->truelist,$9->ins); // expression,statement
																						backpatch($7->truelist,$5->ins); // forupdate,expression
																						$$->nextlist = $5->falselist;    // lhs,expression
																						for(auto ins:$9->nextlist){
																							if(ins<0){
																									$$->nextlist.push_back(-ins);
																								}
																						}
																						create_ins(0,"goto",to_string($7->ins),"",""); // forupdate
																					} 
|	FOR LPAREN ForInit SEMICOLON SEMICOLON ForUpdate RPAREN Statement	{
																			$$ = create_node ( 9 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7, $8);
																			$$->ins = instCount+1;																																								$$->ins = instCount+1;
																			backpatch($8->nextlist,$6->ins);
																			backpatch($6->truelist,$8->ins);
																			$$->nextlist = $8->nextlist;
																			create_ins(0,"goto",to_string($6->ins),"","");
																		} 
|	FOR LPAREN SEMICOLON Expression SEMICOLON ForUpdate RPAREN Statement	{
																				$$ = create_node ( 9 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7, $8);
																				$$->ins = instCount+1;
																				backpatch($8->nextlist,$6->ins);
																				backpatch($4->truelist,$8->ins);
																				backpatch($6->truelist,$4->ins);
																				$$->nextlist = $4->falselist;
																				create_ins(0,"goto",to_string($6->ins),"","");
																			} 
|	FOR LPAREN SEMICOLON SEMICOLON ForUpdate RPAREN Statement	{
																	$$ = create_node ( 8 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7);
																	$$->ins = instCount+1;																																						$$->ins = instCount+1;
																	backpatch($7->nextlist,$5->ins);
																	backpatch($5->truelist,$7->ins);
																	$$->nextlist = $7->nextlist;
																	create_ins(0,"goto",to_string($5->ins),"","");
																} 
|	FOR LPAREN ForInit SEMICOLON Expression SEMICOLON RPAREN Statement	{
																			$$ = create_node ( 9 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7, $8);
																			$$->ins = instCount+1;
																			backpatch($8->nextlist,$5->ins);
																			backpatch($5->truelist,$8->ins);
																			$$->nextlist = merge($5->falselist,$8->nextlist);
																			create_ins(0,"goto",to_string($5->ins),"","");
																		} 
|	FOR LPAREN ForInit SEMICOLON SEMICOLON RPAREN Statement	{
																$$ = create_node ( 8 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7);
																$$->ins = instCount+1;
																backpatch($7->nextlist,$7->ins);
																$$->nextlist = $7->nextlist;
																create_ins(0,"goto",to_string($7->ins),"","");
															} 
|	FOR LPAREN SEMICOLON Expression SEMICOLON RPAREN Statement	{
																	$$ = create_node ( 8 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7);
																	$$->ins = instCount+1;
																	backpatch($7->nextlist,$7->ins);
																	backpatch($4->truelist,$7->ins);
																	$$->nextlist = merge($4->falselist,$7->nextlist);
																	create_ins(0,"goto",to_string($4->ins),"","");
																} 
|	FOR LPAREN SEMICOLON SEMICOLON RPAREN Statement	{
														$$ = create_node ( 7 ,"ForStatement", $1, $2, $3, $4, $5, $6);
														$$->ins = instCount+1;
														backpatch($6->nextlist,$6->ins);
														$$->nextlist = $6->nextlist;
														create_ins(0,"goto",to_string($6->ins),"","");
													} 
;

ForStatementNoShortIf:
	FOR LPAREN ForInit SEMICOLON Expression SEMICOLON ForUpdate RPAREN StatementNoShortIf	{
																								$$ = create_node ( 10 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7, $8, $9);
																								$$->ins = instCount+1;
																								backpatch($9->nextlist,$7->ins); // statement,forupdate
																								backpatch($5->truelist,$9->ins); // expression,statement
																								backpatch($7->truelist,$5->ins); // forupdate,expression
																								$$->nextlist = $5->falselist;    // lhs,expression
																								create_ins(0,"goto",to_string($7->ins),"",""); // forupdate
																							} 
|	FOR LPAREN ForInit SEMICOLON SEMICOLON ForUpdate RPAREN StatementNoShortIf	{
																					$$ = create_node ( 9 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7, $8);
																					$$->ins = instCount+1;																																								$$->ins = instCount+1;
																					backpatch($8->nextlist,$6->ins);
																					backpatch($6->truelist,$8->ins);
																					$$->nextlist = $8->nextlist;
																					create_ins(0,"goto",to_string($6->ins),"","");
																				} 
|	FOR LPAREN SEMICOLON Expression SEMICOLON ForUpdate RPAREN StatementNoShortIf	{
																						$$ = create_node ( 9 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7, $8);
																						$$->ins = instCount+1;
																						backpatch($8->nextlist,$6->ins);
																						backpatch($4->truelist,$8->ins);
																						backpatch($6->truelist,$4->ins);
																						$$->nextlist = $4->falselist;
																						create_ins(0,"goto",to_string($6->ins),"","");
																					} 
|	FOR LPAREN SEMICOLON SEMICOLON ForUpdate RPAREN StatementNoShortIf	{
																			$$ = create_node ( 8 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7);
																			$$->ins = instCount+1;																																						$$->ins = instCount+1;
																			backpatch($7->nextlist,$5->ins);
																			backpatch($5->truelist,$7->ins);
																			$$->nextlist = $7->nextlist;
																			create_ins(0,"goto",to_string($5->ins),"","");
																		} 
|	FOR LPAREN ForInit SEMICOLON Expression SEMICOLON RPAREN StatementNoShortIf	{
																					$$ = create_node ( 9 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7, $8);
																					$$->ins = instCount+1;
																					backpatch($8->nextlist,$5->ins);
																					backpatch($5->truelist,$8->ins);
																					$$->nextlist = merge($5->falselist,$8->nextlist);
																					create_ins(0,"goto",to_string($5->ins),"","");
																				} 
|	FOR LPAREN ForInit SEMICOLON SEMICOLON RPAREN StatementNoShortIf	{
																			$$ = create_node ( 8 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7);
																			$$->ins = instCount+1;
																			backpatch($7->nextlist,$7->ins);
																			$$->nextlist = $7->nextlist;
																			create_ins(0,"goto",to_string($7->ins),"","");
																		} 
|	FOR LPAREN SEMICOLON Expression SEMICOLON RPAREN StatementNoShortIf	{
																			$$ = create_node ( 8 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7);
																			$$->ins = instCount+1;
																			backpatch($7->nextlist,$7->ins);
																			backpatch($4->truelist,$7->ins);
																			$$->nextlist = merge($4->falselist,$7->nextlist);
																			create_ins(0,"goto",to_string($4->ins),"","");
																		} 
|	FOR LPAREN SEMICOLON SEMICOLON RPAREN StatementNoShortIf	{
																	$$ = create_node ( 7 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6);
																	$$->ins = instCount+1;
																	backpatch($6->nextlist,$6->ins);
																	$$->nextlist = $6->nextlist;
																	create_ins(0,"goto",to_string($6->ins),"","");
																} 
;

ForInit:
	StatementExpressionList	{ $$ = $1; }
|	LocalVariableDeclaration	{ $$ = $1; }
;

ForUpdate:
	StatementExpressionList	{
								$$ = $1;
								$$->ins = $1->ins;
								create_ins(0,"goto","","","");
								$$->truelist = makelist(instCount);
							}
;

StatementExpressionList:
	StatementExpression	{
							$$ = create_node(2,"Statement_Expression_List",$1) ;
							$$->ins = $1->ins;
						}
|	StatementExpressionList COMMA StatementExpression	{ $1->children.push_back($2);$1->children.push_back($3); $$ =$1 ; } 
;

BreakStatement:
	BREAK IDENTIFIER SEMICOLON	{ $$ = create_node ( 4 ,"BreakStatement", $1, $2, $3); } 
|	BREAK SEMICOLON	{
						$$ = create_node ( 3 ,"BreakStatement", $1, $2);
						$$->ins = instCount+1;
						create_ins(0,"goto","","","");
						$$->nextlist = makelist(-$$->ins);
					} 
;

ContinueStatement:
	CONTINUE IDENTIFIER SEMICOLON	{ $$ = create_node ( 4 ,"ContinueStatement", $1, $2, $3); } 
|	CONTINUE SEMICOLON	{
							$$ = create_node ( 3 ,"ContinueStatement", $1, $2);
							$$->ins = instCount+1;
							create_ins(0,"goto","","","");
							$$->nextlist = makelist(-$$->ins);
						} 
;

ReturnStatement:
	RETURN Expression SEMICOLON	{
									$$ = create_node ( 4 ,"ReturnStatement", $1, $2, $3);
									$$->ins = instCount+1;
									create_ins(0,"Return",$2->addr,"","");
								}
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
	CatchClause{$$ = create_node(2,"Catches",$1) ; }
|	Catches CatchClause	{ $1->children.push_back($2); $$ =$1 ;} 
;

CatchClause:
	CATCH LPAREN FormalParameter RPAREN Block	{ $$ = create_node ( 6 ,"CatchClause", $1, $2, $3, $4, $5); } 
;

Finally:
	FINALLY Block	{ $$ = create_node ( 3 ,"Finally", $1, $2); } 
;

Primary:
	PrimaryNoNewArray	{ $$ = $1; }
|	ArrayCreationExpression	{ $$ = $1; }
;

PrimaryNoNewArray:
	NULL_LITERAL	{ $$ = $1; $$->addr = $$->val; $1->type=str_to_ch("null");}
|	CHAR_LITERAL	{ $$ = $1; $$->addr = $$->val; $1->type=str_to_ch("char");}
|	FLOAT_LITERAL	{ $$ = $1; $$->addr = $$->val; $1->type=str_to_ch("float");}
|	INTEGER_LITERAL	{ $$ = $1; $$->addr = $$->val; $$->type=str_to_ch("int");}
|	BOOLEAN_LITERAL	{ $$ = $1; $$->addr = $$->val; $1->type=str_to_ch("boolean");}
|	STRING_LITERAL	{ $$ = $1; $$->addr = $$->val; $1->type=str_to_ch("String");}
|	TEXTBLOCK_LITERAL	{ $$ = $1; $$->addr = $$->val; $1->type=str_to_ch("text_block");}
|	THIS	{ $$ = $1; }
|	LPAREN Expression RPAREN	{ $$ = create_node ( 4 ,"PrimaryNoNewArray", $1, $2, $3); } 
|	ClassInstanceCreationExpression	{ $$ = $1; }
|	FieldAccess	{ $$ = $1; }
|	MethodInvocation	{ $$ = $1; }
|	ArrayAccess	{ $$ = $1; }
;

ClassInstanceCreationExpression:
	NEW ClassType LPAREN ArgumentList RPAREN	{
													$$ = create_node ( 6 ,"ClassInstanceCreationExpression", $1, $2, $3, $4, $5);
												} 
|	NEW ClassType LPAREN RPAREN	{
									$$ = create_node ( 5 ,"ClassInstanceCreationExpression", $1, $2, $3, $4);
									$$->ins = instCount+1;

								} 
;

ArgumentList:
	Expression	{
					$$ = create_node(2,"Argument_List",$1) ;
					$$->ins = instCount+1;
					create_ins(0,"PushParam",$1->addr,"","");
					$$->addr = str_to_ch(to_string(4));
				}
|	ArgumentList COMMA Expression	{
										$1->children.push_back($2);
										$1->children.push_back($3);
										$$ =$1;
										$$->addr = str_to_ch(string(to_string(stoi(string($1->addr))+1)));
									}
;

ArrayCreationExpression:
	NEW PrimitiveType DimExprs Dims	{ $$ = create_node ( 5 ,"ArrayCreationExpression", $1, $2, $3, $4); } 
|	NEW PrimitiveType DimExprs	{ $$ = create_node ( 4 ,"ArrayCreationExpression", $1, $2, $3); } 
|	NEW ClassOrInterfaceType DimExprs Dims	{ $$ = create_node ( 5 ,"ArrayCreationExpression", $1, $2, $3, $4); } 
|	NEW ClassOrInterfaceType DimExprs	{ $$ = create_node ( 4 ,"ArrayCreationExpression", $1, $2, $3); } 
;

DimExprs:
	DimExpr	{
				$$ = create_node(2,"Dim_Expers",$1) ;
				$$->addr = $1->addr;
			}
|	DimExprs DimExpr	{
							$1->children.push_back($2); $$ =$1 ;
							$$->ins = instCount+1;
							$$->addr = str_to_ch(newTemp());
							create_ins(1,$$->addr,"*",$2->addr,"4");
						}
;

DimExpr:
	LSPAR Expression RSPAR	{ $$ = create_node ( 4 ,"Dim_Expr", $1, $2, $3); } 
;

Dims:
	LSPAR RSPAR	{ $$ = create_node(3,"Dims",$1,$2) ; } 
|	Dims LSPAR RSPAR	{ $1->children.push_back($2);$1->children.push_back($3); $$ =$1 ; } 
;

FieldAccess:
	Primary DOT IDENTIFIER	{ $$ = create_node ( 4 ,"FieldAccess", $1, $2, $3); } 
|	SUPER DOT IDENTIFIER	{ $$ = create_node ( 4 ,"FieldAccess", $1, $2, $3); } 
;

MethodInvocation:
	Name LPAREN ArgumentList RPAREN	{
										$$ = create_node ( 5 ,"MethodInvocation", $1, $2, $3, $4);
										$$->ins = instCount+1;
										$$->addr = str_to_ch(newTemp());
										create_ins(0,$$->addr,"=","call",$1->addr);
										create_ins(0,"PopParam",$3->addr,"","");
									} 
|	Name LPAREN RPAREN	{
							$$ = create_node ( 4 ,"MethodInvocation", $1, $2, $3);
							$$->ins = instCount+1;
							$$->addr = str_to_ch(newTemp());
							create_ins(0,$$->addr,"=","call",$1->addr);
							create_ins(0,"PopParam",$3->addr,"","");
						} 
|	Primary DOT IDENTIFIER LPAREN ArgumentList RPAREN	{
															$$ = create_node ( 7 ,"MethodInvocation", $1, $2, $3, $4, $5, $6);
															$$->ins = instCount+1;
															$$->addr = str_to_ch(newTemp());
															create_ins(0,$$->addr,"=","call",$3->addr);
															create_ins(0,"PopParam",$3->addr,"","");
														} 
|	Primary DOT IDENTIFIER LPAREN RPAREN	{
												$$ = create_node ( 6 ,"MethodInvocation", $1, $2, $3, $4, $5);
												$$->ins = instCount+1;
												$$->addr = str_to_ch(newTemp());
												create_ins(0,$$->addr,"=","call",$3->addr);
												create_ins(0,"PopParam",$3->addr,"","");
											} 
|	SUPER DOT IDENTIFIER LPAREN ArgumentList RPAREN	{
														$$ = create_node ( 7 ,"MethodInvocation", $1, $2, $3, $4, $5, $6);
														$$->ins = instCount+1;
														$$->addr = str_to_ch(newTemp());
														create_ins(0,$$->addr,"=","call",$3->addr);
														create_ins(0,"PopParam",$3->addr,"","");
													} 
|	SUPER DOT IDENTIFIER LPAREN RPAREN	{
											$$ = create_node ( 6 ,"MethodInvocation", $1, $2, $3, $4, $5);
											$$->ins = instCount+1;
											$$->addr = str_to_ch(newTemp());
											create_ins(0,$$->addr,"=","call",$3->addr);
											create_ins(0,"PopParam",$3->addr,"","");
										} 
;


ArrayAccess:
	Name LSPAR Expression RSPAR	{
									$$ = create_node ( 5 ,"ArrayAccess", $1, $2, $3, $4);
									$$->ins = instCount+1;
									string reg1 = newTemp();
									create_ins(1,reg1,"*",$3->addr,"4");
									string reg2 = newTemp();
									create_ins(1,reg2,"+",$1->addr,reg1);
									$$->addr = str_to_ch(newTemp());
									create_ins(0,$$->addr,"=","*",reg2);
								}
|	PrimaryNoNewArray LSPAR Expression RSPAR	{ $$ = create_node ( 5 ,"ArrayAccess", $1, $2, $3, $4); } 
;

PostfixExpression:
	Primary	{ $$ = $1; }
|	Name	{ $$ = $1; }
|	PostIncrementExpression	{ $$ = $1; }
|	PostDecrementExpression	{ $$ = $1; }
;

PostIncrementExpression:
	PostfixExpression PLUS_PLUS	{
									$$ = create_node ( 2 ,$2->val, $1);
									$$->ins = instCount+1;
									$$->addr = str_to_ch(newTemp());
									create_ins(0,$$->addr,"=",$1->addr,"");
									string reg = str_to_ch(newTemp());
									create_ins(1,reg,"+",$1->addr,"1");
									create_ins(0,$1->addr,"=",reg,"");
								}
;

PostDecrementExpression:
	PostfixExpression MINUS_MINUS	{
										$$ = create_node ( 2 ,$2->val, $1);
										$$->ins = instCount+1;
										create_ins(0,$$->addr,"=",$1->addr,"");
										string reg = str_to_ch(newTemp());
										create_ins(1,reg,"-",$1->addr,"1");
										create_ins(0,$1->addr,"=",reg,"");
									}
;

UnaryExpression:
	PreIncrementExpression	{ $$ = $1; }
|	PreDecrementExpression	{ $$ = $1; }
|	PLUS UnaryExpression	{
								$$ = create_node ( 2 ,$1->val, $2);
								$$->ins = instCount+1;
								create_ins(0,$$->addr,"=","+",$2->addr);
							}
|	MINUS UnaryExpression	{ 
								$$ = create_node ( 2 ,$1->val, $2);
								$$->ins = instCount+1;
								create_ins(0,$$->addr,"=","-",$2->addr);
							}
|	UnaryExpressionNotPlusMinus	{ $$ = $1; }
;

PreIncrementExpression:
	PLUS_PLUS UnaryExpression	{
									$$ = create_node ( 2 ,$1->val, $2);
									$$->ins = instCount+1;
									$$->addr = str_to_ch(newTemp());
									string reg = str_to_ch(newTemp());
									create_ins(1,reg,"+",$2->addr,"1");
									create_ins(0,$2->addr,"=",reg,"");
									$2->addr = str_to_ch(reg);
									create_ins(0,$$->addr,"=",$2->addr,"");
								}
;

PreDecrementExpression:
	MINUS_MINUS UnaryExpression	{
									$$ = create_node ( 2 ,$1->val, $2);
									$$->ins = instCount+1;
									$$->addr = str_to_ch(newTemp());
									string reg = str_to_ch(newTemp());
									create_ins(1,reg,"-",$1->addr,"1");
									create_ins(0,$2->addr,"=",reg,"");
									$2->addr = str_to_ch(reg);
									create_ins(0,$$->addr,"=",$2->addr,"");
								}
;

UnaryExpressionNotPlusMinus:
	PostfixExpression	{ $$ = $1; }
|	TILDE UnaryExpression	{
								$$ = create_node ( 2 ,$1->val , $2);
								$$->ins = instCount+1;
								$$->addr = str_to_ch(newTemp());
								create_ins(0,$$->addr,"=",$1->val,$2->addr);
							}
|	NOT UnaryExpression	{
							$$ = create_node ( 2 ,$1->val , $2);
							$$->ins = instCount+1;
							$$->addr = str_to_ch(newTemp());
							create_ins(0,$$->addr,"=",$1->val,$2->addr);
							$$->truelist = $2->falselist;
							$$->falselist = $2->truelist;
						}
|	CastExpression	{ $$ = $1; }
;

CastExpression:
	LPAREN PrimitiveType Dims RPAREN UnaryExpression	{ $$ = create_node ( 6 ,"CastExpression", $1, $2, $3, $4, $5); } 
|	LPAREN PrimitiveType RPAREN UnaryExpression	{ $$ = create_node ( 5 ,"CastExpression", $1, $2, $3, $4); } 
|	LPAREN Expression RPAREN UnaryExpressionNotPlusMinus	{ $$ = create_node ( 5 ,"CastExpression", $1, $2, $3, $4); } 
|	LPAREN Name Dims RPAREN UnaryExpressionNotPlusMinus	{ $$ = create_node ( 6 ,"CastExpression", $1, $2, $3, $4, $5); } 
;

MultiplicativeExpression:
	UnaryExpression	{ $$ = $1; }
|	MultiplicativeExpression TIMES UnaryExpression	{
														$$ = create_node ( 3 ,$2->val, $1, $3);
														$$->ins = instCount+1;
														$$->addr = str_to_ch(newTemp());
														create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
													} 
|	MultiplicativeExpression DIVIDE UnaryExpression	{
														$$ = create_node ( 3 ,$2->val, $1, $3);
														$$->ins = instCount+1;
														$$->addr = str_to_ch(newTemp());
														create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
													} 
|	MultiplicativeExpression MOD UnaryExpression	{
														$$ = create_node ( 3 ,$2->val, $1, $3);
														$$->ins = instCount+1;
														$$->addr = str_to_ch(newTemp());
														create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
													} 
;

AdditiveExpression:
	MultiplicativeExpression	{ $$ = $1; }
|	AdditiveExpression PLUS MultiplicativeExpression	{
															$$ = create_node ( 3 ,$2->val, $1, $3);
															$$->ins = instCount+1;
															$$->addr = str_to_ch(newTemp());
															create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
														} 
|	AdditiveExpression MINUS MultiplicativeExpression	{
															$$ = create_node ( 3 ,$2->val, $1, $3);
															$$->ins = instCount+1;
															$$->addr = str_to_ch(newTemp());
															create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
														} 
;

ShiftExpression:
	AdditiveExpression	{ $$ = $1; }
|	ShiftExpression LEFT_SHIFT AdditiveExpression	{
														$$ = create_node ( 3 ,$2->val, $1, $3);
														$$->ins = instCount+1;
														$$->addr = str_to_ch(newTemp());
														create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
													} 
|	ShiftExpression RIGHT_SHIFT AdditiveExpression	{
														$$ = create_node ( 3 ,$2->val, $1, $3);
														$$->ins = instCount+1;
														$$->addr = str_to_ch(newTemp());
														create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
													} 
|	ShiftExpression UNSIGNED_RIGHT_SHIFT AdditiveExpression	{
																$$ = create_node ( 3 ,$2->val, $1, $3);
																$$->ins = instCount+1;
																$$->addr = str_to_ch(newTemp());
																create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
															} 
;

RelationalExpression:
	ShiftExpression	{ $$ = $1; }
|	RelationalExpression LT ShiftExpression	{
												$$ = create_node ( 3 ,$2->val, $1, $3); 
												$$->ins = instCount+1;
												$$->addr = str_to_ch(newTemp());
												create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
												$$->truelist = makelist(instCount+1);
												$$->falselist = makelist(instCount+2);
												create_ins(0,"if",$$->addr,"goto","");
												create_ins(0,"goto","","","");
											} 
|	RelationalExpression GT ShiftExpression	{
												$$ = create_node ( 3 ,$2->val, $1, $3); 
												$$->ins = instCount+1;
												$$->addr = str_to_ch(newTemp());
												create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
												$$->truelist = makelist(instCount+1);
												$$->falselist = makelist(instCount+2);
												create_ins(0,"if",$$->addr,"goto","");
												create_ins(0,"goto","","","");
											} 
|	RelationalExpression LE ShiftExpression	{
												$$ = create_node ( 3 ,$2->val, $1, $3); 
												$$->ins = instCount+1;
												$$->addr = str_to_ch(newTemp());
												create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
												$$->truelist = makelist(instCount+1);
												$$->falselist = makelist(instCount+2);
												create_ins(0,"if",$$->addr,"goto","");
												create_ins(0,"goto","","","");
											} 
|	RelationalExpression GE ShiftExpression	{
												$$ = create_node ( 3 ,$2->val, $1, $3); 
												$$->ins = instCount+1;
												$$->addr = str_to_ch(newTemp());
												create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
												$$->truelist = makelist(instCount+1);
												$$->falselist = makelist(instCount+2);
												create_ins(0,"if",$$->addr,"goto","");
												create_ins(0,"goto","","","");
											} 
|	RelationalExpression INSTANCEOF ReferenceType	{ $$ = create_node ( 3 ,$2->val, $1, $3); } 
;

EqualityExpression:
	RelationalExpression	{ $$ = $1; }
|	EqualityExpression EQUALS_EQUALS RelationalExpression	{
																$$ = create_node ( 3 ,$2->val, $1, $3);
																$$->ins = instCount+1;
																$$->addr = str_to_ch(newTemp());
																create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
																$$->truelist = makelist(instCount+1);
																$$->falselist = makelist(instCount+2);
																create_ins(0,"if",$$->addr,"goto","");
																create_ins(0,"goto","","","");
															} 
|	EqualityExpression NOT_EQUALS RelationalExpression	{
															$$ = create_node ( 3 ,$2->val, $1, $3);
															$$->ins = instCount+1;
															create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
															$$->truelist = makelist(instCount+1);
															$$->falselist = makelist(instCount+2);
															create_ins(0,"if",$$->addr,"goto","");
															create_ins(0,"goto","","","");
														} 
;
AndExpression:
	EqualityExpression	{ $$ = $1; }
|	AndExpression BITWISE_AND EqualityExpression	{
														$$ = create_node ( 3 ,$2->val, $1, $3);
														$$->ins = instCount+1;
														$$->addr = str_to_ch(newTemp());
														create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
													}
;

ExclusiveOrExpression:
	AndExpression	{ $$ = $1; }
|	ExclusiveOrExpression XOR AndExpression	{
												$$ = create_node ( 3 ,$2->val, $1, $3);
												$$->ins = instCount+1;
												$$->addr = str_to_ch(newTemp());
												create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
											}
;

InclusiveOrExpression:
	ExclusiveOrExpression	{ $$ = $1; }
|	InclusiveOrExpression BITWISE_OR ExclusiveOrExpression	{
																$$ = create_node ( 3 ,$2->val, $1, $3);
																$$->ins = instCount+1;
																$$->addr = str_to_ch(newTemp());
																create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
															}
;

ConditionalAndExpression:
	InclusiveOrExpression	{ $$ = $1; }
|	ConditionalAndExpression AND InclusiveOrExpression	{
															$$ = create_node ( 3 ,$2->val, $1, $3);
															$$->ins = instCount+1;
															backpatch($1->truelist,$3->ins);
															$$->truelist = $3->truelist;
															$$->falselist = merge($1->falselist,$3->falselist);
														} 
;

ConditionalOrExpression:
	ConditionalAndExpression	{ $$ = $1; }
|	ConditionalOrExpression OR ConditionalAndExpression	{
															$$ = create_node ( 3 ,$2->val, $1, $3);
															$$->ins = instCount+1;
															backpatch($1->falselist,$3->ins);
															$$->truelist = merge($1->truelist,$3->truelist);
															$$->falselist = $3->falselist;
														} 
;

ConditionalExpression:
	ConditionalOrExpression	{ $$ = $1; }
|	ConditionalOrExpression QUESTION Expression COLON ConditionalExpression	{
																				$$ = create_node ( 6 ,"ConditionalExpression", $1, $2, $3, $4, $5);
																				$$->ins = instCount+1;
																				$$->addr = str_to_ch(newTemp());
																				create_ins(0,"if",$1->addr,"goto",to_string(instCount+4));
																				create_ins(1,$$->addr,"=",$5->addr,"");
																				create_ins(0,"goto",to_string(instCount+2),"","");
																				create_ins(1,$$->addr,"=",$3->addr,"");
																			} 
;

AssignmentExpression:
	ConditionalExpression	{ $$ = $1; }
|	Assignment	{ $$ = $1; }
;

Assignment:
	LeftHandSide AssignmentOperator AssignmentExpression	{
																$$ = create_node ( 3 ,$2->val, $1, $3);
																$$->ins = instCount+1;
																string prefix = string($2->val);
																prefix.pop_back();
																string reg = newTemp();
																if(prefix.length()){
																	create_ins(1,reg,prefix,$1->addr,$3->addr);
																	create_ins(0,$1->addr,"=",reg,"");
																}
																else{
																	create_ins(0,$1->addr,$2->val,$3->addr,"");
																}
															} 
;

LeftHandSide:
	Name	{ $$ = $1; }
|	FieldAccess	{ $$ = $1; }
|	ArrayAccess	{ $$ = $1; }
;

AssignmentOperator: 
	EQUALS 	{ $$ = $1; }
|	TIMES_EQUALS 	{ $$ = $1; }
|	DIVIDE_EQUALS	{ $$ = $1; }
|	MOD_EQUALS 	{ $$ = $1; }
|	PLUS_EQUALS 	{ $$ = $1; }
|	MINUS_EQUALS 	{ $$ = $1; }
|	LEFT_SHIFT_EQUALS	{ $$ = $1; }
|	RIGHT_SHIFT_EQUALS	{ $$ = $1; }
|	UNSIGNED_RIGHT_SHIFT_EQUALS 	{ $$ = $1; }
|	AND_EQUALS 	{ $$ = $1; }
|	XOR_EQUALS 	{ $$ = $1; }
|	OR_EQUALS	{ $$ = $1; }
;

Expression:
	AssignmentExpression	{ $$ = $1; }
;

%%


string handle_cast_expression(NODE* node){
	int num_children=node->children.size();
	ste* lookup_ste=lookup(current_ste,node->children[num_children-1]->val);

	string type="";
	if(lookup_ste==NULL && node->children[num_children-1]->type==""){
		string e_message="Error : Variable " + (string) node->children[num_children-1]->val + " not declared before use ";
		lineno=node->lineno;
		yerror(e_message);
	}
	else{
		for(int i=0;i<num_children-1;i++){
			string child_val=node->children[i]->val;
			if(child_val=="(" || child_val==")")
				continue;
			else
				type+=get_type(node->children[i]);
		}
	}
	return type;
}

string handle_expression(NODE* node)
{
	if (node->children.size()==0)
	{	
		lineno=node->lineno;
		string node_type=node->type;
		string node_val= node->val;
		if (node_val=="(" || node_val==")")
			return "";
		if (node_type=="")
		{
			//case the leaf is not a literal
			string node_val=node->val;

			ste* lookup_ste=lookup(current_ste,node_val);
			if (lookup_ste==NULL)
			{
				string var_name=node->val;
				string e_message= "Error : Variable " + var_name + " not declared before use ";
				lineno=node->lineno;
				yerror(e_message);
			}

			return lookup_ste->type;		
		}
		return node_type;
	}
	string child_val=node->val;

	if (child_val=="MethodInvocation" || child_val=="ClassInstanceCreationExpression" || child_val=="Qualified_Name")
		return handle_function(node);
	
	if (child_val=="ArrayInitializer")
		return handle_arrayinit(node);

	if(child_val=="ArrayAccess"){
		return handle_array_access(node);
	}
	if(child_val=="ArrayCreationExpression"){
		return handle_array_creation_Expression(node);
	}
	if(child_val=="CastExpression"){
		return handle_cast_expression(node);
	}
	node->type=str_to_ch(handle_expression(node->children[0]));

	for (int i=1;i<node->children.size();i++)
	{
		string child_type= handle_expression(node->children[i]);
		string node_type=node->type;
		string result_type= typecast(node_type,child_type,node->val);
		if (result_type=="Error")
		{
			string var_name=node->val;
			string e_message= "Error : Type mismatch for operator \'"+ var_name+ "\' with operands of type " + node_type +" and " + child_type;
			yerror(e_message);
		}
		node->type=str_to_ch(result_type);
	}

	string node_type=node->type;
	return node_type;
}

ste* insert_var_id(NODE * node,string type)
{
	string var_name = node->children[0]->val;
	lineno=node->children[0]->lineno;
	ste* return_ste;
	int dim = vardim(node);
	ste* new_ste= new ste;


	if (lookup(current_ste,var_name)==NULL){
		current_ste->lexeme=var_name;
		current_ste->type=type;
		current_ste->dim=dim;
		current_ste->token="IDENTIFIER";
		current_ste->lineno=lineno;
		return_ste=current_ste;
		current_ste->next=new_ste;
		new_ste->prev=current_ste;
		current_ste=new_ste;
	}
	else{
		string e_message= "Error: Variable "+var_name+ " redeclared";
		yerror(e_message);

	}
	return return_ste;
}

void insert_variable(NODE * local_var_node)
{
	int length = local_var_node->children.size();
	string type = get_type(local_var_node->children[length-2]);

	NODE* var_dec_node=local_var_node->children[length-1];

	for (auto var_id_child : var_dec_node->children)
	{
		string var_id_child_val=var_id_child->val;
		if (var_id_child_val == "Variable_Declarator_Id")
		{
			insert_var_id(var_id_child,type);
		}
		else if (var_id_child_val == "=")
		{
			NODE* var_dec_id = var_id_child->children[0];
			int dim=vardim(var_dec_id);
			for (int i=0;i<dim;i++)
			{
				type+="[]";
			}
			insert_var_id(var_dec_id,type);

			string right_type=handle_expression(var_id_child->children[1]);
			if (typecast(type,right_type,"=")=="Error")
			{
				string e_message= "Error : Type mismatch for assignment of type " + right_type + " to variable of type " + type;
				yerror(e_message);
			}
		}
	}
}

string get_type(NODE* node)
{
	string type="";
	if (node->children.size() == 0)
	{
		string node_val = node->val;
		return node_val;
	}
	else
	{
		for (auto child : node->children)
		{
			type =type + get_type(child);
		}
	}
	return type;
}

int vardim(NODE* node)
{
	int len=node->children.size()-1;
	return len/2;
}


void handle_interface_member_declaration(NODE* node)
{
	for(int i=0;i<node->children.size();i++)
	{
		string node_child_val=node->children[i]->val;
		if(node_child_val=="FieldDeclaration")
		{
			fieldSymTable(node->children[i]);
		}
		else if (node_child_val=="AbstractMethodDeclaration"){
			ste * new_ste = new ste;
			current_ste->type="branch_head";

			//save the branch header in the stack to return back to it later
			branch.push(current_ste);

			current_ste->next_scope=new_ste;
			new_ste->prev_scope=current_ste;

			// move current scope onto the new scope
			current_ste=new_ste;
			branchMethodSymtable(node->children[i]);
			cout<<endl<<endl;
			current_ste=branch.top();
			branch.pop();
			ste* new_ste1 = new ste;
			current_ste->next=new_ste1;
			new_ste1->prev=current_ste;
			current_ste=new_ste1;
		}
	}
}

void handle_interface_declaration(NODE* node)
{
	for(int i=0;i<node->children.size();i++)
	{
		string node_child_val=node->children[i]->val;
		if (node_child_val=="interface")
		{
			cur_class=node->children[i+1]->val;
			ste * new_ste = new ste;
			current_ste->type="branch_head";

			//save the branch header in the stack to return back to it later
			branch.push(current_ste);

			current_ste->next_scope=new_ste;
			new_ste->prev_scope=current_ste;

			// move current scope onto the new scope
			current_ste=new_ste;
			classMap[cur_class]=new stme;
		}
		else if(node_child_val=="InterfaceBody")
		{
			NODE* interface_body=node->children[i];
			for (auto child : interface_body->children)
			{
				string child_val=child->val;
				if (child_val=="Interface_Member_Declarations")
					handle_interface_member_declaration(child);
			}
		}
	}
	current_ste=branch.top();
	branch.pop();
	ste* new_ste1 = new ste;
	current_ste->next=new_ste1;
	new_ste1->prev=current_ste;
	current_ste=new_ste1;
	
}

void searchAST(NODE* node)
{
	if(node == NULL)
		return;
	
	string temp=node->val;

	if (temp=="{")
	{	
		if(temp=="{" && forFlag==1){
			forFlag=0;
			return;
		}
		ste * new_ste = new ste;
		
		current_ste->type="branch_head";

		branch.push(current_ste);

		current_ste->next_scope=new_ste;
		new_ste->prev_scope=current_ste;

		current_ste=new_ste;
	}
	else if(temp=="ForStatementNoShortIf" || temp=="ForStatement"){
		int flag=0;
		ste * new_ste = new ste;
		
		current_ste->type="branch_head";

		branch.push(current_ste);

		current_ste->next_scope=new_ste;
		new_ste->prev_scope=current_ste;

		current_ste=new_ste;

		for (int i=0;i<node->children.size();i++)
		{		
			NODE* for_statement_child = node->children[i];
			if(i==node->children.size()-1){
				searchAST(for_statement_child);
				current_ste=branch.top();
				branch.pop();
				ste* new_ste1 = new ste;
				current_ste->next=new_ste1;
				new_ste1->prev=current_ste;
				current_ste=new_ste1;
				return;
			}
			string for_statement_child_val = for_statement_child->val;
			if (for_statement_child_val == "LocalVariableDeclaration")
			{
				flag+=1;
				searchAST(for_statement_child);
			}
			else if ( for_statement_child_val=="for" || for_statement_child_val=="(" || for_statement_child_val==")" || for_statement_child_val==";" ){
				continue;
			}
			else{
				handle_expression(for_statement_child);
			}
		}

		if(flag==2) forFlag=1;

		
		return;
	}
	else if (temp=="}")
	{
		current_ste=branch.top();
		branch.pop();
		ste* new_ste = new ste;
		current_ste->next=new_ste;
		new_ste->prev=current_ste;
		current_ste=new_ste;
	}
	else if(temp == "LocalVariableDeclaration")
	{
		insert_variable(node);
	}
	else if (temp=="FieldDeclaration")
	{
		fieldSymTable(node);
	}
	else if (temp=="InterfaceDeclaration")
	{
		return handle_interface_declaration(node);
	}
	else if( temp == "MethodDeclaration" || temp =="ConstructorDeclaration")
	{
		// new node for the new branch and the branch header in the previous branch junction
		ste * new_ste = new ste;
		current_ste->type="branch_head";

		//save the branch header in the stack to return back to it later
		branch.push(current_ste);

		current_ste->next_scope=new_ste;
		new_ste->prev_scope=current_ste;

		// move current scope onto the new scope
		current_ste=new_ste;
		branchMethodSymtable(node);

		string child_val=node->children[1]->val;
		if (child_val!=";")
		{
			vector<NODE*> child_nodes=node->children[1]->children;
			for (int i=1;i<child_nodes.size();i++)
			{
				searchAST(child_nodes[i]);
			}
		}
		return;
	}
	else if (temp=="this")
	{
		string var_name = "this";
		lineno=node->children[0]->lineno;
		ste* new_ste= new ste;

		current_ste->lexeme=var_name;
		current_ste->type=cur_class;
		current_ste->dim=0;
		current_ste->token="IDENTIFIER";
		current_ste->lineno=lineno;

		current_ste->next=new_ste;
		new_ste->prev=current_ste;
		current_ste=new_ste;
	}
	else if(temp=="ExpressionStatement")
	{
		string left_child_val=node->children[0]->val;
		if (left_child_val=="MethodInvocation" || left_child_val== "ClassInstanceCreationExpression")
		{	
			handle_function(node->children[0]);
		}
		else
			handle_expression(node->children[0]);
	}

	for(int i = 0; i < node->children.size(); i++)
	{
		string child_node_val=node->children[i]->val;
		if (child_node_val=="class"){
			cur_class=node->children[i+1]->val;
			classMap[cur_class]= new stme;
		}
		searchAST(node->children[i]);
	}
}

string get_invocation_name(NODE* node){
	string name="";
	if (node->children.size()==0)
	{
		string node_val=node->val;
		lineno=node->lineno;
		if(node_val=="(") return "";
		return node_val;
	}
	else
	{
		for (auto child : node->children)
		{	
			string child_name = get_invocation_name(child);
			if (child_name=="") break;
			name = name + get_invocation_name(child);
		}
	}
	return name;
}

string handle_array_creation_Expression(NODE* node){
	string array_type=get_type(node->children[1]);
	for(auto array_child: node->children){
		string array_child_val = array_child->val;
		if(array_child_val=="Dim_Expers"){
			for(auto dim_child: array_child->children){
				string dim_child_val=dim_child->val;
				if(dim_child_val=="Dim_Expr"){
					array_type=array_type+"[]";
				}
				if (handle_expression(dim_child->children[1])!="int")
				{
					string error_message="Error : array index must be an integer";
					yerror(error_message);
				}
			}
		}
		else if(array_child_val=="Dims"){
			for(auto dim_child: array_child->children){
				string dim_child_val=dim_child->val;
				if(dim_child_val=="["){
					array_type=array_type+"[]";
				}
			}
		}

	}
	return array_type;
}

string handle_array_access(NODE* node){
	
	NODE* first_child=node->children[0];
	string type = handle_expression(first_child);

	int l=type.size();
	string last_two = type.substr(l-2,2);
	string new_sub_type=type.substr(0,l-2);

	string first_child_val=first_child->val;
	if (last_two!="[]" )
	{
		string error_message="Error : "+first_child_val+" is not an array";
		yerror(error_message);
	}
	if (handle_expression(node->children[2])!="int")
	{
		string error_message="Error : array index must be an integer";
		yerror(error_message);
	}

	return new_sub_type;
}

string handle_function(NODE* node){

	string node_val = node->val;
	if(node_val == "MethodInvocation"){
		string name = get_invocation_name(node);

		string class_scope;
		int dot_index=name.find(".");
		if (dot_index!=-1)
		{
			ste* lookup_ste=lookup(current_ste,name.substr(0,dot_index));
			if (lookup_ste!=NULL)
				class_scope=lookup_ste->type;
			else
			{
				string error_mesaage="Error : variable "+name.substr(0,dot_index)+" is not defined";
			}
			name=name.substr(dot_index+1);
		}
		else
		{
			class_scope=cur_class;
		}

		//find name in classMap
		stme* class_head=classMap[class_scope];
		while (class_head!=NULL)
		{
			if (class_head->id==name)
			{
				string type=tableMap[name]->return_type;
				int num_params=tableMap[name]->num_params;

				int arg_flag=0;
					
				for(auto node_child: node->children){
					string node_child_val = node_child->val;

					if(node_child_val=="Argument_List"){

						vector < string > types;
						arg_flag=1;
						for(auto node_child_child: node_child->children){

							string node_child_child_val = node_child_child->val;
							if(node_child_child_val==",") continue;

							string arg_type=handle_expression(node_child_child);
							types.push_back(arg_type);
						}

						if(types.size()!=num_params){
							string e_message= "Error : Method " + name + " called with wrong number of arguments ";
							yerror(e_message);
						}
						else{

							ste* entry_ste=tableMap[name]->entry;
							

							for(int i=0;i<num_params;i++){
								if(types[i]!=entry_ste->type){
									string e_message= "Error : Method " + name + " called with wrong type of arguments ";
									yerror(e_message);
								}
								entry_ste=entry_ste->next;
							}
						}
					}

				}

				if(arg_flag==0 && num_params!=0){
					string e_message= "Error : Method " + name + " called with wrong number of arguments ";
					yerror(e_message);
				}
				return type;

			}
			class_head=class_head->next;
		}

		if (name=="out.println" || name=="out.print")
		{
			//check child node for "argumentList"
			for(auto node_child: node->children){
				string node_child_val = node_child->val;

				if(node_child_val=="Argument_List"){
					handle_expression(node_child);
				}
			}
			return "void";
		}

		string e_message= "Error : Method " + name + " not declared before use ";
		yerror(e_message);

	}
	
	if(node_val=="ClassInstanceCreationExpression"){
		string name = get_invocation_name(node->children[1]);
		

		if (classMap.find(name)==classMap.end())
		{	
			string e_message= "Error : Class " + name + " not declared before use ";
			yerror(e_message);
		}
		else
		{	
			string type=name;
			return type;
		}
	}

	if(node_val=="Qualified_Name"){
		string name = get_invocation_name(node);


		
		string class_scope;
		int dot_index=name.find(".");
		string second=name.substr(dot_index+1);
		if (second=="length")
		{
			ste* lookup_ste=lookup(current_ste,name.substr(0,dot_index));
			if (lookup_ste!=NULL)
			{
				string type=lookup_ste->type;
				if (type.substr(type.size()-2,2)=="[]" )
				{
					return "int";
				}
				else
				{
					string error_message="Error : "+name.substr(0,dot_index)+" is not an array";
					yerror(error_message);
				}
			}
			else
			{
				string error_mesaage="Error : variable "+name.substr(0,dot_index)+" was not declared";
				yerror(error_mesaage);
			}
		}
		ste* lookup_ste=lookup(current_ste,name);
		if (lookup_ste!=NULL)
		{
			string type=lookup_ste->type;
			return type;
		}
		else
		{
			string e_message= "Error : variable " + name + " not declared before use ";
			yerror(e_message);
		}
	}

	return "";
}

string handle_arrayinit(NODE* node)
{
	NODE* var_init;
	for (auto child:node->children)
	{
		string child_val=child->val;
		if (child_val=="Variable_Initializers")
			var_init=child;
	}
	string var_type="";

	for (auto child : var_init->children)
	{
		string child_val=child->val;
		if (child_val!=",")
			var_type=typecast(var_type,handle_expression(child),var_init->val);
			if (var_type=="Error")
			{
				string e_message= "Error : Array Initializer has incompatible types ";
				yerror(e_message);
			}
	}
	return var_type+"[]";
}

string typecast(string typ1,string typ2,string op)
{
	bool valid = (typeMap.find(typ1)!= typeMap.end()) && (typeMap.find(typ2)!= typeMap.end());
	int t1,t2;
	if (valid)
	{	
		t1=typeMap[typ1];
		t2=typeMap[typ2];
	}
	if (op=="=" || op =="-" )
	{
		if (valid)
		{
			if (t1>=t2)
				return typ1;
			else
				return "Error";
		}
		else
		{
			if (typ1==typ2)
				return typ1;
			else
				return "Error";
		}
	}
	if(op=="+")
	{
		if (valid)
		{
			if (t1>=t2)
				return typ1;
			else 
				return typ2;
		}
		else
		{
			if (typ1=="String" || typ2=="String")
				return "String";
			if (typ1==typ2)
				return typ1;
			else
				return "Error";
		}
	}
	if (op==">" || op == "<" || op=="<=" || op==">=" || op=="==" || op=="!=")
	{
		if (valid)
		{
			return "boolean";
		}
		else
		{
			if (typ1==typ2)
				return "boolean";
			else
				return "Error";
		}
	}
	if (op=="&&" || op=="||")
	{
		if (typ1==typ2 && typ1=="boolean")
			return "boolean";
		else
			return "Error";
	}
	if (op=="*" || op=="/" || op=="%")
	{
		if (valid)
		{
			if (t1>=t2)
				return typ1;
			else
				return typ2;
		}
		else
		{
			return "Error";
		}
	}
	if (op=="&" || op=="|" || op=="^" || op=="<<" || op==">>" || op==">>>")
	{
		if (valid)
		{
			if (t1>=t2)
				return typ1;
			else
				return typ2;
		}
		else
		{
			return "Error";
		}
	}

	if (op=="+=")
	{
		if (valid)
		{
			if (t1>=t2)
				return typ1;
			else
				return "Error";
		}
		else
		{
			if (typ1=="String")
				return "String";
			if (typ1==typ2)
				return typ1;
			else
				return "Error";
		}
	}
	if (op=="-=" || op=="*=" || op=="/=" || op=="%=" || op=="&=" || op=="|=" || op=="^=" || op=="<<=" || op==">>=" || op==">>>=")
	{
		if (valid)
		{
			if (t1>=t2)
				return typ1;
			else
				return "Error";
		}
		else
		{
			return "Error";
		}
	}
	
	if (typ1 == typ2)
		return typ1;
	if (typ1 == "" || typ2 == "")
		return typ1+typ2;
	return "Error";
}


void fieldSymTable(NODE* node)
{
	int length= node->children.size();
	string type = get_type(node->children[length-3]);
	if (length==4){
		NODE* var_dec_node=node->children[length-2];
		for (auto var_id_child : var_dec_node->children)
		{
			string var_id_child_val=var_id_child->val;
			if (var_id_child_val == "Variable_Declarator_Id")
			{	
				int dim=vardim(var_id_child);
				for(int i=0;i<dim;i++)
					type=type+"[]";
				ste* entry=insert_var_id(var_id_child,type);
				stme* field_entry=new stme;
				field_entry->num_params=-1;
				field_entry->entry=entry;
				field_entry->next=classMap[cur_class];
				classMap[cur_class]=field_entry;
				classMap[cur_class]->id=entry->lexeme;
				
			}
			else if (var_id_child_val == "=")
			{	
				int dim=vardim(var_id_child);
				for(int i=0;i<dim;i++)
					type=type+"[]";
				NODE* var_dec_id = var_id_child->children[0];
				ste* entry=insert_var_id(var_dec_id,type);
				stme* field_entry=new stme;
				field_entry->num_params=-1;
				field_entry->entry=entry;
				field_entry->next=classMap[cur_class];
				classMap[cur_class]=field_entry;
				classMap[cur_class]->id=entry->lexeme;
				string right_type=handle_expression(var_id_child->children[1]);
				if (typecast(type,right_type,"=")=="Error")
				{
					string e_message= "Error : Type mismatch for assignment of type " + right_type + " to variable of type " + type;
					yerror(e_message);
				}
			}
		}
	}
	else{
		NODE* var_id_child=node->children[length-2];
		string var_id_child_val=var_id_child->val;
		if (var_id_child_val == "Variable_Declarator_Id")
		{
			ste* entry=insert_var_id(var_id_child,type);
			stme* field_entry=new stme;
			field_entry->num_params=-1;
			field_entry->entry=entry;
			field_entry->next=classMap[cur_class];
			classMap[cur_class]=field_entry;
			classMap[cur_class]->id=entry->lexeme;
		}
		else if (var_id_child_val == "=")
		{
			NODE* var_dec_id = var_id_child->children[0];
			ste* entry=insert_var_id(var_dec_id,type);
			stme* field_entry=new stme;
			field_entry->num_params=-1;
			field_entry->entry=entry;
			field_entry->next=classMap[cur_class];
			classMap[cur_class]=field_entry;
			classMap[cur_class]->id=entry->lexeme;
		}
	}

}

char* str_to_ch(string s)
{
	char* result_chr = new char[s.size()+1];
	strcpy(result_chr,s.c_str());
	return result_chr;
}

void create_ins(int type,string i,string op,string arg1,string arg2)
{
	vector<string> instruction{to_string(type),i,op,arg1,arg2};
	instructions.push_back(instruction);
	instCount += 1;
}

void branchMethodSymtable(NODE* declaration_node)
{
	string decl_node=declaration_node->val;
	if(decl_node=="ConstructorDeclaration")
	{
		for (auto decl_child_node : declaration_node->children)
		{
			string decl_child_node_val=decl_child_node->val;
			if (decl_child_node_val=="ConstructorDeclarator")
			{
				NODE* identifier_node=decl_child_node->children[0];
				string id_node_val=identifier_node->val;

				stme* table_entry=new stme;
				table_entry->entry=current_ste;
				table_entry->return_type=id_node_val;
				table_entry->num_params=0;

				tableMap[id_node_val]=table_entry;
				table_entry->next=classMap[cur_class];
				classMap[cur_class]=table_entry;
				classMap[cur_class]->id=id_node_val;
				

				for (auto child_node : decl_child_node->children)
				{
					string child_node_val=child_node->val;
					if (child_node_val == "Formal_Parameter_List")
					{
						for (auto param_node : child_node->children)
						{
							string param_node_val=param_node->val;
							if (param_node_val=="FormalParameter")
							{	
								table_entry->num_params++;
								ParameterSymtable(param_node);
							}
						}
					}
				}
			}
		}
		return ;
	}

	NODE* header_node=declaration_node->children[0];
	string type;

	int idx=0;
	for(auto child_node : header_node->children)
	{	
		idx+=1;
		string node_val=child_node->val;
		if(node_val == "MethodDeclarator")
		{
			idx-=1;
			break;
		}
	}
	int index=0;
	for (auto node : header_node->children)
	{	
		index+=1;

		if(index==idx){
			type=get_type(node);
			continue;
		}
		string node_val=node->val;
		if(node_val == "MethodDeclarator")
		{
			NODE* identifier_node=node->children[0];
			// add map entry for the function
			string id_node_val=identifier_node->val;
			
			stme* table_entry=new stme;
			table_entry->entry=current_ste;
			table_entry->return_type=type;
			table_entry->num_params=0;

			tableMap[id_node_val]=table_entry;
			table_entry->next=classMap[cur_class];
			classMap[cur_class]=table_entry;
			classMap[cur_class]->id=id_node_val;
		
			for (auto child_node : node->children)
			{
				string child_node_val=child_node->val;
				if (child_node_val == "Formal_Parameter_List")
				{
					for (auto param_node : child_node->children)
					{
						string param_node_val=param_node->val;
						if (param_node_val=="FormalParameter")
						{	
							table_entry->num_params++;
							ParameterSymtable(param_node);
						}
					}
				}
			}
		}
	}
}

void ParameterSymtable(NODE* param_node)
{
	int length=param_node->children.size();
	//store the type of the parameter
	string type=get_type(param_node->children[length-2]);

	//store the name of the parameter
	NODE* var_node=param_node->children[length-1];
	int dim=vardim(var_node);
	for (int i=0;i<dim;i++)
	{
		type+="[]";
	}
	insert_var_id(var_node,type);
}

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

void MakeIRFile()
{
	int tabs=0;
	for(int i=0;i<instructions.size();i++)
	{
		if(instructions[i][1]=="EndFunc") tabs--;
		/* cout << i+1 << "\t" << string(tabs,'\t'); */
		code_out << i+1 << "\t" << string(tabs,'\t');
		if(instructions[i][0]=="0")
		{
			for(int j=1;j<instructions[i].size();j++)
			{
				/* cout << instructions[i][j] << (instructions[i][j].length()?" ":""); */
				code_out << instructions[i][j] << (instructions[i][j].length()?" ":"");
			}
			if(instructions[i][1]=="BeginFunc") tabs++;
		}
		else
		{
			/* cout << instructions[i][1] << " = " << instructions[i][3] << " " << instructions[i][2] << " " << instructions[i][4]; */
			code_out << instructions[i][1] << " = " << instructions[i][3] << " " << instructions[i][2] << " " << instructions[i][4];
		}
		/* cout << endl; */
		code_out << endl;
	}
}

void printToCSV(){
	ofstream fout;

	for(auto it = tableMap.begin(); it != tableMap.end(); it++){
		string filename = "./output/Function-" + it->first + ".csv";
		fout.open(filename);
		
		fout<<"Function name:,Return Type, Number of Parameters ,Lexeme,Type,Line Number,Token"<<endl;

		fout<<it->first<<","<<it->second->return_type<<","<<it->second->num_params<<",,,,"<<endl;
		ste* current_ste = it->second->entry;
		while(current_ste->next!=NULL || current_ste->next_scope!=NULL || !branch.empty()){
			if(current_ste->next==NULL && current_ste->next_scope==NULL){
				current_ste = branch.top();
				branch.pop();
				continue;
			}
			if(current_ste->type=="branch_head"){
				branch.push(current_ste->next);
				current_ste = current_ste->next_scope;
				continue;
			}

			fout<<",,,"<<current_ste->lexeme<<","<<current_ste->type<<","<<current_ste->lineno<<","<<current_ste->token<<endl;
			current_ste = current_ste->next;
		}
		
		fout.close();
	}
}

vector<int> makelist(int i){
	return vector<int>{i};
}

vector<int> merge(vector<int> p1, vector<int> p2){
	vector<int> merged;
    merged.reserve(p1.size() + p2.size());
    merged.insert(merged.end(), p1.begin(), p1.end());
    merged.insert(merged.end(), p2.begin(), p2.end());
	return merged;
}

void backpatch(vector<int>p, int i)
{
	for(int j=0;j<p.size();j++){
		// instructions[abs(p[j])-1].push_back(to_string(i));
		*(instructions[abs(p[j])-1].end()-1)=to_string(i);
	}
}

string newTemp(){
	return "t"+to_string(tempCount++);
}

int main(int argc, char* argv[]){

	typeMap["byte"] = 1;
	typeMap["short"] = 2;
	typeMap["char"] = 3;
	typeMap["int"] = 4;
	typeMap["long"] = 5;
	typeMap["float"] = 6;
	typeMap["double"] = 7;

	if(argc < 2 || argc > 4) {
		cout << "Usage: ./main <input file> <output file> <debug>" << endl;
		cout << "Example: ./main --input=input.java --output=output.dot --verbose" << endl;
		cout<<endl;
		cout << "For more help, run ./main --help" << endl;
		return 0;
	}

	string input_file = "";
	string output_file = "";

	yydebug = 0;
	bool debug = false;
	bool noInputFile = true;

	for(int i=1;i<argc;i++){
		string arg = argv[i];
		if(arg == "--help"){
			cout << "--input : Add this flag for specifying a input file to the parser. This is a required flag." << endl;
			cout << "Example: ./main --input=input.java" << endl;
			cout<<endl;
			cout << "--output Add this flag for specifying a output file to the parser which would contain the output i.e a AST in graphical form. This flag is optional. Default value is output.dot" << endl;
			cout << "Example: ./main --input=input.java --output=result.dot" << endl;
			cout<<endl;
			cout << "--verbose Add this flag for switching on the debug mode in the parser. This flag is optional." << endl;
			cout << "Example: ./main --input=input.java --output=result.dot --verbose" << endl;
			return 0;
		}
		else if(arg.substr(0,8) == "--input="){
			input_file = arg.substr(8);
			noInputFile = false;
		}
		else if(arg.substr(0,9) == "--output="){
			output_file = arg.substr(9);
		}
		else if(arg == "--verbose"){
			debug = true;
		}

		else{
			cout << "Invalid argument: " << arg << endl;
			return 0;
		}
	}

	if(input_file == "" || noInputFile){
		cout << "Please specify an input file." << endl;
		return 0;
	}
	if(output_file == ""){
		output_file = "output.dot";
	}
	if(debug){
		cout << "Input file: " << input_file << endl;
		cout << "Output file: " << output_file << endl;
		cout << "Debug: " << debug << endl;
		yydebug = 1;
	}

	/*--------------------------------------------------------------*/

	// Open the output file
	fout.open(output_file.c_str(),ios::out);
	code_out.open("./output/3AC.txt",ios::out);
	// Get the DOT file template from the file
    ifstream infile("./DOT_Template.txt");
    string line;
    while (getline(infile, line))
        fout << line << endl;

	/*--------------------------------------------------------------*/

	//  Open the input file
	FILE* fp = fopen(("../tests/"+input_file).c_str(), "r");

	if(!fp){
		cout << "Error opening file: " << input_file << endl;
		return 0;
	}
	yyin = fp;

	instCount=0;
	tempCount=0;
	yyparse();

	// Close the input file
	fclose(fp);

	/*--------------------------------------------------------------*/

	// Create DOT file
    MakeDOTFile(start_node);
    fout << "}";

	// Close the output file
    fout.close();

	/*--------------------------------------------------------------*/

	// Create 3AC file
    MakeIRFile();

	// Close the output file
    code_out.close();

	/*--------------------------------------------------------------*/

	start_ste->type="global_head";
	current_ste= new ste;
	start_ste->next=current_ste;
	current_ste->prev=start_ste;
	searchAST(start_node);
	printToCSV();
	/* print_ste(start_ste); */
    return 0;
}