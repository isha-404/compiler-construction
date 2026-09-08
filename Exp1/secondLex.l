%{
#include <stdio.h>
int count = 0;
%}

%%
"sec-B" { count++; printf("found sec-B "); }
.|\n {}
%%

int main(){
printf("Enter a Statement: ");
yylex();
printf("\nOccurence: %d\n", count);
return 0;
}

int yywrap(){
return 1;
}
