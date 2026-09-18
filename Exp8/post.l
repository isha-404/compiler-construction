%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%

[0-9]+ {
yylval = atoi(yytext);
return NUMBER;
}

[+*/^-] {
return yytext[0];
}

[ \t] {
/* Ignore spaces and tabs */
}

\n {
return '\n';
}

. {
printf("Invalid character\n");
}

%%

int yywrap()
{
return 1;
}
