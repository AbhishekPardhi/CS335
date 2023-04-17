%{
    /* Declaration */
    #include <bits/stdc++.h>
    #include "data.h"
	#include "symbol_table.cpp"
	#include <sys/stat.h>

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
	string handle_expression(NODE* );
	string handle_array_access(NODE*);
	string handle_arrayinit(NODE* );
	string handle_array_creation_Expression(NODE* );
	string handle_class_declaration(NODE* );
	int calc_width(NODE*);
	int fetchOffset(string ,string );
	int lineno;
	void print_ste(ste* ,int);
	string cur_class;
	string cur_func;
    NODE *start_node;
	ste* start_ste = new ste;
	ste * current_ste = start_ste;
	int parsenum;
	stack<string> thisTemps;

	void yerror(string s)
	{
		print_ste(start_ste);
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
	int interfaceFlag=0;
	int offset = 0;
	int scopeFlag=0; // 1 if lmpara needs to skip else 0
	unordered_map <string,stme*> classMap;	

	unordered_map <string, int> typeMap;
	unordered_map <string, int> classTypeMap;
	unordered_map <string, int> funcTypeMap;
	unordered_map <string, bool> hasConst;
	
	int paramCount = 0;

	bool curr_static_function = false;

	stack < int > loopStack;

	int VarId=0;

%}

%union {
    NODE *elem;
}

%token <elem>  BITWISE_AND BITWISE_OR COMMA FINALLY LPAREN RPAREN IDENTIFIER EQUALS DOT CLASS PUBLIC PRIVATE SEMICOLON COLON OR RETURN TRY SYNCHRONIZED THROW BREAK CONTINUE CATCH FINAL IF ELSE WHILE FOR LSPAR RSPAR TIMES_EQUALS DIVIDE_EQUALS MOD_EQUALS PLUS_EQUALS MINUS_EQUALS LEFT_SHIFT_EQUALS RIGHT_SHIFT_EQUALS UNSIGNED_RIGHT_SHIFT_EQUALS AND_EQUALS XOR_EQUALS OR_EQUALS QUESTION NOT_EQUALS LT GT LE GE INSTANCEOF AND XOR PLUS MINUS TIMES DIVIDE MOD PLUS_PLUS MINUS_MINUS TILDE THIS SUPER INT LONG SHORT BYTE CHAR IMPLEMENTS FLOAT DOUBLE BOOLEAN VOID NOT EXTENDS RMPARA LMPARA STATIC LEFT_SHIFT RIGHT_SHIFT UNSIGNED_RIGHT_SHIFT NULL_LITERAL CHAR_LITERAL STRING_LITERAL TEXTBLOCK_LITERAL FLOAT_LITERAL INTEGER_LITERAL BOOLEAN_LITERAL THROWS NEW IMPORT PACKAGE INTERFACE EQUALS_EQUALS 
%type <elem>  WhileExpression Interface ClassID for lmpara rmpara Goal CompilationUnit Type PrimitiveType NumericType IntegralType FloatingPointType ReferenceType ClassOrInterfaceType ClassType InterfaceType ArrayType Name SimpleName QualifiedName ImportDeclarations TypeDeclarations PackageDeclaration ImportDeclaration TypeDeclaration Modifiers Modifier ClassDeclaration Super Interfaces ClassBody ClassBodyDeclarations ClassBodyDeclaration ClassMemberDeclaration FieldDeclaration VariableDeclarators VariableDeclarator VariableDeclaratorId VariableInitializer MethodDeclaration MethodHeader MethodDeclarator FormalParameterList Throws ClassTypeList MethodBody StaticInitializer ConstructorDeclaration ConstructorDeclarator ConstructorBody InterfaceDeclaration Expression ArrayInitializer FormalParameter Block SingleTypeImportDeclaration TypeImportOnDemandDeclaration AssignmentExpression ConditionalExpression Assignment ConditionalOrExpression LeftHandSide ConditionalAndExpression InclusiveOrExpression ExclusiveOrExpression AndExpression EqualityExpression RelationalExpression ShiftExpression AdditiveExpression MultiplicativeExpression UnaryExpression PreIncrementExpression PreDecrementExpression UnaryExpressionNotPlusMinus PostIncrementExpression PostDecrementExpression CastExpression Primary PrimaryNoNewArray ArrayCreationExpression ArrayAccess FieldAccess MethodInvocation ClassInstanceCreationExpression ArgumentList PostfixExpression InterfaceTypeList ExplicitConstructorInvocation InterfaceBody InterfaceMemberDeclarations InterfaceMemberDeclaration ConstantDeclaration AbstractMethodDeclaration ExtendsInterfaces AssignmentOperator Dims DimExprs DimExpr VariableInitializers BlockStatements BlockStatement LocalVariableDeclarationStatement Statement StatementNoShortIf StatementWithoutTrailingSubstatement IfThenStatement IfThenElseStatement IfThenElseStatementNoShortIf WhileStatement WhileStatementNoShortIf ForStatement ForStatementNoShortIf ForInit ForUpdate StatementExpression StatementExpressionList LocalVariableDeclaration EmptyStatement LabeledStatement ExpressionStatement BreakStatement ContinueStatement ReturnStatement ThrowStatement SynchronizedStatement TryStatement Catches CatchClause Finally LabeledStatementNoShortIf Else

%%
// Grammer
// Start
Goal:
	CompilationUnit	{ $$ = create_node ( 2 ,"Goal", $1); start_node=$$;}
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
	IDENTIFIER	{
					$$ = $1;
					$$->addr = $$->val;
					$$->arrayBase = $$->val;
				}
;

QualifiedName:
	Name DOT IDENTIFIER	{
							$$ = create_node ( 4 ,"Qualified_Name", $1, $2, $3);							
							$$->ins = instCount+1;
							string reg1 = newTemp();
							
							create_ins(0,reg1,"=","symtable("+string($1->addr)+","+string($3->addr)+")","");
							// find offset
							string reg2 = newTemp();
							create_ins(1,reg2,"+",string($1->addr),reg1);
							$$->addr = str_to_ch("* "+reg2);
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
	ClassDeclaration	{ $$ = $1;}
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
	Modifiers ClassID Super Interfaces ClassBody	{
														$$ = create_node ( 6 ,"Class_Declaration", $1, $2, $3, $4, $5);
													} 
|	ClassID Interfaces ClassBody	{
										$$ = create_node ( 4 ,"Class_Declaration", $1, $2, $3);
									}
|	Modifiers ClassID Super ClassBody	{
											$$ = create_node ( 5 ,"Class_Declaration", $1, $2, $3, $4);
										} 
|	Modifiers ClassID Interfaces ClassBody	{
												$$ = create_node ( 5 ,"Class_Declaration", $1, $2, $3, $4);
											} 
|	ClassID ClassBody	{	
							$$ = create_node ( 3 ,"Class_Declaration", $1, $2);
						}
|	Modifiers ClassID ClassBody	{
									$$ = create_node ( 4 ,"Class_Declaration", $1, $2, $3);
								}
;

ClassID:
	CLASS IDENTIFIER	{ $$ = create_node ( 3 ,"Class_ID", $1, $2);  cur_class = $2->val; }

lmpara:
	LMPARA	{ 
				$$ = $1; 
				if(forFlag>0 && scopeFlag==0) 
					paramCount++; 
				if (parsenum==2 && scopeFlag==0) 
				{
					branch.push(current_ste);
					current_ste=current_ste->next_scope;
				} 
				scopeFlag=0;
			}
;

rmpara:
	RMPARA	{ 
				$$ = $1; 
				if(forFlag>0 && paramCount>0) 
				{
					paramCount--; 
					current_ste=branch.top(); 
					branch.pop();
				} 
				else if (parsenum==2 && forFlag==0 ) 
				{ 
					current_ste=branch.top(); 
					branch.pop();
				}
			}
;

Super:
	EXTENDS ClassType	{ $$ = create_node ( 3 ,"Super", $1, $2); } 
;

Interfaces:
	IMPLEMENTS InterfaceTypeList	{ $$ = create_node ( 3 ,"Interfaces", $1, $2);} 
;

InterfaceTypeList:
	InterfaceType	{ $$ = create_node(2,"Interface_Type_List",$1) ; }
|	InterfaceTypeList COMMA InterfaceType	{ 
												$1->children.push_back($2);
												$1->children.push_back($3); 
												$$ =$1;
											} 
;

ClassBody:
	lmpara ClassBodyDeclarations rmpara	{ 
											$$ = create_node ( 4 ,"ClassBody", $1, $2, $3);
											if (parsenum==2){
												current_ste=current_ste->next;
											}
										} 
|	lmpara rmpara	{ 
						$$ = create_node ( 3 ,"ClassBody", $1, $2);
						if (parsenum==2){
							current_ste=current_ste->next;
						}
					} 
;

ClassBodyDeclarations:
	ClassBodyDeclaration	{$$ = create_node(2,"Class_Body_Declarations",$1) ; }
|	ClassBodyDeclarations ClassBodyDeclaration	{ 
													$1->children.push_back($2); 
													$$ =$1; 
												} 
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
|	Type VariableDeclarator SEMICOLON	{ 
											$$ = create_node ( 4 ,"FieldDeclaration", $1, $2, $3); 
											if (parsenum==2) {
												current_ste=current_ste->next;
											} 
										} 
;

VariableDeclarators:
	VariableDeclarator	{ 
							$$ = create_node(2,"Variable_declarators",$1); 
							if(parsenum==2){ 
								current_ste=current_ste->next;
							}
						}
|	VariableDeclarators COMMA VariableDeclarator	{ 
														$1->children.push_back($2);
														$1->children.push_back($3); 
														$$ =$1 ;
														if (parsenum==2){ 
															current_ste=current_ste->next; 
														} 
													}
;

VariableDeclarator:
	VariableDeclaratorId	{ $$ = $1; }
|	VariableDeclaratorId EQUALS VariableInitializer	{
														$$ = create_node ( 3 ,$2->val, $1, $3);
														if (interfaceFlag==0){
															$$->ins = instCount+1;
															create_ins(0,$1->addr,$2->val,$3->addr,"");
														}
													}
;

VariableDeclaratorId:
	IDENTIFIER	{ 
					$$ = create_node(2,"Variable_Declarator_Id",$1);
					$1->isvar=1; 
					$$->addr = $1->addr; 
					ste* lookup_ste = lookup(current_ste, $1->val);
					if(lookup_ste!=NULL && parsenum==2){
						$$->addr = str_to_ch(lookup_ste->lexeme + "{" + to_string(lookup_ste->VarId)  + "}");
					}
				}
|	VariableDeclaratorId LSPAR RSPAR	{
											$1->children.push_back($2);
											$1->children.push_back($3); 
											$$ =$1;
										} 
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
														bool flag=false;
														if (interfaceFlag==0){
															$$->ins = instCount+1;
															string reg1 = newTemp();
															create_ins(0,reg1,"=","PopParam","");
															thisTemps.push(reg1);
														}
														cur_func=$1->val;
													} 
|	MethodDeclarator LSPAR RSPAR	{
										$$ = create_node ( 4 ,"MethodDeclarator", $1, $2, $3);
									} 
|	IDENTIFIER LPAREN RPAREN	{
									cur_func=$1->val;
									$$ = create_node ( 4 ,"MethodDeclarator", $1, $2, $3);
									$$->ins = instCount+1;
									bool flag=false;
									if (interfaceFlag==0){
										string funcName="";
										for(auto class_ptr:classMap)
										{
											stme* temp=class_ptr.second;
											while(temp!=NULL)
											{
												if($1->val==temp->id)
												{
													flag=true;
													funcName+=class_ptr.first+".";
													break;
												}
												temp=temp->next;
											}
											if(flag) break;
										}
										funcName+=string($1->addr);
										create_ins(0,funcName,":","","");
										string reg1 = newTemp();
										create_ins(0,"ra","=","PopParam","");
										create_ins(0,reg1,"=","PopParam","");
										thisTemps.push(reg1);
									}
								} 
;

FormalParameterList:
	FormalParameter	{
						$$ = create_node(2,"Formal_Parameter_List",$1) ;
						$$->addr = str_to_ch(string(""+*string($1->addr).begin()));
						string str="";
						str.push_back(*string($1->addr).begin());
						$$->addr = str_to_ch(str);
						string funcName="";
						if (parsenum==2){
							scopeFlag=1;
							branch.push(current_ste);
							current_ste=current_ste->next_scope;
							funcName=current_ste->class_entry->id;
							current_ste=current_ste->next;
						}
						if (interfaceFlag==0 && parsenum==2){
							$$->ins = instCount+1;
							create_ins(0,funcName+":","","","");
							ste* lookup_ste = lookup(current_ste, $1->addr);
							if(lookup_ste!=NULL && parsenum==2){
								$$->addr = str_to_ch(lookup_ste->lexeme + "{" + to_string(lookup_ste->VarId)  + "}");
							}
							create_ins(0,"ra","=","PopParam","");
							create_ins(0,$$->addr,"=","PopParam","");
						}
					}
|	FormalParameterList COMMA FormalParameter	{
													$1->children.push_back($2);$1->children.push_back($3); $$ =$1 ;
													$$->addr=str_to_ch(string($1->addr)+string($3->addr));
													if (parsenum==2){
														scopeFlag=1;
														current_ste=current_ste->next;
													}
													if (interfaceFlag==0 && parsenum==2)
													{
													$$->ins = instCount+1;
													create_ins(0,$3->addr,"=","PopParam","");
													}
												} 
;

FormalParameter:
	Type VariableDeclaratorId	{
									$$ = create_node ( 3 ,"FormalParameter", $1, $2);
									$$->addr = $2->addr;
									
								}
|	FINAL Type VariableDeclaratorId	{
										$$ = create_node ( 4 ,"FormalParameter", $1, $2, $3);
										$$->addr = $3->addr;
									}
;

Throws:
	THROWS ClassTypeList	{ $$ = create_node ( 3 ,"Throws", $1, $2); } 
;

ClassTypeList:
	ClassType	{ $$ = create_node(2,"Class_Type_List",$1) ; }
|	ClassTypeList COMMA ClassType	{ 
										$1->children.push_back($2);
										$1->children.push_back($3); 
										$$ =$1;
									} 
;

MethodBody:
	Block 	{
				$$ = $1;
				$$->ins = instCount+1;
				create_ins(0,"Goto","ra","","");
				thisTemps.pop();
				backpatch($1->nextlist,$$->ins);
			}
|	SEMICOLON	{
					$$ = $1;
					$$->ins = instCount+1;
					create_ins(0,"Goto","ra","","");
					thisTemps.pop();
				}
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

SimpleName LPAREN FormalParameterList RPAREN	{
														$$ = create_node ( 5 ,"ConstructorDeclarator", $1, $2, $3, $4);
														$$->ins = instCount+1;
														bool flag=false;
														string reg1 = newTemp();
														create_ins(0,reg1,"=","PopParam","");
														thisTemps.push(reg1);
													} 
|	SimpleName LPAREN RPAREN	{ 
									$$ = create_node ( 4 ,"ConstructorDeclarator", $1, $2, $3); 
									$$->ins = instCount+1;
									string reg1 = newTemp();
									create_ins(0,reg1,"=","PopParam","");
									thisTemps.push(reg1);
									create_ins(0,"ra","=","PopParam","");
								} 
;

ConstructorBody:
	lmpara ExplicitConstructorInvocation BlockStatements rmpara	{
																	$$ = create_node ( 5 ,"ConstructorBody", $1, $2, $3, $4);
																	$$->ins = instCount+1;
																	create_ins(0,"Goto","ra","","");
																	thisTemps.pop();
																	backpatch($3->nextlist,$$->ins);
																	if (parsenum==2){current_ste=current_ste->next;}
																}
|	lmpara ExplicitConstructorInvocation rmpara	{
													$$ = create_node ( 4 ,"ConstructorBody", $1, $2, $3);
													$$->ins = instCount+1;
													create_ins(0,"Goto","ra","","");
													thisTemps.pop();
													backpatch($2->nextlist,$$->ins);
													if (parsenum==2){current_ste=current_ste->next;}
												} 
|	lmpara BlockStatements rmpara	{
										$$ = create_node ( 4 ,"ConstructorBody", $1, $2, $3);
										$$->ins = instCount+1;
										create_ins(0,"Goto","ra","","");
										thisTemps.pop();
										backpatch($2->nextlist,$$->ins);
										if (parsenum==2){current_ste=current_ste->next;}
									} 
|	lmpara rmpara	{
						$$ = create_node ( 3 ,"ConstructorBody", $1, $2);
						$$->ins = instCount+1;
						create_ins(0,"Goto","ra","","");
						thisTemps.pop();
						if (parsenum==2){current_ste=current_ste->next;}
					}
;


ExplicitConstructorInvocation:
	THIS LPAREN ArgumentList RPAREN SEMICOLON	{ $$ = create_node ( 6 ,"ExplicitConstructorInvocation", $1, $2, $3, $4, $5); } 
|	THIS LPAREN RPAREN SEMICOLON	{ $$ = create_node ( 5 ,"ExplicitConstructorInvocation", $1, $2, $3, $4); } 
|	SUPER LPAREN ArgumentList RPAREN SEMICOLON	{ $$ = create_node ( 6 ,"ExplicitConstructorInvocation", $1, $2, $3, $4, $5); } 
|	SUPER LPAREN RPAREN SEMICOLON	{ $$ = create_node ( 5 ,"ExplicitConstructorInvocation", $1, $2, $3, $4); } 
;

InterfaceDeclaration:
	Modifiers Interface IDENTIFIER ExtendsInterfaces InterfaceBody	{ $$ = create_node ( 6 ,"InterfaceDeclaration", $1, $2, $3, $4, $5); interfaceFlag=0;} 
|	Modifiers Interface IDENTIFIER InterfaceBody	{ $$ = create_node ( 5 ,"InterfaceDeclaration", $1, $2, $3, $4); interfaceFlag=0;} 
|	Interface IDENTIFIER ExtendsInterfaces InterfaceBody	{ $$ = create_node ( 5 ,"InterfaceDeclaration", $1, $2, $3, $4); interfaceFlag=0;} 
|	Interface IDENTIFIER InterfaceBody	{ $$ = create_node ( 4 ,"InterfaceDeclaration", $1, $2, $3); interfaceFlag=0; } 
;

Interface:
	INTERFACE	{ $$ = $1; interfaceFlag=1; }

ExtendsInterfaces:
	EXTENDS InterfaceType	{ $$ = create_node(3,"Extends_Interfaces",$1,$2) ; } 
|	ExtendsInterfaces COMMA InterfaceType	{ 
												$1->children.push_back($2);
												$1->children.push_back($3); 
												$$ =$1; 
											} 
;

InterfaceBody:
	lmpara InterfaceMemberDeclarations rmpara	{ 
													$$ = create_node ( 4 ,"InterfaceBody", $1, $2, $3); 
													if (parsenum==2){
														current_ste=current_ste->next;
													}
												} 
|	lmpara rmpara	{ 
						$$ = create_node ( 3 ,"InterfaceBody", $1, $2);
						if (parsenum==2){
							current_ste=current_ste->next;
						}
					} 
;

InterfaceMemberDeclarations:
	InterfaceMemberDeclaration	{
									$$ = create_node(2,"Interface_Member_Declarations",$1);
								} 
|	InterfaceMemberDeclarations InterfaceMemberDeclaration	{ 
																$1->children.push_back($2); 
																$$ =$1 ;
																} 
;

InterfaceMemberDeclaration:
	ConstantDeclaration	{ $$ = $1; }
|	AbstractMethodDeclaration	{ 
									$$ = $1;
									if (parsenum==2){
										current_ste=branch.top();
										branch.pop(); 
										scopeFlag=0;
									}
								}
;

ConstantDeclaration:
	FieldDeclaration	{ $$ = $1;}
;

AbstractMethodDeclaration:
	MethodHeader SEMICOLON	{ 
								$$ = create_node ( 3 ,"AbstractMethodDeclaration", $1, $2); 
							} 
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
	lmpara BlockStatements rmpara	{
										$$ = create_node ( 4 ,"Block", $1, $2, $3);
										$$->ins = $2->ins;
										$$->nextlist = $2->nextlist;
										$$->falselist = $2->falselist;
										if (parsenum==2) {
											current_ste=current_ste->next;
										}
									} 
|	lmpara rmpara	{ $$ = create_node ( 3 ,"Block", $1, $2); } 
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
	LocalVariableDeclaration SEMICOLON	{ 
											$$ = create_node ( 3 ,"LocalVariableDeclarationStatement", $1, $2); 
											$$->ins = $1->ins;
										}
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
|	WhileStatement	{ $$ = $1; loopStack.pop(); }
|	ForStatement	{ $$ = $1; loopStack.pop(); }
;

StatementNoShortIf:
	StatementWithoutTrailingSubstatement	{ $$ = $1; }
|	LabeledStatementNoShortIf	{ $$ = $1; }
|	IfThenElseStatementNoShortIf	{ $$ = $1; }
|	WhileStatementNoShortIf	{ $$ = $1; loopStack.pop(); }
|	ForStatementNoShortIf	{ $$ = $1; loopStack.pop(); }
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
	WHILE LPAREN WhileExpression RPAREN Statement	{	
													$$ = create_node ( 6 ,"WhileStatement", $1, $2, $3, $4, $5);
													$$->ins = instCount+1;
													backpatch($5->nextlist,$3->ins);
													backpatch($3->truelist,$5->ins);
													$$->nextlist = $3->falselist;
													create_ins(0,"goto",to_string($3->ins),"","");
												} 
;

WhileStatementNoShortIf:
	WHILE LPAREN WhileExpression RPAREN StatementNoShortIf	{
															$$ = create_node ( 6 ,"WhileStatementNoShortIf", $1, $2, $3, $4, $5);
															$$->ins = instCount+1;
															backpatch($5->nextlist,$3->ins);
															backpatch($3->truelist,$5->ins);
															$$->nextlist = $3->falselist;
															create_ins(0,"goto",to_string($3->ins),"","");
														} 
;

WhileExpression:
	Expression	{ 
					$$ = $1; 
					$$->ins = $1->ins;
					loopStack.push($$->ins);
				}

ForStatement:
	for LPAREN ForInit SEMICOLON Expression SEMICOLON ForUpdate RPAREN Statement	{
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
																						if (forFlag>0){
																							scopeFlag=0;forFlag--; 
																							current_ste=branch.top(); 
																							branch.pop();
																							current_ste=current_ste->next;
																						}
																					} 
|	for LPAREN ForInit SEMICOLON SEMICOLON ForUpdate RPAREN Statement	{
																			$$ = create_node ( 9 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7, $8);
																			$$->ins = instCount+1;																																								$$->ins = instCount+1;
																			backpatch($8->nextlist,$6->ins);
																			backpatch($6->truelist,$8->ins);
																			$$->nextlist = $8->nextlist;
																			for(auto ins:$8->nextlist){
																				if(ins<0){
																						$$->nextlist.push_back(-ins);
																					}
																			}
																			create_ins(0,"goto",to_string($6->ins),"","");
																			if (forFlag>0){
																				scopeFlag=0;forFlag--; 
																				current_ste=branch.top(); 
																				branch.pop();
																				current_ste=current_ste->next;
																			}
																		} 
|	for LPAREN SEMICOLON Expression SEMICOLON ForUpdate RPAREN Statement	{
																				$$ = create_node ( 9 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7, $8);
																				$$->ins = instCount+1;
																				backpatch($8->nextlist,$6->ins);
																				backpatch($4->truelist,$8->ins);
																				backpatch($6->truelist,$4->ins);
																				$$->nextlist = $4->falselist;
																				for(auto ins:$8->nextlist){
																					if(ins<0){
																							$$->nextlist.push_back(-ins);
																						}
																				}
																				create_ins(0,"goto",to_string($6->ins),"","");
																				if (forFlag>0){
																					scopeFlag=0;forFlag--; 
																					current_ste=branch.top(); 
																					branch.pop();
																					current_ste=current_ste->next;
																				}
																			} 
|	for LPAREN SEMICOLON SEMICOLON ForUpdate RPAREN Statement	{
																	$$ = create_node ( 8 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7);
																	$$->ins = instCount+1;																																						$$->ins = instCount+1;
																	backpatch($7->nextlist,$5->ins);
																	backpatch($5->truelist,$7->ins);
																	$$->nextlist = $7->nextlist;
																	for(auto ins:$7->nextlist){
																		if(ins<0){
																				$$->nextlist.push_back(-ins);
																			}
																	}
																	create_ins(0,"goto",to_string($5->ins),"","");
																	if (forFlag>0){
																		scopeFlag=0;forFlag--; 
																		current_ste=branch.top(); 
																		branch.pop();
																		current_ste=current_ste->next;
																	}
																} 
|	for LPAREN ForInit SEMICOLON Expression SEMICOLON RPAREN Statement	{
																			$$ = create_node ( 9 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7, $8);
																			$$->ins = instCount+1;
																			backpatch($8->nextlist,$5->ins);
																			backpatch($5->truelist,$8->ins);
																			$$->nextlist = merge($5->falselist,$8->nextlist);
																			for(auto ins:$8->nextlist){
																				if(ins<0){
																						$$->nextlist.push_back(-ins);
																					}
																			}
																			create_ins(0,"goto",to_string($5->ins),"","");
																			if (forFlag>0){
																				scopeFlag=0;forFlag--; 
																				current_ste=branch.top(); 
																				branch.pop();
																				current_ste=current_ste->next;
																			}
																		} 
|	for LPAREN ForInit SEMICOLON SEMICOLON RPAREN Statement	{
																$$ = create_node ( 8 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7);
																$$->ins = instCount+1;
																backpatch($7->nextlist,$7->ins);
																$$->nextlist = $7->nextlist;
																for(auto ins:$7->nextlist){
																	if(ins<0){
																			$$->nextlist.push_back(-ins);
																		}
																}
																create_ins(0,"goto",to_string($7->ins),"","");
																if (forFlag>0){
																	scopeFlag=0;forFlag--; 
																	current_ste=branch.top(); 
																	branch.pop();
																	current_ste=current_ste->next;
																}
															} 
|	for LPAREN SEMICOLON Expression SEMICOLON RPAREN Statement	{
																	$$ = create_node ( 8 ,"ForStatement", $1, $2, $3, $4, $5, $6, $7);
																	$$->ins = instCount+1;
																	backpatch($7->nextlist,$7->ins);
																	backpatch($4->truelist,$7->ins);
																	$$->nextlist = merge($4->falselist,$7->nextlist);
																	for(auto ins:$7->nextlist){
																		if(ins<0){
																				$$->nextlist.push_back(-ins);
																			}
																	}
																	create_ins(0,"goto",to_string($4->ins),"","");
																	if (forFlag>0){
																		scopeFlag=0;forFlag--; 
																		current_ste=branch.top(); 
																		branch.pop();
																		current_ste=current_ste->next;
																	}
																} 
|	for LPAREN SEMICOLON SEMICOLON RPAREN Statement	{
														$$ = create_node ( 7 ,"ForStatement", $1, $2, $3, $4, $5, $6);
														$$->ins = instCount+1;
														backpatch($6->nextlist,$6->ins);
														$$->nextlist = $6->nextlist;
														for(auto ins:$6->nextlist){
															if(ins<0){
																	$$->nextlist.push_back(-ins);
																}
														}
														create_ins(0,"goto",to_string($6->ins),"","");
														if (forFlag>0){
															scopeFlag=0;forFlag--; 
															current_ste=branch.top(); 
															branch.pop();
															current_ste=current_ste->next;
														}
													} 
;

ForStatementNoShortIf:
	for LPAREN ForInit SEMICOLON Expression SEMICOLON ForUpdate RPAREN StatementNoShortIf	{
																								$$ = create_node ( 10 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7, $8, $9);
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
																								if (forFlag>0){
																									scopeFlag=0;forFlag--; 
																									current_ste=branch.top(); 
																									branch.pop();
																									current_ste=current_ste->next;
																								}
																							} 
|	for LPAREN ForInit SEMICOLON SEMICOLON ForUpdate RPAREN StatementNoShortIf	{
																					$$ = create_node ( 9 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7, $8);
																					$$->ins = instCount+1;																																								$$->ins = instCount+1;
																					backpatch($8->nextlist,$6->ins);
																					backpatch($6->truelist,$8->ins);
																					$$->nextlist = $8->nextlist;
																					for(auto ins:$8->nextlist){
																						if(ins<0){
																								$$->nextlist.push_back(-ins);
																							}
																					}
																					create_ins(0,"goto",to_string($6->ins),"","");
																					if (forFlag>0){
																						scopeFlag=0;forFlag--; 
																						current_ste=branch.top(); 
																						branch.pop();
																						current_ste=current_ste->next;
																					}
																				} 

|	for LPAREN SEMICOLON Expression SEMICOLON ForUpdate RPAREN StatementNoShortIf	{
																						$$ = create_node ( 9 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7, $8);
																						$$->ins = instCount+1;
																						backpatch($8->nextlist,$6->ins);
																						backpatch($4->truelist,$8->ins);
																						backpatch($6->truelist,$4->ins);
																						$$->nextlist = $4->falselist;
																						for(auto ins:$8->nextlist){
																							if(ins<0){
																									$$->nextlist.push_back(-ins);
																								}
																						}
																						create_ins(0,"goto",to_string($6->ins),"","");
																						if (forFlag>0){
																							scopeFlag=0;forFlag--; 
																							current_ste=branch.top(); 
																							branch.pop();
																							current_ste=current_ste->next;
																						}
																					} 
|	for LPAREN SEMICOLON SEMICOLON ForUpdate RPAREN StatementNoShortIf	{
																			$$ = create_node ( 8 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7);
																			$$->ins = instCount+1;																																						$$->ins = instCount+1;
																			backpatch($7->nextlist,$5->ins);
																			backpatch($5->truelist,$7->ins);
																			$$->nextlist = $7->nextlist;
																			for(auto ins:$7->nextlist){
																				if(ins<0){
																						$$->nextlist.push_back(-ins);
																					}
																			}
																			create_ins(0,"goto",to_string($5->ins),"","");
																			if (forFlag>0){
																				scopeFlag=0;forFlag--; 
																				current_ste=branch.top(); 
																				branch.pop();
																				current_ste=current_ste->next;
																			}
																		} 
|	for LPAREN ForInit SEMICOLON Expression SEMICOLON RPAREN StatementNoShortIf	{
																					$$ = create_node ( 9 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7, $8);
																					$$->ins = instCount+1;
																					backpatch($8->nextlist,$5->ins);
																					backpatch($5->truelist,$8->ins);
																					$$->nextlist = merge($5->falselist,$8->nextlist);
																					for(auto ins:$8->nextlist){
																						if(ins<0){
																								$$->nextlist.push_back(-ins);
																							}
																					}
																					create_ins(0,"goto",to_string($5->ins),"","");
																					if (forFlag>0){
																						scopeFlag=0;forFlag--; 
																						current_ste=branch.top(); 
																						branch.pop();
																						current_ste=current_ste->next;
																					}
																				} 
|	for LPAREN ForInit SEMICOLON SEMICOLON RPAREN StatementNoShortIf	{
																			$$ = create_node ( 8 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7);
																			$$->ins = instCount+1;
																			backpatch($7->nextlist,$7->ins);
																			$$->nextlist = $7->nextlist;
																			for(auto ins:$7->nextlist){
																				if(ins<0){
																						$$->nextlist.push_back(-ins);
																					}
																			}
																			create_ins(0,"goto",to_string($7->ins),"","");
																			if (forFlag>0){
																				scopeFlag=0;forFlag--; 
																				current_ste=branch.top(); 
																				branch.pop();
																				current_ste=current_ste->next;
																			}
																		} 
|	for LPAREN SEMICOLON Expression SEMICOLON RPAREN StatementNoShortIf	{
																			$$ = create_node ( 8 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6, $7);
																			$$->ins = instCount+1;
																			backpatch($7->nextlist,$7->ins);
																			backpatch($4->truelist,$7->ins);
																			$$->nextlist = merge($4->falselist,$7->nextlist);
																			for(auto ins:$7->nextlist){
																				if(ins<0){
																						$$->nextlist.push_back(-ins);
																					}
																			}
																			create_ins(0,"goto",to_string($4->ins),"","");
																			if (forFlag>0){
																				scopeFlag=0;forFlag--; 
																				current_ste=branch.top(); 
																				branch.pop();
																				current_ste=current_ste->next;
																			}
																		} 
|	for LPAREN SEMICOLON SEMICOLON RPAREN StatementNoShortIf	{
																	$$ = create_node ( 7 ,"ForStatementNoShortIf", $1, $2, $3, $4, $5, $6);
																	$$->ins = instCount+1;
																	backpatch($6->nextlist,$6->ins);
																	$$->nextlist = $6->nextlist;
																	for(auto ins:$6->nextlist){
																		if(ins<0){
																				$$->nextlist.push_back(-ins);
																			}
																	}
																	create_ins(0,"goto",to_string($6->ins),"","");
																	if (forFlag>0){
																		scopeFlag=0;forFlag--; 
																		current_ste=branch.top(); 
																		branch.pop();
																		current_ste=current_ste->next;
																	}
																} 
;

for:
	FOR {
			$$ = $1; 
			if (parsenum==2)
			{
				forFlag++; 
				scopeFlag=1; 
				branch.push(current_ste); 
				current_ste=current_ste->next_scope;
			}
		}
;

ForInit:
	StatementExpressionList	{ $$ = $1;}
|	LocalVariableDeclaration	{ $$ = $1;}
;

ForUpdate:
	StatementExpressionList	{
								$$ = $1;
								$$->ins = $1->ins;
								loopStack.push($$->ins);
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
							create_ins(0,"goto",to_string(loopStack.top()),"","");
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
|	BOOLEAN_LITERAL	{
						$$ = $1; $$->addr = $$->val; $1->type=str_to_ch("boolean");
						$$->ins = instCount+1;
						create_ins(0,"goto","","","");
						if(string($$->val)=="true")
							$$->truelist = makelist(instCount);
						else 
							$$->falselist = makelist(instCount);
					}
|	STRING_LITERAL	{ $$ = $1; $$->addr = $$->val; $1->type=str_to_ch("String");}
|	TEXTBLOCK_LITERAL	{ $$ = $1; $$->addr = $$->val; $1->type=str_to_ch("text_block");}
|	THIS	{
				$$ = $1;
				if(thisTemps.size()>0)
					$$->addr = str_to_ch(thisTemps.top());
			}
|	LPAREN Expression RPAREN	{ $$ = create_node ( 4 ,"PrimaryNoNewArray", $1, $2, $3);$$->addr=$2->addr; } 
|	ClassInstanceCreationExpression	{ $$ = $1; }
|	FieldAccess	{ $$ = $1; }
|	MethodInvocation	{ $$ = $1; }
|	ArrayAccess	{
					$$ = $1;
					string reg1 = string($1->addr);
					$$->ins = instCount+1;
					$$->addr = str_to_ch(newTemp());
					// $$->addr = str_to_ch(string($1->arrayBase)+"[ "+$1->addr+" ]");
					ste* lookup_ste = lookup(current_ste, $1->arrayBase);
					if(lookup_ste!=NULL && parsenum==2){
						create_ins(0,string($$->addr),"=",string($1->arrayBase)+ "{" + to_string(lookup_ste->VarId)  + "}" + "[ "+reg1+" ]","");

					}
					else{
						create_ins(0,string($$->addr),"=",string($1->arrayBase)+"[ "+reg1+" ]","");
					}
				}
;

ClassInstanceCreationExpression:
	NEW ClassType LPAREN ArgumentList RPAREN	{
													$$ = create_node ( 6 ,"ClassInstanceCreationExpression", $1, $2, $3, $4, $5);
													$$->ins = instCount+1;
													string classname=$2->val;
													// offset
													string reg1 = newTemp();
													$$->addr=str_to_ch(reg1);
													create_ins(0,reg1,"=","heap_alloc("+to_string(classTypeMap[classname])+")","");
													if(parsenum==2 && hasConst[classname]){
														// create_ins(0,"stackpointer","+"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
														create_ins(0,"PushParam",reg1,"","");
														create_ins(0,"call",classname+"-"+classname,"","");
														create_ins(0,"stackpointer","-"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
													}
												} 
|	NEW ClassType LPAREN RPAREN	{
									$$ = create_node ( 5 ,"ClassInstanceCreationExpression", $1, $2, $3, $4);
									$$->ins = instCount+1;
									string classname=$2->val;
									// offset
									string reg1 = newTemp();
									$$->addr=str_to_ch(reg1);
									create_ins(0,reg1,"=","heap_alloc("+to_string(classTypeMap[classname])+")","");
									if(parsenum==2 && hasConst[classname]){
										create_ins(0,"stackpointer","+"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
										create_ins(0,"PushParam",reg1,"","");
										create_ins(0,"call",classname+"-"+classname,"","");
										create_ins(0,"stackpointer","-"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
									}
								} 
;

ArgumentList:
	Expression	{
					$$ = create_node(2,"Argument_List",$1) ;
					$$->ins = instCount+1;
					create_ins(0,"stackpointer","+"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
					if(string($1->addr).back()==']')
					{
						string reg1 = newTemp();
						create_ins(0,reg1,"=",$1->addr,"");
						create_ins(0,"PushParam",reg1,"","");
					}
					else
					create_ins(0,"PushParam",$1->addr,"","");
					$$->addr = str_to_ch(to_string(1));
				}
|	ArgumentList COMMA Expression	{
										$1->children.push_back($2);
										$1->children.push_back($3);
										$$ =$1;
										$$->addr = str_to_ch(to_string(stoi(string($1->addr))+1));
										$$->ins = instCount+1;
										if(string($3->addr).back()==']')
										{
											string reg1 = newTemp();
											create_ins(0,reg1,"=",$3->addr,"");
											create_ins(0,"PushParam",reg1,"","");
										}
										else
										create_ins(0,"PushParam",$3->addr,"","");
										
									}
;

ArrayCreationExpression:
	NEW PrimitiveType DimExprs Dims	{ 
										$$ = create_node ( 5 ,"ArrayCreationExpression", $1, $2, $3, $4); 
										$$->ins = instCount+1;
										$$->addr = str_to_ch(newTemp());
										create_ins(1,$$->addr,"heap_alloc()","","");
									} 
|	NEW PrimitiveType DimExprs	{ 
									$$ = create_node ( 4 ,"ArrayCreationExpression", $1, $2, $3); 
									$$->ins = instCount+1;
									$$->addr = str_to_ch(newTemp());
									int size = 1;
									if(parsenum==2){
										for(int i=0;i<current_ste->dims.size();i++)
											size *= current_ste->dims[i];
										
										size*=getOffset(current_ste->type);
									}
									create_ins(1,$$->addr,"heap_alloc("+to_string(size)+")","","");
								} 
|	NEW ClassOrInterfaceType DimExprs Dims	{ 
												$$ = create_node ( 5 ,"ArrayCreationExpression", $1, $2, $3, $4); 
												$$->ins = instCount+1;
												$$->addr = str_to_ch(newTemp());
												int size = 1;
												if(parsenum==2){
													for(int i=0;i<current_ste->dims.size();i++)
														size *= current_ste->dims[i];
													
													size*=getOffset(current_ste->type);
												}
												create_ins(1,$$->addr,"heap_alloc("+to_string(size)+")","","");
											} 
|	NEW ClassOrInterfaceType DimExprs	{ 
											$$ = create_node ( 4 ,"ArrayCreationExpression", $1, $2, $3); 
											$$->ins = instCount+1;
											$$->addr = str_to_ch(newTemp());
											int size = 1;
											if(parsenum==2){
												for(int i=0;i<current_ste->dims.size();i++)
													size *= current_ste->dims[i];
												
												size*=getOffset(current_ste->type);
											}
											create_ins(1,$$->addr,"heap_alloc("+to_string(size)+")","","");
										} 
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
	Primary DOT IDENTIFIER	{
								$$ = create_node ( 4 ,"FieldAccess", $1, $2, $3);
								$$->ins = instCount+1;
								string reg1 = newTemp();
								// create_ins(0,reg1,"=","symtable("+string($1->addr)+","+string($3->addr)+")","");
								// find offset
								int offset_ = fetchOffset("",$3->addr); 
								create_ins(0,reg1,"=",to_string(offset_),"");
								string reg2 = newTemp();
								create_ins(1,reg2,"+",string($1->addr),reg1);
								$$->addr = str_to_ch("* "+reg2);
								if (parsenum==2){ current_ste=current_ste->next;}
							}
|	SUPER DOT IDENTIFIER	{ $$ = create_node ( 4 ,"FieldAccess", $1, $2, $3); } 
;

MethodInvocation:
	Name LPAREN ArgumentList RPAREN	{	
										$$ = create_node ( 5 ,"MethodInvocation", $1, $2, $3, $4);
										$$->ins = instCount+1;
										if((string)$1->val=="println"){
											create_ins(0,"call Print",$3->addr,"","");
											$$->addr = str_to_ch("0");
											// create_ins(0,"PopParam",$3->addr,"","");
										}
										else{
											$$->addr = str_to_ch(newTemp());
											// create_ins(0,"stackpointer","+"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
											create_ins(0,"PushParam",to_string(instCount+3),"","");
											create_ins(0,$$->addr,"=","call",cur_class+"-"+(string)$1->addr);
											create_ins(0,"stackpointer","-"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
											// create_ins(0,"PopParam",$3->addr,"","");
										}
									} 
|	Name LPAREN RPAREN	{
							$$ = create_node ( 4 ,"MethodInvocation", $1, $2, $3);
							$$->ins = instCount+1;
							if((string)$1->val!="println"){
								$$->addr = str_to_ch(newTemp());
								create_ins(0,"stackpointer","+"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
								create_ins(0,$$->addr,"=","call",cur_class+"-"+(string)$1->addr);
								create_ins(0,"stackpointer","-"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
							}
						} 
|	Primary DOT IDENTIFIER LPAREN ArgumentList RPAREN	{
															$$ = create_node ( 7 ,"MethodInvocation", $1, $2, $3, $4, $5, $6);
															$$->ins = instCount+1;
															$$->addr = str_to_ch(newTemp());
															// create_ins(0,"stackpointer","+"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
															if(parsenum==2) {
																ste* lookup_ste = lookup(current_ste, $1->val);
																create_ins(0,$$->addr,"=","call",lookup_ste->type + "-"+ (string) $3->addr);
															}
															create_ins(0,"stackpointer","-"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
															// create_ins(0,"PopParam",$3->addr,"","");
														} 
|	Primary DOT IDENTIFIER LPAREN RPAREN	{
												$$ = create_node ( 6 ,"MethodInvocation", $1, $2, $3, $4, $5);
												$$->ins = instCount+1;
												$$->addr = str_to_ch(newTemp());
												create_ins(0,"stackpointer","+"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
												if(parsenum==2) {
													ste* lookup_ste = lookup(current_ste, $1->val);
													create_ins(0,$$->addr,"=","call",lookup_ste->type + "-"+ (string) $3->addr);
												}
												create_ins(0,"stackpointer","-"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
												// create_ins(0,"PopParam",$3->addr,"","");
											} 
|	SUPER DOT IDENTIFIER LPAREN ArgumentList RPAREN	{
														$$ = create_node ( 7 ,"MethodInvocation", $1, $2, $3, $4, $5, $6);
														$$->ins = instCount+1;
														$$->addr = str_to_ch(newTemp());
														// create_ins(0,"stackpointer","+"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
														create_ins(0,$$->addr,"=","call",$3->addr);
														create_ins(0,"stackpointer","-"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
														// create_ins(0,"PopParam",$3->addr,"","");
													} 
|	SUPER DOT IDENTIFIER LPAREN RPAREN	{
											$$ = create_node ( 6 ,"MethodInvocation", $1, $2, $3, $4, $5);
											$$->ins = instCount+1;
											$$->addr = str_to_ch(newTemp());
											create_ins(0,"stackpointer","+"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
											create_ins(0,$$->addr,"=","call",$3->addr);
											create_ins(0,"stackpointer","-"+to_string(funcTypeMap[cur_class+"-"+cur_func]),"","");
											// create_ins(0,"PopParam",$3->addr,"","");
										} 
;


ArrayAccess:
	Name LSPAR Expression RSPAR	{
									$$ = create_node ( 5 ,"ArrayAccess", $1, $2, $3, $4);
									$$->arrayBase = $1->arrayBase;
									$$->ins = instCount+1;
									if(parsenum>1)
									{
										$$->addr = str_to_ch(newTemp());
										create_ins(1,$$->addr,"*",$3->addr,to_string(calc_width($$)));
									}
								}
|	ArrayAccess LSPAR Expression RSPAR	{ 
													$$ = create_node ( 5 ,"ArrayAccess", $1, $2, $3, $4); 
													$$->arrayBase = $1->arrayBase;
													$$->ins = instCount+1;
													if(parsenum>1)
													{
														string reg1 = newTemp();
														create_ins(1,reg1,"*",$3->addr,to_string(calc_width($$)));
														$$->addr = str_to_ch(newTemp());
														create_ins(1,$$->addr,"+",$1->addr,reg1);
													}
												} 
;

PostfixExpression:
	Primary	{ $$ = $1; }
|	Name	{ 
				$$ = $1; 
				ste* lookup_ste = lookup(current_ste, $1->val);
				if(lookup_ste!=NULL && parsenum==2){
					$$->addr = str_to_ch(lookup_ste->lexeme + "{" + to_string(lookup_ste->VarId)  + "}");
				}
			}
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
	LPAREN PrimitiveType Dims RPAREN UnaryExpression	{ 
															$$ = create_node ( 6 ,"CastExpression", $1, $2, $3, $4, $5); 
															string type=get_type($2)+get_type($3);
															$$->ins=instCount+1;
															$$->addr=str_to_ch(newTemp());
															create_ins(1,$$->addr,"cast_to_"+type,"",$5->addr);
														} 
|	LPAREN PrimitiveType RPAREN UnaryExpression	{ 
													$$ = create_node ( 5 ,"CastExpression", $1, $2, $3, $4); 
													$$->ins=instCount+1;
													string type=get_type($2);
													$$->addr=str_to_ch(newTemp());
													create_ins(1,$$->addr,"cast_to_"+type,"",$4->addr);
												} 
|	LPAREN Expression RPAREN UnaryExpressionNotPlusMinus	{ 
																$$ = create_node ( 5 ,"CastExpression", $1, $2, $3, $4);
																string type=handle_expression($2);
																$$->ins=instCount+1;
																$$->addr=str_to_ch(newTemp());
																create_ins(1,$$->addr,"cast_to_"+type,"",$4->addr);
															} 
|	LPAREN Name Dims RPAREN UnaryExpressionNotPlusMinus	{ 
															$$ = create_node ( 6 ,"CastExpression", $1, $2, $3, $4, $5); 
															string type=get_type($2)+get_type($3);
															$$->ins=instCount+1;
															$$->addr=str_to_ch(newTemp());
															create_ins(1,$$->addr,"cast_to_"+type,"",$5->addr);
														} 
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
															if (parsenum==2){
																string t1=handle_expression($1),t2=handle_expression($3);
																string res=typecast(t1,t2,$2->val);

																if (res!=t1)
																{
																	char* temp=$1->addr;
																	$1->addr=str_to_ch(newTemp());
																	create_ins(1,$1->addr,"cast_to_"+res,"",temp);
																}
																else if (res!=t2)
																{
																	char* temp=$3->addr;
																	$3->addr=str_to_ch(newTemp());
																	create_ins(1,$3->addr,"cast_to_"+res,"",temp);
																}
															}
															$$->ins = instCount+1;
															$$->addr = str_to_ch(newTemp());
															create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
														} 
|	AdditiveExpression MINUS MultiplicativeExpression	{
															$$ = create_node ( 3 ,$2->val, $1, $3);
															if (parsenum==2){
																string t1=handle_expression($1),t2=handle_expression($3);
																string res=typecast(t1,t2,$2->val);

																if (res!=t1)
																{
																	char* temp=$1->addr;
																	$1->addr=str_to_ch(newTemp());
																	create_ins(1,$1->addr,"cast_to_"+res,"",temp);
																}
																else if (res!=t2)
																{
																	char* temp=$3->addr;
																	$3->addr=str_to_ch(newTemp());
																	create_ins(1,$3->addr,"cast_to_"+res,"",temp);
																}
															}
															$$->ins = instCount+1;
															$$->addr = str_to_ch(newTemp());
															create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
														} 
;

ShiftExpression:
	AdditiveExpression	{ $$ = $1; }
|	ShiftExpression LEFT_SHIFT AdditiveExpression	{
														$$ = create_node ( 3 ,$2->val, $1, $3);
														if (parsenum==2){
															string t1=handle_expression($1),t2=handle_expression($3);
															string res=typecast(t1,t2,$2->val);

															if (res!=t1)
															{
																char* temp=$1->addr;
																$1->addr=str_to_ch(newTemp());
																create_ins(1,$1->addr,"cast_to_"+res,"",temp);
															}
															else if (res!=t2)
															{
																char* temp=$3->addr;
																$3->addr=str_to_ch(newTemp());
																create_ins(1,$3->addr,"cast_to_"+res,"",temp);
															}
														}
														$$->ins = instCount+1;
														$$->addr = str_to_ch(newTemp());
														create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
													} 
|	ShiftExpression RIGHT_SHIFT AdditiveExpression	{
														$$ = create_node ( 3 ,$2->val, $1, $3);
														if (parsenum==2){
															string t1=handle_expression($1),t2=handle_expression($3);
															string res=typecast(t1,t2,$2->val);

															if (res!=t1)
															{
																char* temp=$1->addr;
																$1->addr=str_to_ch(newTemp());
																create_ins(1,$1->addr,"cast_to_"+res,"",temp);
															}
															else if (res!=t2)
															{
																char* temp=$3->addr;
																$3->addr=str_to_ch(newTemp());
																create_ins(1,$3->addr,"cast_to_"+res,"",temp);
															}
														}
														$$->ins = instCount+1;
														$$->addr = str_to_ch(newTemp());
														create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
													} 
|	ShiftExpression UNSIGNED_RIGHT_SHIFT AdditiveExpression	{
																$$ = create_node ( 3 ,$2->val, $1, $3);
																if (parsenum==2){
																	string t1=handle_expression($1),t2=handle_expression($3);
																	string res=typecast(t1,t2,$2->val);

																	if (res!=t1)
																	{
																		char* temp=$1->addr;
																		$1->addr=str_to_ch(newTemp());
																		create_ins(1,$1->addr,"cast_to_"+res,"",temp);
																	}
																	else if (res!=t2)
																	{
																		char* temp=$3->addr;
																		$3->addr=str_to_ch(newTemp());
																		create_ins(1,$3->addr,"cast_to_"+res,"",temp);
																	}
																}
																$$->ins = instCount+1;
																$$->addr = str_to_ch(newTemp());
																create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
															} 
;

RelationalExpression:
	ShiftExpression	{ $$ = $1; }
|	RelationalExpression LT ShiftExpression	{
												$$ = create_node ( 3 ,$2->val, $1, $3); 
												if (parsenum==2){
													string t1=handle_expression($1),t2=handle_expression($3);
													string res=typecast(t1,t2,"-");

													if (res!=t1)
													{
														char* temp=$1->addr;
														$1->addr=str_to_ch(newTemp());
														create_ins(1,$1->addr,"cast_to_"+res,"",temp);
													}
													else if (res!=t2)
													{
														char* temp=$3->addr;
														$3->addr=str_to_ch(newTemp());
														create_ins(1,$3->addr,"cast_to_"+res,"",temp);
													}
												}
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
												if (parsenum==2){
													string t1=handle_expression($1),t2=handle_expression($3);
													string res=typecast(t1,t2,"-");

													if (res!=t1)
													{
														char* temp=$1->addr;
														$1->addr=str_to_ch(newTemp());
														create_ins(1,$1->addr,"cast_to_"+res,"",temp);
													}
													else if (res!=t2)
													{
														char* temp=$3->addr;
														$3->addr=str_to_ch(newTemp());
														create_ins(1,$3->addr,"cast_to_"+res,"",temp);
													}
												}
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
												if (parsenum==2){
													string t1=handle_expression($1),t2=handle_expression($3);
													string res=typecast(t1,t2,"-");

													if (res!=t1)
													{
														char* temp=$1->addr;
														$1->addr=str_to_ch(newTemp());
														create_ins(1,$1->addr,"cast_to_"+res,"",temp);
													}
													else if (res!=t2)
													{
														char* temp=$3->addr;
														$3->addr=str_to_ch(newTemp());
														create_ins(1,$3->addr,"cast_to_"+res,"",temp);
													}
												}
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
												if (parsenum==2){
													string t1=handle_expression($1),t2=handle_expression($3);
													string res=typecast(t1,t2,"-");

													if (res!=t1)
													{
														char* temp=$1->addr;
														$1->addr=str_to_ch(newTemp());
														create_ins(1,$1->addr,"cast_to_"+res,"",temp);
													}
													else if (res!=t2)
													{
														char* temp=$3->addr;
														$3->addr=str_to_ch(newTemp());
														create_ins(1,$3->addr,"cast_to_"+res,"",temp);
													}
												}
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
																if (parsenum==2){
																	string t1=handle_expression($1),t2=handle_expression($3);
																	string res=typecast(t1,t2,"-");

																	if (res!=t1)
																	{
																		char* temp=$1->addr;
																		$1->addr=str_to_ch(newTemp());
																		create_ins(1,$1->addr,"cast_to_"+res,"",temp);
																	}
																	else if (res!=t2)
																	{
																		char* temp=$3->addr;
																		$3->addr=str_to_ch(newTemp());
																		create_ins(1,$3->addr,"cast_to_"+res,"",temp);
																	}
																}
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
															if (parsenum==2){
																string t1=handle_expression($1),t2=handle_expression($3);
																string res=typecast(t1,t2,"-");

																if (res!=t1)
																{
																	char* temp=$1->addr;
																	$1->addr=str_to_ch(newTemp());
																	create_ins(1,$1->addr,"cast_to_"+res,"",temp);
																}
																else if (res!=t2)
																{
																	char* temp=$3->addr;
																	$3->addr=str_to_ch(newTemp());
																	create_ins(1,$3->addr,"cast_to_"+res,"",temp);
																}
															}
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
														if (parsenum==2){
															string t1=handle_expression($1),t2=handle_expression($3);
															string res=typecast(t1,t2,$2->val);

															if (res!=t1)
															{
																char* temp=$1->addr;
																$1->addr=str_to_ch(newTemp());
																create_ins(1,$1->addr,"cast_to_"+res,"",temp);
															}
															else if (res!=t2)
															{
																char* temp=$3->addr;
																$3->addr=str_to_ch(newTemp());
																create_ins(1,$3->addr,"cast_to_"+res,"",temp);
															}
														}
														$$->ins = instCount+1;
														$$->addr = str_to_ch(newTemp());
														create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
													}
;

ExclusiveOrExpression:
	AndExpression	{ $$ = $1; }
|	ExclusiveOrExpression XOR AndExpression	{
												$$ = create_node ( 3 ,$2->val, $1, $3);
												if (parsenum==2){
													string t1=handle_expression($1),t2=handle_expression($3);
													string res=typecast(t1,t2,$2->val);

													if (res!=t1)
													{
														char* temp=$1->addr;
														$1->addr=str_to_ch(newTemp());
														create_ins(1,$1->addr,"cast_to_"+res,"",temp);
													}
													else if (res!=t2)
													{
														char* temp=$3->addr;
														$3->addr=str_to_ch(newTemp());
														create_ins(1,$3->addr,"cast_to_"+res,"",temp);
													}
												}
												$$->ins = instCount+1;
												$$->addr = str_to_ch(newTemp());
												create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
											}
;

InclusiveOrExpression:
	ExclusiveOrExpression	{ $$ = $1; }
|	InclusiveOrExpression BITWISE_OR ExclusiveOrExpression	{
																$$ = create_node ( 3 ,$2->val, $1, $3);
																if (parsenum==2){
																	string t1=handle_expression($1),t2=handle_expression($3);
																	string res=typecast(t1,t2,$2->val);

																	if (res!=t1)
																	{
																		char* temp=$1->addr;
																		$1->addr=str_to_ch(newTemp());
																		create_ins(1,$1->addr,"cast_to_"+res,"",temp);
																	}
																	else if (res!=t2)
																	{
																		char* temp=$3->addr;
																		$3->addr=str_to_ch(newTemp());
																		create_ins(1,$3->addr,"cast_to_"+res,"",temp);
																	}
																}
																$$->ins = instCount+1;
																$$->addr = str_to_ch(newTemp());
																create_ins(1,$$->addr,$2->val,$1->addr,$3->addr);
															}
;

ConditionalAndExpression:
	InclusiveOrExpression	{ $$ = $1; }
|	ConditionalAndExpression AND InclusiveOrExpression	{
															$$ = create_node ( 3 ,$2->val, $1, $3);
															if (parsenum==2){
																string t1=handle_expression($1),t2=handle_expression($3);
																string res=typecast(t1,t2,$2->val);

																if (res!=t1)
																{
																	char* temp=$1->addr;
																	$1->addr=str_to_ch(newTemp());
																	create_ins(1,$1->addr,"cast_to_"+res,"",temp);
																}
																else if (res!=t2)
																{
																	char* temp=$3->addr;
																	$3->addr=str_to_ch(newTemp());
																	create_ins(1,$3->addr,"cast_to_"+res,"",temp);
																}
															}
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
															if (parsenum==2){
																string t1=handle_expression($1),t2=handle_expression($3);
																string res=typecast(t1,t2,$2->val);

																if (res!=t1)
																{
																	char* temp=$1->addr;
																	$1->addr=str_to_ch(newTemp());
																	create_ins(1,$1->addr,"cast_to_"+res,"",temp);
																}
																else if (res!=t2)
																{
																	char* temp=$3->addr;
																	$3->addr=str_to_ch(newTemp());
																	create_ins(1,$3->addr,"cast_to_"+res,"",temp);
																}
															}
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
																if (parsenum==2){

																	string toPass="";

																	if((string) $1->val =="ArrayAccess"){
																		toPass = (string) $1->arrayBase;
																		ste* lookup_ste = lookup(current_ste, toPass);
																		
																		if(lookup_ste!=NULL && lookup_ste->is_final){
																			lineno = $2->lineno	;
																			yerror("Error: Cannot assign to final variable");
																		}
																	}
																	else if((string) $1->val =="FieldAccess" || (string) $1->val =="Qualified_Name"){
																		string objName = (string) $1->children[0]->val;
																		string className = lookup(current_ste, objName)->type;
																		stme* lookup_stme = lookupFunction(classMap[className],className+"-"+(string)$1->children[2]->val);
																		if(lookup_stme!=NULL && lookup_stme->entry->is_final){
																			lineno = $2->lineno	;
																			yerror("Error: Cannot assign to final variable");
																		}
																	}
																	else{
																		toPass = (string) $1->val;
																		ste* lookup_ste = lookup(current_ste, toPass);
																		
																		if(lookup_ste!=NULL && lookup_ste->is_final){
																			lineno = $1->lineno	;
																			yerror("Error: Cannot assign to final variable");
																		}
																	}

																	string t1=handle_expression($1),t2=handle_expression($3);
																	string res=typecast(t1,t2,$2->val);

																	if (res!=t2)
																	{
																		char* temp=$3->addr;
																		$3->addr=str_to_ch(newTemp());
																		create_ins(1,$3->addr,"cast_to_"+res,"",temp);
																	}
																}
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
|	ArrayAccess	{
					$$ = $1;
					string reg1 = string($1->addr);
					$$->ins = instCount+1;
					$$->addr = str_to_ch(newTemp());
					$$->addr = str_to_ch(string($1->arrayBase)+"[ "+$1->addr+" ]");
					ste* lookup_ste = lookup(current_ste, $1->arrayBase);
					if(lookup_ste!=NULL && parsenum==2){
						$$->addr = str_to_ch(string($1->arrayBase) + "{" + to_string(lookup_ste->VarId)  + "}"+"[ "+$1->addr+" ]");
					}
					// create_ins(0,string($$->addr),"=",string($1->arrayBase)+"[ "+reg1+" ]","");
				}
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


int calc_width(NODE* node)
{
	handle_array_access(node);
	int count=0;
	NODE* node_child = node->children[0];
	string temp = node_child->type;
	while(temp.find("]")!=-1)
	{
		count++;
		int l=temp.length();
		temp = temp.substr(0,l-2);;
	}
	int width=1;

	string name = "";
	NODE* temp1 = node_child;

	while(temp1->children.size()!=0)
	{
		temp1 = temp1->children[0];
	}
	name = temp1->val;

	ste* lookup_ste = lookup(current_ste, name );
	for(int i=0;i<count-1;i++)
	{
		width*=lookup_ste->dims[lookup_ste->dims.size()-i-1];
	}
	
	width*=getOffset(temp);
	
	
	return width;
}

int fetchOffset(string className, string id){
	if(className==""){
		ste* lookup_ste=lookup(current_ste,id);
		if(lookup_ste==NULL){
			return -1;
		}

		return lookup_ste->offset;
	}
	
	ste* lookup_ste=lookup(current_ste,className);
	if(lookup_ste==NULL){
		return -1;
	}
	stme* id_class = classMap[lookup_ste->type];
	int offset = 0;

	while(id_class->next!=NULL){
		string id_name = id_class->id;
		int index = id_name.find("-");
		id_name = id_name.substr(index+1);
		if(id_name==id){
			return id_class->entry->offset;
		}
		id_class = id_class->next;
	}

	return offset;
}

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

string handle_field_access(NODE* node)
{
	NODE* left=node->children[0],*right=node->children[2];
	string left_val=left->val,right_val=right->val;
	if (left_val=="this")
	{
		stme* lookup_stme=lookupFunction(classMap[cur_class], cur_class+"-"+right->val);
		if (lookup_stme==NULL)
		{
			string e_message="Error : Field " + (string) right->val + " not declared in Class "+cur_class;
			lineno=left->lineno;
			yerror(e_message);
		}
		else
		{
			ste* new_ste = new ste;
			string type= lookup_stme->entry->type;
			current_ste->lexeme="this";
			current_ste->type=cur_class;
			current_ste->offset=offset;
			current_ste->VarId = VarId;
			current_ste->token="IDENTIFIER";
			current_ste->lineno=lineno;
			current_ste->next=new_ste;
			new_ste->prev=current_ste;
			offset += getOffset(cur_class);
			VarId++;
			funcTypeMap[cur_func]=offset;
			current_ste=new_ste;

			return type;
		}
	}
	return "int";
	/* return handle_expression(node); */
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
	if (child_val=="FieldAccess")
	{
		return handle_field_access(node);
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

ste* insert_var_id(NODE * node,string type, bool is_static, bool is_final)
{
	string var_name = node->children[0]->val;
	lineno=node->children[0]->lineno;
	ste* return_ste;
	int dim = vardim(node);
	ste* new_ste= new ste;


	if (checkRedeclaration(current_ste,var_name)==NULL || checkRedeclaration(current_ste,var_name)->class_entry!=NULL){
		current_ste->lexeme=var_name;
		current_ste->type=type;
		current_ste->offset=offset;
		current_ste->VarId = VarId;
		current_ste->is_static=is_static;
		current_ste->is_final=is_final;
		current_ste->token="IDENTIFIER";
		current_ste->lineno=lineno;
		return_ste=current_ste;
		current_ste->next=new_ste;
		new_ste->prev=current_ste;
		offset += getOffset(type);
		VarId++;
		funcTypeMap[cur_func]=offset;

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
	
	bool is_final = false;
	if(length==3){
		is_final = true;
	}
	NODE* var_dec_node=local_var_node->children[length-1];

	for (auto var_id_child : var_dec_node->children)
	{
		string var_id_child_val=var_id_child->val;
		if (var_id_child_val == "Variable_Declarator_Id")
		{
			insert_var_id(var_id_child,type,false, is_final);
		}
		else if (var_id_child_val == "=")
		{
			NODE* var_dec_id = var_id_child->children[0];
			int dim=vardim(var_dec_id);
			for (int i=0;i<dim;i++)
			{
				type+="[]";
			}
			insert_var_id(var_dec_id,type,false, is_final);

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
			offset=0;
			ste * new_ste = new ste;
			current_ste->type="branch_head";

			//save the branch header in the stack to return back to it later
			branch.push(current_ste);

			current_ste->next_scope=new_ste;
			new_ste->prev_scope=current_ste;

			// move current scope onto the new scope
			current_ste=new_ste;
			branchMethodSymtable(node->children[i]);
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
		if(forFlag>0){
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
				forFlag=1;
				searchAST(for_statement_child);
				string for_statement_child_val = for_statement_child->children[0]->val;
				if (for_statement_child_val!="{")
				{
					current_ste=branch.top();
					branch.pop();
					ste* new_ste = new ste;
					current_ste->next=new_ste;
					new_ste->prev=current_ste;
					current_ste=new_ste;
				}
				forFlag=0;
				return;
			}
			string for_statement_child_val = for_statement_child->val;
			if (for_statement_child_val == "LocalVariableDeclaration")
			{
				forFlag=1;
				searchAST(for_statement_child);
			}
			else if ( for_statement_child_val=="for" || for_statement_child_val=="(" || for_statement_child_val==")" || for_statement_child_val==";" ){
				continue;
			}
			else{
				handle_expression(for_statement_child);
			}
		}

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
		offset = 0;
		VarId = 0;
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
	else if (temp=="Class_Declaration"){
		handle_class_declaration(node);
		return; 
	}
	for(int i = 0; i < node->children.size(); i++)
	{
		searchAST(node->children[i]);
	}
}

string handle_class_declaration( NODE * node){
	for(int i=0;i<node->children.size();i++){
		string node_val = node->children[i]->val;
		if(node_val=="Class_ID"){
			string class_name = node->children[i]->children[1]->val;
			if(classMap.find(class_name)!=classMap.end()){
				lineno=node->children[i]->children[1]->lineno;
				yerror("Error: Class " + class_name + " redefined");
			}
			cur_class=class_name;
			hasConst[cur_class]=0;
			classMap[cur_class]= new stme;
		}
		else if (node_val=="Interfaces")
		{
			for (auto interface_child : node->children[i]->children[1]->children)
			{
				classMap[cur_class]->implements.push_back(interface_child->val);
			}
		}
		else
		{
			searchAST(node->children[i]);
		}
	}

	return "";
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
			vector < int > dims;
			for(auto dim_child: array_child->children){
				string dim_child_val=dim_child->val;
				if(dim_child_val=="Dim_Expr"){
					dims.push_back(atoi(dim_child->children[1]->val));
					array_type=array_type+"[]";
				}
				if (typecast(handle_expression(dim_child->children[1]),"int","+")!="int")
				{
					string error_message="Error : array index must be an integer";
					yerror(error_message);
				}
			}
			current_ste->prev->dims=dims;
			offset+=getOffset(array_type);
			funcTypeMap[cur_func]=offset;
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
	first_child->type=str_to_ch(type);
	string first_child_val=first_child->val;
	if (last_two!="[]" )
	{
		string error_message="Error : "+first_child_val+" is not an array";
		yerror(error_message);
	}
	if (typecast(handle_expression(node->children[2]),"int","+")!="int")
	{
		string error_message="Error : array index must be an integer";
		yerror(error_message);
	}

	return new_sub_type;
}

string handle_function(NODE* node){

	string node_val = node->val;
	bool non_static_call = false;
	if(node_val == "MethodInvocation"){
		string name = get_invocation_name(node);

		string class_scope;
		int dot_index=name.find(".");
		if (dot_index!=-1)
		{
			ste* lookup_ste=lookup(current_ste,name.substr(0,dot_index));
			if (lookup_ste!=NULL)
				class_scope=lookup_ste->type;
			else if (name.substr(0,dot_index)=="this")
			{
				class_scope=cur_class;
			}
			else 
			{
				string error_mesaage="Error : variable "+name.substr(0,dot_index)+" is not defined";
				yerror(error_mesaage);
			}
			name=name.substr(dot_index+1);
		}
		else
		{	
			non_static_call=true;
			class_scope=cur_class;
		}

		if (name=="println")
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

		//find name in classMap
		stme* class_head=classMap[class_scope];
		while (class_head!=NULL)
		{
			if (class_head->id==class_scope+"-"+(string)name)
			{
				string type=tableMap[class_scope+"-"+(string)name]->return_type;
				int num_params=tableMap[class_scope+"-"+(string)name]->num_params;

				if(non_static_call && !tableMap[class_scope+"-"+(string)name]->is_static && curr_static_function){
					string error_message="Error : Cannot call non-static method "+name+" from static context";
					yerror(error_message);
				}
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

							ste* entry_ste=tableMap[class_scope+"-"+(string)name]->entry;
							

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
			stme* lookup_stme = tableMap[name+"-"+name];
			if(lookup_stme!=NULL){
				int num_params=lookup_stme->num_params;
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
							string e_message= "Error : Constructor " + name + " called with wrong number of arguments ";
							yerror(e_message);
						}
						else{

							ste* entry_ste=lookup_stme->entry;
							

							for(int i=0;i<num_params;i++){
								if(types[i]!=entry_ste->type){
									string e_message= "Error : Constructor " + name + " called with wrong type of arguments ";
									yerror(e_message);
								}
								entry_ste=entry_ste->next;
							}
						}
					}

				}

				if(arg_flag==0 && num_params!=0){
					string e_message= "Error : Constructor " + name + " called with wrong number of arguments ";
					yerror(e_message);
				}
			}
			string type=name;
			return type;
		}
	}

	if(node_val=="Qualified_Name"){
		string name = get_invocation_name(node);		
		string class_scope;
		int dot_index=name.find(".");
		string first=name.substr(0,dot_index);
		string second=name.substr(dot_index+1);		 
		
		ste* lookup_ste=lookup(current_ste,name);
		if (lookup_ste!=NULL)
		{
			string type=lookup_ste->type;
			return type;
		}
		else
		{
			lookup_ste=lookup(current_ste,first);
			if (lookup_ste!=NULL)
			{
				string type=lookup_ste->type;
				if (classMap.find(type)==classMap.end())
					yerror("Error : variable "+first+" does not have the method "+second);
				stme* class_head=classMap[type];
				while (class_head!=NULL)
				{
					if (class_head->id==type+"-"+second)
					{
						string return_type=class_head->entry->type;
						return return_type;
					}
					class_head=class_head->next;
				}
				yerror("Error : variable "+first+" does not have the method "+second);
			}
			string e_message= "Error : variable " + name + " not declared before use";
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
	if (op=="=" )
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
	if (op =="-" )
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
	cur_func="field";
	int length= node->children.size();
	string type = get_type(node->children[length-3]);
	if (length==4){
		NODE* modifiers= node->children[0];
		bool is_static = false;
		bool is_final = false;
		for(auto modifier: modifiers->children){
			string modifier_val=modifier->val;
			if (modifier_val == "static"){
				is_static = true;
			}
			else if (modifier_val == "final"){
				is_final = true;
			}
		}
		NODE* var_dec_node=node->children[length-2];
		for (auto var_id_child : var_dec_node->children)
		{
			string var_id_child_val=var_id_child->val;
			if (var_id_child_val == "Variable_Declarator_Id")
			{	
				int dim=vardim(var_id_child);
				for(int i=0;i<dim;i++)
					type=type+"[]";
				ste* entry=insert_var_id(var_id_child,type, is_static, is_final);
				stme* field_entry=new stme;
				field_entry->num_params=-1;
				field_entry->entry=entry;
				field_entry->next=classMap[cur_class];
				classMap[cur_class]=field_entry;
				classMap[cur_class]->id=cur_class+"-"+(string)entry->lexeme;
				entry->class_entry=field_entry;
				
			}
			else if (var_id_child_val == "=")
			{	
				int dim=vardim(var_id_child);
				for(int i=0;i<dim;i++)
					type=type+"[]";
				NODE* var_dec_id = var_id_child->children[0];
				ste* entry=insert_var_id(var_dec_id,type, is_static, is_final);
				stme* field_entry=new stme;
				field_entry->num_params=-1;
				field_entry->entry=entry;
				field_entry->next=classMap[cur_class];
				classMap[cur_class]=field_entry;
				classMap[cur_class]->id=cur_class+"-"+(string)entry->lexeme;
				entry->class_entry=field_entry;
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
			ste* entry=insert_var_id(var_id_child,type,false, false);
			stme* field_entry=new stme;
			field_entry->num_params=-1;
			field_entry->entry=entry;
			field_entry->next=classMap[cur_class];
			classMap[cur_class]=field_entry;
			classMap[cur_class]->id=cur_class+"-"+(string)entry->lexeme;
			entry->class_entry=field_entry;
		}
		else if (var_id_child_val == "=")
		{
			NODE* var_dec_id = var_id_child->children[0];
			ste* entry=insert_var_id(var_dec_id,type,false, false);
			stme* field_entry=new stme;
			field_entry->num_params=-1;
			field_entry->entry=entry;
			field_entry->next=classMap[cur_class];
			classMap[cur_class]=field_entry;
			classMap[cur_class]->id=cur_class+"-"+(string)entry->lexeme;
			entry->class_entry=field_entry;
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
	if(parsenum==1) return;
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
				cur_func =cur_class+"-"+cur_class;
				if (lookupFunction(classMap[cur_class],cur_class+"-"+(string)identifier_node->val)!=NULL){
					lineno=identifier_node->lineno;
					string e_message= "Error: Method "+ (string) identifier_node->val+ " redeclared";
					yerror(e_message);
				}
				hasConst[cur_class]=true;
				
				string id_node_val=cur_class+"-"+(string)identifier_node->val;

				stme* table_entry=new stme;
				table_entry->entry=current_ste;
				current_ste->class_entry=table_entry;
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
	bool is_static = false;
	bool is_final = false;
	curr_static_function = false;
	for (auto node : header_node->children)
	{	
		index+=1;

		if(index==idx){
			type=get_type(node);
			continue;
		}
		string node_val=node->val;
		if(node_val=="Modifiers"){
			NODE* modifiers=node;
			for(auto modifier: modifiers->children){
				string modifier_val=modifier->val;
				if (modifier_val == "static"){
					is_static = true;
					curr_static_function = true;
				}
				if(modifier_val == "final"){
					is_final = true;
				}
			}
		}
		if(node_val == "MethodDeclarator")
		{
			NODE* identifier_node=node->children[0];
			cur_func =cur_class+"-"+(string)identifier_node->val;
			if (lookupFunction(classMap[cur_class],cur_class+"-"+(string)identifier_node->val)!=NULL){
				lineno=identifier_node->lineno;
				string e_message= "Error: Method "+ (string) identifier_node->val+ " redeclared";
				yerror(e_message);
			}

			// add map entry for the function
			string id_node_val=cur_class+"-"+(string)identifier_node->val;
			
			stme* table_entry=new stme;
			table_entry->entry=current_ste;
			table_entry->return_type=type;
			table_entry->num_params=0;
			table_entry->is_static=is_static;
			table_entry->is_final=is_final;
			current_ste->class_entry = table_entry;
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

	bool is_final=false;
	if(length==3){
		is_final=true;
	}

	//store the name of the parameter
	NODE* var_node=param_node->children[length-1];
	int dim=vardim(var_node);
	for (int i=0;i<dim;i++)
	{
		type+="[]";
	}
	insert_var_id(var_node,type, false, is_final);
}

void classoffset(){
	for (auto class_pair : classMap)
	{
		if (class_pair.first=="") continue;
		int class_offset=0;
		stme* class_member= class_pair.second;
		stack<stme*> class_stack;
		while(class_member!=NULL)
		{
			class_stack.push(class_member);
			class_member= class_member->next;
		}
		while(class_stack.size()!=0)
		{
			class_member=class_stack.top();
			class_stack.pop();
			if (class_member->num_params==-1)
			{
				class_member->entry->offset=class_offset;
				class_offset+= getOffset(class_member->entry->type);
			}
		}
		classTypeMap[class_pair.first]=class_offset;
	}
}

void check_interface()
{
	for (auto class_ = classMap.begin();class_!=classMap.end(); class_++)
	{
		if(class_->first=="") continue;
		stme* class_mem=class_->second;
		while(class_mem->next!=NULL) class_mem=class_mem->next;
		if (class_mem->implements.size()==0) continue;
		for (auto implement_class : class_mem->implements)
		{
			if (classMap.find(implement_class)==classMap.end())
			{
				lineno=class_mem->entry->lineno;
				string e_message= "Error: Interface "+ implement_class+ " not found";
				yerror(e_message);
			}
			stme* interface_mem=classMap[implement_class];
			while(interface_mem->next!=NULL) {
				string interface_mem_name= interface_mem->id.substr(implement_class.length()+1);
				stme* match=lookupFunction(classMap[class_->first],class_->first+"-"+(string)interface_mem_name);
				if (match==NULL){
					lineno=interface_mem->entry->lineno;
					string e_message="";
					if (interface_mem->num_params==-1) 
						e_message= "Error: Method "+ (string) interface_mem->id+ " from "+implement_class+" not found in function";
					else
						e_message= "Error: Field "+ (string) interface_mem->id+ " from "+implement_class+ "  not found in function definition";
					yerror(e_message);
				}

				ste* match_entry=match->entry;
				ste* member_entry=interface_mem->entry;
				for (int i=0;i<interface_mem->num_params;i++)
				{
					if (match_entry->type!=member_entry->type)
					{
						lineno=match_entry->lineno;
						string e_message= "Error: Method "+match->id+" has "+ (string) match_entry->lexeme+ " contradicting type from interface "+implement_class;
						yerror(e_message);
					}
					match_entry=match_entry->next;
					member_entry=member_entry->next;
				}
				interface_mem=interface_mem->next;
			}
		} 
	}
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
	for(auto it = classMap.begin(); it != classMap.end(); it++){
		vector < stme* > v;
		if(it->first=="") continue;
		stme * curr = it->second;
		string folderName = "Class-" + it->first;
		string filePath = "./output/" + folderName;
		mkdir(filePath.c_str(), 0777);
		while(curr->next!=NULL){
			if(curr->num_params==-1){
				v.push_back(curr);
				curr = curr->next;
				continue;
			}
			string filename = filePath + "/" + curr->id + ".csv";
			fout.open(filename);
			
			fout<<"Function name:,Return Type, Number of Parameters, IsStatic, Is_Final ,Lexeme,Type,Line Number,Token,Offset,Is_Static,Is_Final,Id"<<endl;

			fout<<curr->id<<","<<curr->return_type<<","<<curr->num_params<<","<<curr->is_static<<","<<curr->is_final<<",,,,,,"<<endl;
			ste* current_ste = curr->entry;
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

				fout<<",,,,,"<<current_ste->lexeme<<","<<current_ste->type<<","<<current_ste->lineno<<","<<current_ste->token<<","<<current_ste->offset<<","<<current_ste->is_static<<","<<current_ste->is_final<<","<<current_ste->VarId<<endl;
				current_ste = current_ste->next;
			}
			
			fout.close();

			curr = curr->next;
		}

		if(v.size()==0) continue;
		string filename = filePath + "/FieldDeclarations"+ ".csv";
		fout.open(filename);

		fout<<"Field name:,Return Type, Offset, Is_static, Is_final"<<endl;
		for(auto it = v.begin(); it != v.end(); it++){
			fout<<(*it)->id<<","<<(*it)->entry->type<<","<<(*it)->entry->offset<<","<<(*it)->entry->is_static<<","<<(*it)->entry->is_final<<endl;
		}
		fout.close();
	}
}

vector<int> makelist(int i){
	if(parsenum==1) return vector<int>();
	return vector<int>{i};
}

vector<int> merge(vector<int> p1, vector<int> p2){
	if(parsenum==1) return vector<int>();
	vector<int> merged;
    merged.reserve(p1.size() + p2.size());
    merged.insert(merged.end(), p1.begin(), p1.end());
    merged.insert(merged.end(), p2.begin(), p2.end());
	return merged;
}

void backpatch(vector<int>p, int i)
{
	if(parsenum==1) return;
	for(int j=0;j<p.size();j++){
		// instructions[abs(p[j])-1].push_back(to_string(i));
		if(instructions[abs(p[j])-1].size()>0)
			instructions[abs(p[j])-1].back()=to_string(i);
	}
}

string newTemp(){
	return "t"+to_string(tempCount++);
}

int main(int argc, char* argv[]){

	ios_base::sync_with_stdio(false);
    cin.tie(NULL);
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
	parsenum=1;
	yyparse();

	/*--------------------------------------------------------------*/

	// Create DOT file
    MakeDOTFile(start_node);
    fout << "}";


	/*--------------------------------------------------------------*/

	start_ste->type="global_head";
	current_ste= new ste;
	start_ste->next=current_ste;
	current_ste->prev=start_ste;
	searchAST(start_node);
	check_interface();
	classoffset();
	printToCSV();
	current_ste=start_ste->next;
	/* print_ste(start_ste); */
	fp = fopen(("../tests/"+input_file).c_str(), "r");
	if(!fp){
		cout << "Error opening file: " << input_file << endl;
		return 0;
	}
	yyin = fp;
	instCount=0;
	tempCount=0;
	parsenum=2;
	yylineno=1;

	yyparse();

	/*--------------------------------------------------------------*/

	// Create 3AC file
    MakeIRFile();

	/*--------------------------------------------------------------*/

	// Close the input file
	fclose(fp);
	// Close the output file
    fout.close();
	// Close the output file
    code_out.close();

    return 0;
}