%{
// analisador sintático para uma calculadora
// com suporte a definição de variáveis  
#include <iostream>
#include <string.h>
#include <unordered_map>
#include<math.h>
#include <sstream>

using std::string;
using std::unordered_map;
using std::cout;
using std:: stringstream;

// protótipos das funções especiais
int yylex(void);
int yyparse(void);
void yyerror(const char *);

//variáveis auxiliares
string frase;
stringstream textNum;

// tabela de símbolos 
unordered_map<string,double> variables; 
%}

%union {
	double num;
	char id[16];
	char txt[255];
}

%token <id> ID
%token <num> NUM
%token <txt> TEXTO

%token MAIORIGUAL
%token MENORIGUAL
%token IGUAL
%token DIF
%token RAIZ
%token POW
%token AP
%token FP
%token IF
%token VIRGULA
%token PRINT


%type <num> expr
%type <txt> texto
%type <num> if
%type <num> impressao
%type <num> imprIF

%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%%

math: math calc 
	| calc 
	;

calc: ID '=' expr 			{ variables[$1] = $3; } 	
	| expr					//{ cout << "= " << $1 << "\n"; }	
		       
	; 

expr: expr '+' expr			{ $$ = $1 + $3; }
	| expr '-' expr   		{ $$ = $1 - $3; }
	| expr '*' expr			{ $$ = $1 * $3; }
	

	| expr '>' expr	{ $$ = $1 > $3; }	
	| expr '<' expr	{ $$ = $1 < $3; }
	
	| expr MAIORIGUAL expr { $$ = $1 >= $3; }	
	| expr MENORIGUAL expr { $$ = $1 <= $3; }
	| expr IGUAL expr { $$ = $1 == $3; }
	| expr DIF expr { $$ = $1 != $3; }
  
	| expr '/' expr	
	{
		if ($3 == 0)
			yyerror("divisão por zero");
		else
			$$ = $1 / $3; 
	}
	
	| AP expr FP			{ $$ = $2; }
	| '-' expr %prec UMINUS { $$ = - $2; }

	| RAIZ AP expr FP {$$ = sqrt($3);}
	| POW AP expr VIRGULA expr FP {$$ = pow($3, $5);}

		
	| ID					{ $$ = variables[$1]; }
	| NUM
	

    |if {frase = "\0"; cout<<" "; }
	|PRINT AP impressao FP {cout<<" ";}

	
		
	;
	
texto: TEXTO 
	
	;

//Produções para o IF


//ifs de impressao

if: IF AP expr FP PRINT AP imprIF FP { //impressão de textos
		if($3){
			
			if(frase.length() > 0){
				cout << frase ;
				
			}else{
				cout << $7 ;
			}
			
			}
	}

	//If com atribuição
	|IF AP expr FP ID '=' expr{
		if($3) { variables[$5] = $7; } 

	}

	;

	//AJEITAR QDO USAR O BOLEANO PRA REGULAR AS IMPRESSOES
	//Produções para Impressões com uso de IFS
	imprIF: expr {     //impressão de uma expressão
		   $$ = $1; 
		   
		} 

    |TEXTO   { //impressão de textos
		string s = yylval.txt;		
	    s.erase(0, 1); s.erase(s.size()-1, 1);  //Apaga o primeiro e ultimo caracteres de s (são as "")
	    frase = frase + s ;
		
	}
	
	|expr '=' expr  { $1 = $3; $$ = $1; } //atribuição dentro da impressão

	| imprIF VIRGULA expr{ //impressão de texto seguido de variável

		     textNum.str("");
			 textNum << $3;	
			 frase = frase +" " +textNum.str();	 
			
		 $$ = $1; 
		 }

	| imprIF VIRGULA texto  { //impressão variável seguido de texto
		 string s = $3;
		 s.erase(0, 1); s.erase(s.size()-1, 1);  //Apaga o primeiro e ultimo caracteres de s (são as "")

		 frase =  frase + s ; 
		
		 }	 
	;


	//Produções para impressão Normal
	
impressao: expr { cout << $1 ; } //impressão de uma expressão

    |TEXTO   { //impressão de textos
		string s = yylval.txt;
		
	    s.erase(0, 1); s.erase(s.size()-1, 1);  //Apaga o primeiro e ultimo caracteres de s (são as "")

	    cout << s ;
	}
	
	|expr '=' expr  { $1 = $3; cout << $1 << "\n"; } //atribuição dentro da impressão

	| impressao VIRGULA expr{ //impressão de texto seguido de variável
		  cout <<   $3 ; 
		 }

	| impressao VIRGULA texto  { //impressão variável seguido de texto
		 string s = $3;
		 s.erase(0, 1); s.erase(s.size()-1, 1);  //Apaga o primeiro e ultimo caracteres de s (são as "")

		 cout <<  s ; 
		 }	 
	;

	


%%

extern FILE * yyin;  // definido pelo analisador léxico

int main(int argc, char ** argv)
{
	// se foi passado um nome de arquivo
	if (argc > 1)
	{
		FILE * file;
		file = fopen(argv[1], "r");
		if (!file)
		{
			cout << "Arquivo " << argv[1] << " não encontrado!\n";
			exit(1);
		}
		
		// entrada ajustada para ler do arquivo
		yyin = file;
	}
	yyparse();
}

void yyerror(const char * s)
{
	extern int yylineno;    // definido no analisador léxico
	extern char * yytext;   // definido no analisador léxico 
    cout << "Erro (" << s << "): símbolo \"" << yytext << "\" (linha " << yylineno << ")\n";
}
