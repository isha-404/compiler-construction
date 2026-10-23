%{
#include <stdio.h>
#include <stdlib.h>
int yyerror(const char *s);
int yylex(void);
%}

%token TYPE ID

%%
stmt: TYPE L ';';

L: ID ',' L
| ID
;

%%

int yyerror(const char *s){
printf("Invalid\n");
exit(0);
}
int main(){
printf("Enter Statement: ");
yyparse();
printf("Valid\n");
return 0;
}
