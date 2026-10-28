%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
int yyerror(char *s);

int temp = 1;
%}

%union {
    char *str;
}

%token <str> ID NUM
%type <str> E

%left '+' '-'
%left '*' '/'

%%

input:
    E '\n'
    {
        printf("Result = %s\n", $1);
    }
    ;

E:
    E '+' E
    {
        char t[10];
        sprintf(t, "t%d", temp++);
        printf("%s = %s + %s\n", t, $1, $3);
        $$ = strdup(t);
    }
    |
    E '*' E
    {
        char t[10];
        sprintf(t, "t%d", temp++);
        printf("%s = %s * %s\n", t, $1, $3);
        $$ = strdup(t);
    }
    |
    E '-' E
    {
        char t[10];
        sprintf(t, "t%d", temp++);
        printf("%s = %s - %s\n", t, $1, $3);
        $$ = strdup(t);
    }
    |
    E '/' E
    {
        char t[10];
        sprintf(t, "t%d", temp++);
        printf("%s = %s / %s\n", t, $1, $3);
        $$ = strdup(t);
    }
    |
    '(' E ')'
    {
        $$ = $2;
    }
    |
    ID
    {
        $$ = $1;
    }
    |
    NUM
    {
        $$ = $1;
    }
    ;

%%

int main()
{
    printf("Enter expression: ");
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    printf("Invalid expression\n");
    return 0;
}

