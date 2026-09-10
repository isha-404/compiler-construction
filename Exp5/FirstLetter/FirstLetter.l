%{
#include <stdio.h>

int first = 1;

char changeCase(char c)
{
    if (c >= 'a' && c <= 'z')
        return c - 'a' + 'A';

    if (c >= 'A' && c <= 'Z')
        return c - 'A' + 'a';

    return c;
}
%}

%%
[a-zA-Z] {
    if (first)
    {
        putchar(changeCase(yytext[0]));
        first = 0;
    }
    else
    {
        putchar(yytext[0]);
    }
}

. {
    putchar(yytext[0]);
}
%%

int main()
{
    printf("Enter a String: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}

