package main

import (
	"fmt"
)

func main() {
	var casos, valor int
	tamanhoMaximo := 40

	vetorDeResultados := make([]int, tamanhoMaximo)

	inicializarVetor(vetorDeResultados, tamanhoMaximo)

	fmt.Scan(&casos)

	for i := 0; i < casos; i++ {
		fmt.Scan(&valor)
		fmt.Println(valor, fibonacci(valor, vetorDeResultados))
	}

}

func inicializarVetor(vetor []int, tamanho int) {
	for i := 0; i < tamanho; i++ {
		vetor[i] = -1
	}
}

func fibonacci(valor int, resultados []int) int {

	if resultados[valor] != -1 {
		return resultados[valor]
	}

	if valor == 1 || valor == 0 {
		return valor
	}

	resultados[valor] = fibonacci(valor-1, resultados) + fibonacci(valor-2, resultados)
	return resultados[valor]
}
