// ALGORITMO PARA INTERPOLAÇÃO

function pontoY = lagrange(vetorX, vetorY, pontoX)

    pontoY = 0;
    tamanhoVetorX = length(vetorX);
    for i = 1: tamanhoVetorX
        
        produtorio = 1;
        for j = 1: tamanhoVetorX

            if i ~= j then
                produtorio = produtorio * ((pontoX - vetorX(j)) / (vetorX(i) - vetorX(j)));
            end
            
        end

        pontoY = pontoY + produtorio * vetorY(i);
    
    end

endfunction