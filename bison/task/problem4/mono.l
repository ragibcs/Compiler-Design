%{
#include "p4.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%
"print"        { return PRINT; }
"subtract"     { return SUBTRACT; }
"from"         { return FROM; }
"set"          { return SET; }
"to"           { return TO; }
"add"          { return ADD; }
"and"          { return AND; }
"if"           { return IF; }
"then"         { return THEN; }
"exit"         { return EXIT; }

">"            { return GT; }

[0-9]+         { yylval.ival = atoi(yytext); return NUMBER; }

[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.str = strdup(yytext);
    return ID;
}

\"[^\"]*\"   {
    int len = yyleng - 2;
    char *s = (char *)malloc(len + 1);
    strncpy(s, yytext + 1, len);
    s[len] = '\0';
    yylval.str = s;
    return WORD;
}

\n             { return '\n'; }
[ \t\r]+       { /* skip */ }

.              { /* ignore */ }

%%

int yywrap(void) { return 1; }
