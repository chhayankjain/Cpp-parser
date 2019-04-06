%{
    #include <stdio.h>
    #include <stdlib.h>
    extern FILE *yyin;
    int yyerror();
    int yylex();

    void printSymbolTable();
    int yylineno;
%}

%token STRUCT ID CLASS SPECIFIER MAIN DTYPE RETURN CIN COUT NUMBER IF ELIF ELSE WHILE FOR LITERAL BREAK DEFAULT COMMA SWITCH CASE
CLASSNAME STRUCTNAME

%%

p_prime: program {printf("SUCCESS\n"); printSymbolTable(); exit(0);}
program: elements mainFunction;
elements: structs elements| functions_or_declarations elements| classes elements | ; 

structs: STRUCT ID '{' declarations_only '}' ';';

classes: CLASS ID '{' SPECIFIER ':' class_body '}' ';'; 

class_body: functions_or_declarations class_body | ;

functions_or_declarations: DTYPE ID next;

next: functions | declarations | ;


functions: '(' parameter_list ')' '{' declarations_only statement_list '}';

parameter_list: DTYPE ID id_prime | ;
id_prime: COMMA parameter_list| '[' NUMBER ']' id_prime | ;

mainFunction: MAIN '(' ')' '{' declarations_only statement_list '}';

declarations: identifier_list ';'| ';';

declarations_only: DTYPE identifier_list ';' declarations_only | ;

identifier_list: ID id1;
id1: COMMA identifier_list |'[' NUMBER ']' id1| ;


statement_list: statement statement_list| ;
statement: assign_stat_or_function_call ';'| decision_stat | 
looping_stat| return_stat| input_stat | output_stat| switch_stat;

assign_stat_or_function_call: ID assign_function_prime;

assign_function_prime: function_call|assign_stat;

function_call: '(' argument_list ')' | '.' ID f_prime ;
f_prime: '.' f_prime| function_call
argument_list: identifier_list| ;

assign_stat:  '=' expression | '.' ID a_prime
a_prime: '.' a_prime | assign_stat


return_stat : RETURN factor ';' ;

input_stat:CIN '>' '>' ID input_prime ';' ;
input_prime : '>' '>' ID input_prime| ;

output_stat: COUT '<' '<' LITERAL output_prime ';' | COUT '<' '<' NUMBER output_prime ';' | COUT '<' '<' ID output_prime ';' ; 

output_prime: '<' '<' LITERAL output_prime|'<' '<' ID output_prime|'<' '<' NUMBER output_prime| ;

assign_stat_only:  ID assign_stat_prime;
assign_stat_prime: '=' expression | '.' assign_stat_only;

expression: simple_expression eprime;

eprime: relop simple_expression| ;
simple_expression: term seprime;
seprime: addop term seprime| ;
term: factor tprime;
tprime: mulop factor tprime| ;
factor: ID|NUMBER;


decision_stat: IF '(' expression ')' '{' statement_list '}' dprime;
dprime: ELIF '(' expression ')' '{' statement_list '}' dprime | dp_prime ;
dp_prime: ELSE '{' statement_list '}' | ;

switch_stat: SWITCH '(' ID ')' '{' case_stat '}';
case_stat: CASE NUMBER ':' statement_list break_stat case_stat | default | ;
break_stat: BREAK ';' | ;
default: DEFAULT ':' statement_list

looping_stat: WHILE '(' expression ')' '{' statement_list '}'| FOR '(' assign_stat_only ';' expression ';' assign_stat_only ')' '{' statement_list '}';

relop: '>'|'<'|'<' '='|'>' '=' | '!' '=';
addop: '+'|'-';
mulop: '*' | '/' | '%';

%%

int yyerror(char *msg) {
	printf("\n\nSyntax Error -");
    printf("Invalid Expression at line %d\n",yylineno);
    exit(0);
}

void main() {
    yyin = fopen("input.c","r");
    yyparse();
}