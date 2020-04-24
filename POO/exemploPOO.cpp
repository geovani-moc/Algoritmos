#include <iostream>
// 	PROGRAMADOR: GEOVANI PEREIRA DOS SANTOS
// 	EXEMPLO DE POO EM C++, POLIMORFISMO, CLASSES, HERANCA

using namespace std;
// inicio questao 1
class Animal
{
private:
    string nome;
    int idade;
public:
    Animal(){}
    ~Animal(){}
    virtual void emitirSom(){}
    virtual void movimento(){}
};

class Cachorro:Animal
{
public:
    Cachorro(){}
    void emitirSom()
    {
        cout << "Som de cachooroooooo ain ain ain rau" << endl;
    }
    void movimento()
    {
        cout << "Correr" << endl;
    }
};

class Cavalo:Animal
{
public:
    Cavalo(){}
    ~Cavalo(){}
    void emitirSom()
    {
        cout << "som de cavalo" << endl;
    }
    void movimento()
    {
        cout << "Correr" << endl;
    }
};

class Preguica:Animal
{
public:
    Preguica(){}
    ~Preguica(){}
    void emitirSom()
    {
        cout << "Som de preguica, meu som heuhuehueh " << endl;
    }
    void movimento()
    {
        cout << "Subir em arvore" << endl;
    }
};
// fim questao 1

// faz parte da quetao 3 inicio
class Veterinario
{
public:
    Veterinario(){}
    ~Veterinario(){}
    void examinar(Animal* animal)
    {
        animal->emitirSom();
    }
};
// faz parte da quetao 3 fim

// faz parte da quetao 4 inicio
class Zoologico
{
private:
    Animal* jaula[10];
public:
    Zoologico(){}
    ~Zoologico(){}
    void baguncinha()
    {
        for (int i = 0; i < 10; i++)
        {
            jaula[i]->movimento();
        }
        
    }
    void adicionarAnimaisNaJaula(Animal* animal, int posicao)
    {
        jaula[posicao] = animal;
    }
};
// faz parte da quetao 4 fim

int main()
{
    // inicio questao 2
    Cavalo cavalo;
    Preguica preguica;
    Cachorro cao;

    cavalo.emitirSom();
    cavalo.movimento();

    cao.emitirSom();
    cao.movimento();

    preguica.movimento();
    preguica.emitirSom();
    // fim questao 2

    // inicio questao 3
    Veterinario veterinario;
    Animal* animalCachorro = (Animal*)&cao;
    Animal* animalCavalo = (Animal*) &cavalo;
    Animal* animalPreguica = (Animal*) &preguica;

    veterinario.examinar(animalCachorro);
    veterinario.examinar(animalCavalo);
    veterinario.examinar(animalPreguica);
    // fim questao 3

    // inicio questao 4
    Zoologico zoologico;
    Animal* animais[10];
    animais[0] = (Animal*)&cao;
    animais[1] = (Animal*) &cavalo;
    animais[2] = (Animal*) &preguica;
    animais[3] = (Animal*)&cao;
    animais[4] = (Animal*) &cavalo;
    animais[5] = (Animal*) &preguica;
    animais[6] = (Animal*)&cao;
    animais[7] = (Animal*) &cavalo;
    animais[8] = (Animal*) &preguica;
    animais[9] = (Animal*)&cao;

    for (int i = 0; i < 10; i++)
    {
        zoologico.adicionarAnimaisNaJaula(animais[i],i);
    }
    
    zoologico.baguncinha();
    // fim questao 4

    return 0;
}
