function matrizResultado = trocarLinhas(matriz, linha1, linha2)
  
    matrizResultado = matriz;
    matrizResultado(linha1, :) = matriz(linha2, :);
    matrizResultado(linha2, :) = matriz(linha1, :);

endfunction

function posicaoMaiorPivo = maiorPivo(matriz, pivo)
    
    [quantidadeLinhas quantidadeColunas] = size(matriz);
    posicaoMaiorPivo = pivo;
    
    for linha = pivo : quantidadeLinhas
        
        if abs(matriz(posicaoMaiorPivo, pivo)) < abs(matriz(linha, pivo))
            posicaoMaiorPivo = linha;
        end
    
    end
endfunction


function [matriz, vetorIndependente, solucaoSistema] = eliminacaoGaussPivotamento(matriz, vetorIndependente)
    
    [quantidadeLinhas quantidadeColunas] = size(matriz);
    solucaoSistema = zeros(quantidadeLinhas, 1);

    for linhaPivo = 1 : quantidadeLinhas-1

        posicaoMaiorPivo = maiorPivo(matriz, linhaPivo);
        
        matriz = trocarLinhas(matriz, linhaPivo, posicaoMaiorPivo);
        vetorIndependente = trocarLinhas(vetorIndependente, linhaPivo, posicaoMaiorPivo);
        
        for linha = (linhaPivo+1) : quantidadeLinhas

            multiplicador = matriz(linha, linhaPivo)/matriz(linhaPivo, linhaPivo);
            matriz(linha, linhaPivo) = 0.0;

            for coluna = (linhaPivo+1) : quantidadeLinhas
                
                matriz(linha, coluna) = matriz(linha, coluna) - multiplicador * matriz(linhaPivo, coluna);
            end
            vetorIndependente(linha) = vetorIndependente(linha) - multiplicador * vetorIndependente(linhaPivo);
        
        end
    
    end
    
    //Solução do sistema

    solucaoSistema(quantidadeLinhas) = vetorIndependente(quantidadeLinhas)/matriz(quantidadeLinhas, quantidadeLinhas);

    for linha = (quantidadeLinhas-1) : -1 : 1

        somatorio = 0;
        for coluna = (linha+1) : quantidadeLinhas

            somatorio = somatorio + matriz(linha, coluna) * solucaoSistema(coluna);
        end
    
        solucaoSistema(linha) = (vetorIndependente(linha)-somatorio) / matriz(linha, linha);
    end
    
endfunction
