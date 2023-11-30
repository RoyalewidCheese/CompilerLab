%{
#include "y.tab.h"
%}

%%

[ \t]       ;  // Ignore whitespace
\n          return '\n';

[0-9]+      {
                yylval = atoi(yytext);
                return NUM;
            }

[-+*/()]    return yytext[0];

.           {
                fprintf(stderr, "Invalid character: %s\n", yytext);
            }

%%


