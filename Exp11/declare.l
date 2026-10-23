%{
#include "y.tab.h"
%}

%%
"int"|"double"|"char" {return TYPE;}
[A-Za-z_][A-Za-z0-9_]* {return ID;}
"," {return ',';}
";" {return ';';}
[ \t\n]+ {}
. {return yytext[0];}
%%

int yywrap(){
return 1;
}
