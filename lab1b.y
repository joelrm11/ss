%{
	#include <stdio.h>
	#include <stdlib.h>
	int yyerror();
	int yylex();
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
Start : expr '\n' { printf("Result is = %d \n",$$); exit(0); }

expr	: expr '+' expr { $$ = $1+$3; }
	  | expr '-' expr { $$ = $1-$3; }
	  | '-' expr { $$ = -$2; } 
	  | expr '*' expr { $$ = $1*$3; }
	  | expr '/' expr { if($3 == 0){
				printf("Divide by zero\n");
				exit(0);
			    }
			    else
				$$ = $1/$3; 
			  }
	  | '(' expr ')' { $$ = $2; }
	  | NUM { $$ = $1; }
	 ;
%%
void main()
{
	printf("Enter the expression : ");
	yyparse();
}
int yyerror()
{
	printf("Invalid\n");
	exit(0);
}
