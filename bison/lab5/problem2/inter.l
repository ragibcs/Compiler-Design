%{
#include "inter.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%

"print"   {  return PRINT; }
"set"     {  return SET; }
"to"      { return TO; }
"add"      { return ADD; }
"and"      { return AND; }
"exit"      { return EXIT; }
[a-zA-Z_]+    { yylval.str=strdup(yytext); return STR; }
[0-9]+  {  yylval.num=atoi(yytext); return NUM; }
[ \t\n]+   {   }
.        {  return yytext[0]; }

%%


int yywrap(){
     return 1;
}