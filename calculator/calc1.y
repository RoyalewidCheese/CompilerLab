%{
#include <stdio.h>
%}

%token NUM
%left '+' '-'
%left '*' '/'
%left '(' ')'
%%

calc:  expr '\n' { printf("Result: %d\n", $$); return 0; }
    ;

expr:
    NUM                { $$ = $1; }
    | expr '+' expr    { $$ = $1 + $3; }
    | expr '-' expr    { $$ = $1 - $3; }
    | expr '*' expr    { $$ = $1 * $3; }
    | expr '/' expr    { 
        if ($3 != 0)
            $$ = $1 / $3;
        else {
            yyerror("Division by zero");
            YYABORT;
        }
    }
    | '(' expr ')'      { $$ = $2; }
    ;

%%

int main() {
    printf("\nEnter Expression: ");
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    printf("Error: %s\n", s);
    return 0;
}


