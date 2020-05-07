package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	var palavra, resposta, auxiliar string
	letraCodificada := []string{"@", "&", "!", "*", "#"}
	letraDecodificada := []string{"a", "e", "i", "o", "u"}

	scanner := bufio.NewScanner(os.Stdin)

	for scanner.Scan() {

		palavra = scanner.Text()
		tamanho := len(palavra)
		resposta = ""

		if tamanho < 1 {
			break
		}

		for i := 0; i < tamanho; i++ {

			auxiliar = string(palavra[i])
			for j := 0; j < 5; j++ {

				if auxiliar == letraCodificada[j] {
					auxiliar = letraDecodificada[j]
					break
				}
			}
			resposta += auxiliar
		}
		fmt.Println(resposta)
	}
}
