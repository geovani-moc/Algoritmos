function matrizInversa = inversa(matriz)

    [quantidadeLinhas quantidadeColunas] = size(matriz);
    matrizInversa = zeros(quantidadeLinhas, quantidadeColunas);

    [l,u] = lu(matriz);
    identidade  = eye(quantidadeLinhas, quantidadeColunas);
    
    for coluna = 1: quantidadeColunas
        y = l \ identidade(:, coluna);
        resultadoColuna = u \ y;
        matrizInversa(:,coluna) = resultadoColuna;
    end

    //disp(matriz*matrizInversa);

endfunction