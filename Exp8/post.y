%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(char *s);

/* Function to calculate power */
int power(int base, int exponent)
{
int result = 1;

for (int i = 0; i < exponent; i++)
{
    result = result * base;
}

return result;


}
%}

%token NUMBER

%%

stmt:
stmt expr '\n'
{
printf("Result: %d\n", $2);
}
|
;

expr:
NUMBER
{
$$ = $1;
}

| expr expr '+'
  {
      $$ = $1 + $2;
  }

| expr expr '-'
  {
      $$ = $1 - $2;
  }

| expr expr '*'
  {
      $$ = $1 * $2;
  }

| expr expr '/'
  {
      if ($2 == 0)
      {
          yyerror("Division by zero");
          $$ = 0;
      }
      else
      {
          $$ = $1 / $2;
      }
  }

| expr expr '^'
  {
      $$ = power($1, $2);
  }
;


%%

void yyerror(char *s)
{
printf("Error: %s\n", s);
}

int main()
{
yyparse();
return 0;
}
