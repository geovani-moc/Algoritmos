function solucaoSistema = refinamento(matriz, solucaoSistema, vetorIndependente, tolerancia, iteracoes)
    
    residuo = vetorIndependente -  (matriz * solucaoSistema);
    erro = norm(residuo, 'inf');

    tolerancia = (0.5 * 10 ** (2 - tolerancia));    // algarismos de significancia

    [l, u] = lu(matriz);
   
    for iteracao = 1: iteracoes
        
        if erro < tolerancia then
            break;
        end
        
        y = l\residuo;
        fatorCorrecao = u \ y;
        solucaoSistema = solucaoSistema + fatorCorrecao;

        residuo = vetorIndependente -  (matriz * solucaoSistema);
        erro = norm(residuo, 'inf');

    end

endfunction

function [matriz, vetorIndependente, solucaoSistema] = eliminacaoGauss(matriz, vetorIndependente, tolerancia, iteracoes)
    
    // parametros default
    if nargin == 3 then
        iteracoes = 100;
    end
    if nargin == 2 then
        tolerancia = 4;
    end

    vetorIndependenteOriginal = vetorIndependente;
    matrizOriginal = matriz;

    [quantidadeLinhas quantidadeColunas] = size(matriz);
    solucaoSistema = zeros(quantidadeLinhas, 1);

    for linhaPivo = 1 : quantidadeLinhas-1
        
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

    //refinameto da solução
    solucaoSistema = refinamento(matrizOriginal, solucaoSistema, vetorIndependenteOriginal, tolerancia, iteracoes);

endfunction
