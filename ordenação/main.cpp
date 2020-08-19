#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void insertionSort(int *vetor, int inico, int fim);
void merge(int *vetor, int inicio, int meio, int fim);
void timSort(int *vetor, int tamanho, int run);
void imprimir(int *vetor, int tamanho);
int menor(int a, int b);
int *criarVetorAleatorio(int tamanho);

int main(int argc, char const *argv[])
{
    int run = 32;
    int tamanho = 50 * 1000 * 1000;
    clock_t tempoInicial, tempoFinal;
    double tempoTotal;

    int *vetor = criarVetorAleatorio(tamanho);

    tempoInicial = clock();
    timSort(vetor, tamanho, run);
    tempoFinal = clock();

    tempoTotal = (double)(tempoFinal - tempoInicial) / CLOCKS_PER_SEC;
    printf("%lf, %i\n", tempoTotal, tamanho);

    //imprimir(vetor, tamanho);
}

void insertionSort(int *vetor, int inicio, int fim)
{
    for (int i = inicio; i < fim; i++)
    {
        int temporario = vetor[i];
        int j = i - 1;

        while (j >= inicio && vetor[j] > temporario)
        {
            vetor[j + 1] = vetor[j];
            j--;
        }

        vetor[j + 1] = temporario;
    }
}

void merge(int *vetor, int inicio, int meio, int fim)
{
    int tamanho1 = meio - inicio + 1;
    int tamanho2 = fim - meio;
    int *vetorInicial = (int *)malloc(sizeof(int) * tamanho1);
    int *vetorFinal = (int *)malloc(sizeof(int) * tamanho2);

    for (int i = 0; i < tamanho1; ++i)
        vetorInicial[i] = vetor[inicio + i];
    for (int i = 0; i < tamanho2; ++i)
        vetorFinal[i] = vetor[meio + 1 + i];

    int i = 0;
    int j = 0;
    int k = inicio;

    while (i < tamanho1 && j < tamanho2)
    {
        if (vetorInicial[i] <= vetorFinal[j])
        {
            vetor[k] = vetorInicial[i];
            ++i;
        }
        else
        {
            vetor[k] = vetorFinal[j];
            ++j;
        }
        ++k;
    }

    while (i < tamanho1)
    {
        vetor[k] = vetorInicial[i];
        ++i;
        ++k;
    }
    while (j < tamanho2)
    {
        vetor[k] = vetorFinal[j];
        ++j;
        ++k;
    }

    free(vetorInicial);
    free(vetorFinal);
}

void timSort(int *vetor, int tamanho, int run)
{
    for (int i = 0; i < tamanho; i += run)
    {
        insertionSort(vetor, i, menor((i + run - 1), tamanho));
    }

    for (int i = run; i < tamanho; i = 2 * i)
    {
        for (int inicio = 0; inicio < tamanho; inicio += 2 * i)
        {
            int fim = menor((inicio + 2 * i - 1), (tamanho - 1));
            int meio = (inicio + fim) / 2;
            merge(vetor, inicio, meio, fim);
        }
    }
}

void imprimir(int *vetor, int tamanho)
{
    for (int i = 0; i < tamanho; i++)
    {
        printf("[%d] ", vetor[i]);
    }
    printf("\n");
}

int menor(int a, int b) { return a < b ? a : b; }

int *criarVetorAleatorio(int tamanho)
{
    srand(time(NULL));
    int valor = tamanho * 2;
    int *vetor = (int *)malloc(sizeof(int) * tamanho);
    for (int i = 0; i < tamanho; ++i)
    {
        vetor[i] = rand() % (valor);
    }
    return vetor;
}