%{
#include <stdio.h>
#include <stdlib.h>
int yyerror(char*s);
int yylex();
%}

%token NUM
%token ID

%%
E:E'+'T|E'-'T|T;
T:T'*'F|T'/'F|F;
F:'('E')'|NUM|ID;
%%

int yyerror(char*s){
printf("Invalid expression\n");
exit(0);
}

int main(){
printf("Enter an Expression: ");
yyparse();
printf("Valid Expresion\n");
return 0;
}
