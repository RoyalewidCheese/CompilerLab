/*Write a LEX program to recognize the strings defined over Σ = {a, b} those contains equal
number of ab and ba.*/

%{
	#include<stdio.h>
%}

%%
((ba)*a*(ab)*\(ab)*b*(ba)*)* printf("%s is Accepted\n", yytext);
(.)* printf("%s is not Accepted\n", yytext);
%%


int yywrap(){return(1);}

void main()
{
	printf("Enter a string : ");
	yylex();
}
