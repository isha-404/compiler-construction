%{
#include <stdio.h>

int hexCharToValue(char ch)
{
    if (ch >= '0' && ch <= '9')
        return ch - '0';

    if (ch >= 'A' && ch <= 'F')
        return ch - 'A' + 10;

    if (ch >= 'a' && ch <= 'f')
        return ch - 'a' + 10;

    return -1;
}

int hexToDecimal(char str[])
{
    int num = 0;
    int i = 0;
    int value;

    while (str[i] != '\0')
    {
        value = hexCharToValue(str[i]);

        if (value == -1)
            return -1;

        num = num * 16 + value;
        i++;
    }

    return num;
}
%}

%%
[0-9A-Fa-f]+ {
    int num = hexToDecimal(yytext);

    if (num != -1)
    {
        printf("Hexadecimal: %s\n", yytext);
        printf("Decimal: %d\n", num);
    }
}

.|\n {
}
%%

int main()
{
    printf("Enter a hexadecimal number: \n");
    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}

