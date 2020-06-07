function solucao = jacobi(matriz, vetorTermosIndependentes, solucaoAproximada, tolerancia, interacoes)

    [linhas colunas] = size(matriz);
    solucao = zeros(linhas, 1);

    for iteracao = 1 : iteracoes
        
        for linha = 1 : linhas
            
            soma = 0;
            for coluna = [1 : linha-1, linha+1 : colunas]   // acessa de 1 .. coluna, menos quando linha == coluna
                
                soma = soma + matriz(linha, coluna) * solucaoAproximada(coluna);
            end
            solucao(linha) = (vetorTermosIndependentes(linha) - soma) / matriz(linha, linha);

        end

        if (norm(solucao - solucaoAproximada), 'inf') < tolerancia then
            return solucao;

        end
        disp(solucao);
        solucaoAproximada = solucao;

    end

    printf("codigo nao convergiu!");
endfunction