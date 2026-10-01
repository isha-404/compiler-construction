%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int yylex(void);
void yyerror(const char *s);
%}

%union { double val; }

%token <val> NUMBER
%token INC DEC
%type <val> expr

%left '+' '-'
%left '*' '/' '%'
%right '^'
%nonassoc UMINUS
%nonassoc INC DEC

%%

input:
/* empty */
| input line;

line:
'\n'
| expr '\n' { printf("Result = %.2f\n", $1); }
| error '\n'     { yyerrok; printf("Syntax Error! Re-enter expression:\n"); };

expr:
expr '+' expr   { $$ = $1 + $3; }
| expr '-' expr   { $$ = $1 - $3; }
| expr '*' expr   { $$ = $1 * $3; }
| expr '/' expr

{                    

if ($3 == 0) {
printf("Error: Division by zero!\n");
$$ = 0;
} else {
$$ = $1 / $3;}

}

| expr '%' expr { $$ = (int)$1 % (int)$3; }
| expr '^' expr { $$ = pow($1, $3); }
| expr INC { $$ = $1 + 1; }
| INC expr { $$ = $2 + 1; }
| expr DEC { $$ = $1 - 1; }
| DEC expr { $$ = $2 - 1; }
| '-' expr %prec UMINUS { $$ = -$2; }
| '(' expr ')'   { $$ = $2; }
| NUMBER { $$ = $1; };


%%

void yyerror(const char *s) {
}

int main(void) {
    printf("=== Desk Calculator with Error Recovery ===\n");
    printf("Operators: +, -, *, /, %%, ^, ++, --, (), unary -\n");
    printf("Enter expression (Press Ctrl+D to exit):\n");
    yyparse();
    return 0;
}
