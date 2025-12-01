# command line for bison
```
bison -d bison.y
flex lexer.l
gcc -o app bison.tab.c lex.yy.c
./app
```