package main

import (
	"fmt"
)

func main() {
	var valor int
	tamanhoVetor := 10

	vetor := make([]int, tamanhoVetor)

	for i := 0; i < tamanhoVetor; i++ {
		vetor[i] = i + 1
	}

	fmt.Scan(&valor)

	resultado := buscaBinaria(vetor, 0, tamanhoVetor-1, valor)

	if resultado != -1 {
		fmt.Print("O numero ", valor, " esta na posicao(0 ate ", tamanhoVetor-1, "): ", resultado, "\n")
	} else {
		fmt.Print(valor, " nao esta no vetor.\n")
	}
}

func buscaBinaria(vetor []int, inicio int, fim int, valor int) int {

	if inicio > fim {
		fmt.Print(inicio, fim, "\n")
		return -1
	}

	meio := int((fim + inicio) / 2)

	if valor == vetor[meio] {
		return meio
	}

	if valor > vetor[meio] {
		return buscaBinaria(vetor, meio+1, fim, valor)
	}

	return buscaBinaria(vetor, inicio, meio-1, valor)
}
