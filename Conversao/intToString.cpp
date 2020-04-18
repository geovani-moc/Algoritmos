#include <iostream>
#include <sstream>

using namespace std;

int main()
{
	string NomeDoFilme = "Rambo";
	int Versao = 4;

	/* Converte inteiro em string */
	std::stringstream Resultado;
	Resultado << Versao;

	/* Une as duas strings, formando uma so */
	NomeDoFilme = NomeDoFilme + " " + Resultado.str();

	/* Exibi o resultado */
	cout << NomeDoFilme << endl;
}
