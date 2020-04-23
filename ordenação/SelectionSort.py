
def selectionSort(vetor):
    try:
        if len(vetor) == 0:
            return []
        tamanho = len(vetor)
        menor = 0
        aux = 0

        for i in range(tamanho):
            menor = i
            for j in range(i+1, tamanho):
                if(vetor[j] < vetor[menor]):
                    menor = j
            aux = vetor[menor]
            vetor[menor] = vetor[i]
            vetor[i] = aux
        return vetor
        
    except ValueError:
        pass

vetor = [2,54,23,123,53,5352,23,43,43]
selectionSort(vetor)
print(vetor)
