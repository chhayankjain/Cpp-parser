%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    #include "parser.tab.h"
    #include "symTable.h"
    char dtype[20];
%}

%option yylineno

%%
("/*"(.|\n)*"*/") {;}
("//"(.)*) {;}

[0-9]+ {printf("%s\n",yytext);return NUMBER;}

"int"|"char"|"void"|"string" {printf("%s\n",yytext);strcpy(dtype,yytext);return DTYPE;}

"cout" {printf("%s\n",yytext);return COUT;}

"cin" {printf("%s\n",yytext);return CIN;}

\"(.)*\" {printf("%s\n",yytext);return LITERAL;}

"main" {printf("%s\n",yytext);return MAIN;}

"class" {printf("%s\n",yytext);strcpy(dtype,yytext);return CLASS;}

"struct" {printf("%s\n",yytext);strcpy(dtype,yytext);return STRUCT;}

"private"|"public"|"protected" {printf("%s\n",yytext); return SPECIFIER;}

"while" {printf("%s\n",yytext); return WHILE;}

"for" {printf("%s\n",yytext); return FOR;}

"if" {printf("%s\n",yytext); return IF;}

"else if" {printf("%s\n",yytext); return ELIF;}

"else" {printf("%s\n",yytext); return ELSE;}

"switch" {printf("%s\n",yytext); return SWITCH;}

"case" {printf("%s\n",yytext); return CASE;}

"break" {printf("%s\n",yytext);return BREAK;}

"default" {printf("%s\n",yytext); return DEFAULT;}

"return" {printf("%s\n",yytext);return RETURN;}

[a-zA-Z][a-zA-Z0-9_]* {printf("%s \n",yytext);
	int index = searchTable(yytext);
	if(index==-1) {
		TOKEN* tk = newToken();
		index = hashFunction();
		tk->index = index;
		strcpy(tk->name,yytext);
		strcpy(tk->datatype,dtype);
		if(strcmp(dtype,"class")==0 || strcmp(dtype,"struct")==0) {
			tk->scope=0;
		} else {
			tk->scope=1;
		}
		SYMTABLE[index]=tk;
	}
	return ID;
}

"," {printf("%s\n",yytext); return COMMA;}
" "|\t|\n {;}
. {return yytext[0];}
%%

int yywrap() {
    return 1;
}

