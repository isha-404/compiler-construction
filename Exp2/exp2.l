%{
#include <stdio.h>

int comments_count = 0;
int keyword_count = 0;
int identifier_count = 0;
int word_count = 0;
int line_count = 0;
int space_count = 0;
%}

KEYWORD "int"|"float"|"char"|"void"|"if"|"else"
IDENTIFIER [a-zA-Z][a-zA-Z0-9]*
WORD [a-zA-Z0-9]+

%%

"//".*                          { comments_count++; }
"/*"([^*]|\*+[^*/])*\*+"/"     { comments_count++; }

{KEYWORD}                       { keyword_count++; }
{IDENTIFIER}                    { identifier_count++; }
{WORD}                          { word_count++; }

" "                             { space_count++; }
\n                              { line_count++; }
\t                              { space_count++; }

.                               { }

%%

int main()
{
    yylex();

    printf("Comments   : %d\n", comments_count);
    printf("Keywords   : %d\n", keyword_count);
    printf("Identifiers: %d\n", identifier_count);
    printf("Words      : %d\n", word_count);
    printf("Lines      : %d\n", line_count);
    printf("Spaces     : %d\n", space_count);

    return 0;
}

int yywrap()
{
    return 1;
}

