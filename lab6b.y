%{
	#include <stdio.h>
	#include <stdlib.h>
	int yyerror();
	int yylex();
	extern FILE *yyin;
	int id=0,op=0,key=0;
%}
%token ID OP KEY
%%
Start : S { printf("Valid Expression\n"); }
S     : ID S { id++; }
       |OP S { op++; }
       |KEY S { key++; }
       |ID { id++; }
       |OP { op++; }
       |KEY { key++; }
%%

void main()
{
	yyin = fopen("file2.txt","r");
	yyparse();
	printf("Count of id=%d op=%d key=%d\n",id,op,key);
	exit(0); 
}

int yyerror()
{
	printf("Invalid\n");
	exit(0);
}
