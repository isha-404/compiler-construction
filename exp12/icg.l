%{
#include "y.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%
[0-9]+       { yylval.str = strdup(yytext); return NUM; }
[a-zA-Z]+    { yylval.str = strdup(yytext); return ID; }
[ \t]        { /* Ignore spaces and tabs */ }
\n           { return '\n'; }
[-+*/()]     { return yytext[0]; }
.            { return yytext[0]; }
%%

int yywrap()
{
    return 1;
}

