%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
void yyerror(const char *s);


typedef struct {
    char name[50];
    int  value;
} var_t;

var_t vars[100];
int var_count = 0;

int get_var(const char *name) {
    for (int i = 0; i < var_count; i++) {
        if (strcmp(vars[i].name, name) == 0)
            return vars[i].value;
    }
    return 0;
}

void set_var(const char *name, int value) {
    for (int i = 0; i < var_count; i++) {
        if (strcmp(vars[i].name, name) == 0) {
            vars[i].value = value;
            return;
        }
    }
    strcpy(vars[var_count].name, name);
    vars[var_count].value = value;
    var_count++;
}
%}

%union {
    int ival;
    char *str;
}

%token PRINT SUBTRACT FROM SET TO ADD AND IF THEN EXIT
%token GT
%token <ival> NUMBER
%token <str> ID
%token <str> WORD

%%

program :
      | program line
      ;

line  :
        command '\n'
      | '\n'
      ;

command :
        PRINT WORD {
            printf("%s\n", $2);
            free($2);
        }
      | SUBTRACT NUMBER FROM NUMBER {
            printf("%d\n", $4 - $2);
        }
      | ADD NUMBER AND NUMBER {
            printf("%d\n", $2 + $4);
        }
      | SET ID TO NUMBER {
            set_var($2, $4);
            printf("Set %s = %d\n", $2, $4);
            free($2);
        }
      | IF ID GT NUMBER THEN PRINT WORD {
            int v = get_var($2);
            if (v > $4) {
                printf("%s\n", $7);
            }
            free($2);
            free($7);
        }
      | EXIT {
            printf("Exiting...\n");
            YYACCEPT; 
        }
      ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter commands (exit to quit):\n");
    yyparse();
    return 0;
}
