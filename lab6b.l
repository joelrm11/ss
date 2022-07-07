%{
	#include "y.tab.h"
%}

%%
"if"|"else"|"while"|"for"|"int"|"float"|"printf"|"scanf"|"switch"|"case"|"break"|"continue"|"exit"|"include"|"stdio.h"|"%d"|"main"|"void" { printf("Keyword %s\n",yytext); return KEY; }
[a-zA-Z_]+[a-zA-Z0-9_]* { printf("Identifier %s\n",yytext); return ID; }
[+|*|-|/|=|<|>]|"<="|">="|"!=" { printf("Operator %s\n",yytext); return OP; }
. ;
%%
