%{
#include <stdio.h>

int comment_count = 0;
int keyword_count = 0;
int identifier_count =0;
int word_count = 0;
int line_count = 0;
int space_count = 0;
%}


KEYWORD "int"|"float"|"char"|"double"|"void"|"if"|"else"|"for"
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*
WORD [a-zA-z0-9]+

%%

"//".* { comment_count++; }

{KEYWORD} { keyword_count++; word_count++; }
{IDENTIFIER} { identifier_count++; word_count++; }
{WORD} { word_count++; }

" " { space_count++; }
"\t" { space_count++; }
"\n" {line_count++; }

. {}

%%
int main(){
printf("Paste the code and press Ctrl+D");
yylex();

printf("Number of Comments: %d\n", comment_count);
printf("Number of Keywords: %d\n", keyword_count);
printf("Number of Identifiers: %d\n", identifier_count);
printf("Number of Words: %d\n", word_count);
printf("Number of Lines: %d\n", line_count);
printf("Number of Spaces/Tabs: %d\n", space_count);

return 0;
}

int yywrap(){
return 1;
}
