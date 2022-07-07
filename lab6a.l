%{
	#include <stdio.h>
	int s=0,m=0,f=0;
%}

%%

"//".* {if(f==0) s++;}
"/*" {f=1;}
"*/" { if(f==1) {m++; f=0;} }
. {if(f==0) ECHO;}

%%

int main()
{
	yyin = fopen("file.txt","r");
	yyout = fopen("file2.txt","w");
	yylex();
	printf("Single line = %d \nMultiple line = %d\n",s,m);
	return 0;
}
int yywrap()
{
	return 1;
}
