package main

import (
	"fmt"
)

func main() {
	var casos, valor int
	tamanhoMaximo := 40

	vetorDeResultados := make([]int, tamanhoMaximo)
	quantidadeChamadas := make([]int, tamanhoMaximo)

	inicializarVetor(vetorDeResultados, tamanhoMaximo)

	fmt.Scan(&casos)

	for i := 0; i < casos; i++ {
		fmt.Scan(&valor)
		resposta := fibonacci(valor, vetorDeResultados, quantidadeChamadas)
		fmt.Printf("fib(%v) = %v calls = %v\n", valor, quantidadeChamadas[valor], resposta)
	}

}

func inicializarVetor(vetor []int, tamanho int) {
	for i := 0; i < tamanho; i++ {
		vetor[i] = -1
	}
}

func ver(vetor []int, tamanho int) {
	for i := 0; i < tamanho; i++ {
		fmt.Print(vetor[i], ", ")
	}
	fmt.Print("\n")
}

func fibonacci(valor int, resultados, chamadas []int) int {

	if resultados[valor] != -1 {
		return resultados[valor]
	}

	if valor == 1 || valor == 0 {
		chamadas[valor] = 0
		return valor
	}

	resultados[valor] = fibonacci(valor-1, resultados, chamadas) + fibonacci(valor-2, resultados, chamadas)
	chamadas[valor] = chamadas[valor-2] + chamadas[valor-1] + 2

	return resultados[valor]
}
