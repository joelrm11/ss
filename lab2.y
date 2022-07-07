%{
	#include <stdio.h>
	#include <stdlib.h>
	int yyerror();
	int yylex();
%}
%token A B
%%
Start : S '\n' { printf("Valid Expression\n"); exit(0); }
S	: n B
n	: A n
	  |
	  ;
%%
void main()
{
	printf("Enter the input \n");
	yyparse();
}
int yyerror()
{
	printf("Invalid\n");
	exit(0);
}
