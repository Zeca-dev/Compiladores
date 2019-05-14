%{ 
// analisador léxico para uma calculadora 
// com suporte a definição de variáveis 

// PARA A DEFINIÇÃO DE TEXTOS, UTILIZEI O EXEMPLO DO SITE COM A GRAMATICA DE C++
//POIS ESTAVA TENDO PROBLEMAS PRA IMPRIMIR COM VÁRIOS PARAMETROS JUSTAMENTE PORQUÊ
//NÃO RECONHECIA AS VIRGULAS COMO SEPARADOR E NEM AS VARIAVEIS  COMO VARIAVEIS
// VISTO QUE  PROCESSAVA COMO TOKEN TEXTO TUDO QUE ESTIVESSE ENTRE ASPAS ""

#include <string>
#include <iostream>
#include "parser.h"

using std::cout;

 

%}

%option yylineno
%option noyywrap

digito	[0-9]
letra_	[a-zA-Z_]
pontdig {digito}*"."?{digito}+
digpont {digito}+"."

numero  {pontdig}|{digpont}
id		{letra_}({letra_}|{digito})*

MaiorIgual ">="
MenorIgual "<="
Igual "=="
Dif "!="

raiz "sqrt"
potencia "pow"

ap "("
fp ")"
virgula ","

if "if"
print "print"

texto \"(\\.|[^\\"])*\"

%%

[\t \n]+		; // ignora espaço em branco  
{raiz} return RAIZ;
{potencia} return POW;
{if} return IF;
{print} return PRINT;


{numero}    yylval.num = atof(yytext); return NUM;
{id}		strcpy(yylval.id, yytext); return ID; 

{MaiorIgual} return MAIORIGUAL;
{MenorIgual} return MENORIGUAL;
{Igual} return IGUAL;
{Dif} return DIF;
{ap} return AP;
{fp} return FP;



{texto} strcpy(yylval.txt, yytext); return TEXTO;


{virgula} return VIRGULA;


.|\n		return yytext[0];

%%
