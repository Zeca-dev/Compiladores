%{
// Este programa reconhece os arquivos html e suas tags
#include <iostream>
#include <fstream>

using namespace std;
using std::string;


//Variáveis
int qtLinhas = 0; //Conta quantidade de linhas
int qtTags = 0; //conta quantidade de pares de TAGS
int qtChar = 0; //Conta a quantidade de caracteres
int qtTABs = 0; //Conta tabs para indentação

char **fileList; //Variáveis para arquivos
unsigned currentFile = 0;
unsigned nFiles;

ifstream fin; 


//Funções

void imprime(string s);

%}

%option noyywrap
%s ESTILO


br <br>
img <img.+>

delim [ \t]
brancos {delim}+

comentario <!--.*-->
DOCTYPE <!.*>
letra [A-Za-z]
digito [0-9]



AbreTAG <{letra}+({digito}?({delim}+)?({letra}+)?(=)?(\")?({letra}?+{digito}+?[^<]+?)?(\")?)*>
FechaTAG <"/"{letra}+{digito}?>

texto [^\n<>]+



%%

"<style>" imprime((string)YYText());   BEGIN ESTILO; //Para não imprimir o css
  
<ESTILO>[^\n<>]+ ; //Consome todos os caracteres dentro da tag style

"<\/style>" imprime((string)YYText());  qtTags++; BEGIN INITIAL;

{comentario} ; //Ignora comentários

{DOCTYPE} ;//Ignora especificações de documento html

{brancos} ;//Ignora espaços e tabs


{br} {
	imprime((string)YYText()); qtTags++; //Conta como par de tags
}

{img} {
	imprime((string)YYText()); qtTags++; //Conta como par de tags
}

{AbreTAG} { //Tudo que estiver entre <> sem ser a barra /, ou seja abertura de uma TAG
	
	imprime((string)YYText());
	qtTABs++; //incrementa tabs para indentação
	
}	

{FechaTAG}	{ //Tudo que estiver entre <> e começa com a barra /, ou seja, o fechammento de uma TAG

	qtTABs--; //decrementa tabs para indentação
	imprime((string)YYText());

	qtTags++; //conta par de TAG
	
}




"\n" { //conta linhas, imprime o tamanho do texto entre a tag e zera o tamTexto
	qtLinhas++; //Incrementa a quantidade de linhas	
}

{texto} {
		if(YYLeng() > 0){ //Se tiver detectado texto entre as tags imprime seu tamanho
			for(int i=0; i < qtTABs; i++){ //imprime tabs				
				cout<<"|\t";				
			}
			
			cout<<"+--Texto["<<YYLeng()<<"]\n";
			
		qtChar = qtChar + YYLeng(); //Conta total de caracteres
		
	} 

}



%%


void imprime(string s){
	for(int i=0; i < qtTABs; i++){ //imprime tabs
		cout<<"|\t"; 
	}
	cout<<"+--" +s+ "\n"; //imprime a tag encontrada

	
}


int main(int argc, char ** argv)
{
	yyFlexLexer lexer;

	fileList = argv+1;  // salta nome do programa
    nFiles = argc-1;	// desconsidera nome do programa

    // apenas um arquivo para processar
	if (argc == 2) 
    {
		/*
		 * o caso de um arquivo único é tratado de forma diferente
	     * do caso de múltiplos aquivos porque para apenas um arquivo
		 * não precisamos mostrar uma linha de "totais"
		 */
		fin.open(fileList[0]);
		if (!fin.is_open()) 
       	{
			cout << "Arquivo " << fileList[0] << " não pode ser aberto!";
			exit(EXIT_FAILURE);
		}
		else
		{
			// altera entrada para arquivo
			lexer.switch_streams(&fin);
		}
	}

	//yyFlexLexer lexer;
	lexer.yylex();

	//impressões
	
	cout<<"\n\n";
	cout<<"Linhas "<<qtLinhas<<"\n";
	cout<<"TAGS "<<qtTags<<"\n";
	cout<<"caracteres "<<qtChar<<"\n";
	
	
	
}