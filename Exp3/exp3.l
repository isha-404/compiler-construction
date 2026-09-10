%{
#include <stdio.h>

int wordCount = 0;
int numCount = 0;
%}

DIGIT   [0-9]
EXP     [eE][+-]?{DIGIT}+
NUMBER  ({DIGIT}+(\.{DIGIT}*)?|\.{DIGIT}+){EXP}?

%%

[Aa][A-Za-z]*        { wordCount++; }

{NUMBER}             { numCount++; }

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter the input (Press Ctrl+D to stop):\n");
    yylex();

    printf("\nWords starting with A/a = %d\n", wordCount);
    printf("Valid numbers = %d\n", numCount);

    return 0;
}
