%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%

[0-9]+(\.[0-9]+)? { yylval.val = atof(yytext); return NUMBER; }
"++" { return INC; }
"--" { return DEC; }
[ \t] { }
\n { return '\n'; }
. { return yytext[0]; }

%%

int yywrap(void) {
    return 1;
}
