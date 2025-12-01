%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}

%union {
    char *str;
    int num;
}

%token <num> NUM
%token <str> STR
%token PRINT SET TO ADD AND EXIT
%left  '+'  '-'
%left '*'  '/'


%%

lines:
     lines line
    | line
    ;
line:
    PRINT STR                {  printf("Printing.... %s\n", $2); free($2); }
    | SET NUM TO STR             {  printf("%s = %d\n", $4, $2); free($4); }
    | ADD NUM AND NUM             {  printf("sum=%d\n", $2 + $4); }
    | EXIT                        { printf("Exit.......\n"); exit(0); }
    ;

%%

void yyerror(const char *s){
        printf("Error: %s\n" ,s);
}

int main(){
    printf("Mini Command Line Interpreter: \n");
    return yyparse();
}