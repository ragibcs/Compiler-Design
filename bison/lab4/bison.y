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

%token <str>  ID
%token INT FLOAT DOUBLE STRING

%%
program:
        elements
        ;
elements:
        elements element 
        |  element
          ;
element:
        INT ID     { printf("Found int variable: %s\n",$2); free($2); }
          | FLOAT ID { printf("Found float variable: %s\n",$2); free($2); }
          | DOUBLE ID { printf("Found double variable: %s\n",$2); free($2); }
          | STRING ID { printf("Found string variable: %s\n",$2); free($2); }

        ;

%%
void yyerror(const char *s){
    printf("Syntax Error: %s \n",s);

}
int main()
{
    return yyparse();
    return 0;
}