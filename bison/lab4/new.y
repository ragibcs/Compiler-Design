%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}
%union{
    char* str;
}
%token <str> ID
%token INT FLOAT DOUBLE STRING

%%
program:
       elements
       ;

elements:
       elements element
       | element
       ;
element:
       INT ID  { printf("Found int variable: %s \n",$2); free($2); }

%%