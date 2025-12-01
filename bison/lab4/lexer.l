%{
#include "bison.tab.h"
#include <string.h>
%}

%%
"int"     { return INT; }
"float"   { return FLOAT; }
"double"  { return DOUBLE; }
"string"  { return STRING; }
[a-zA-Z_][a-zA-Z0-9_]*   { yylval.str=strdup(yytext); return ID; }
[ \n\t]     {    }
.            { return yytext[0]; }
%%

int yywrap(){

    return 1;
}