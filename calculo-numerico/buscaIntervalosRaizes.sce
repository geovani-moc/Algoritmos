// Algoritmo para achar intervalo que contenham raizess
// referencia: aula 19-10-07
function [intervalosRaizes] = buscaIntervalos(inicio, fim, quantidadeIntervalos, funcao)

    intervalos = linspace(inicio, fim, quantidadeIntervalos);
    imagens = funcao(intervalos);

    contador = 0;
    intervalosRaizes = [];

    for indice = 1 : length(intervalos) - 1

        if sign(imagens(indice)) ~= sign(imagens(indice+1)) then
        
            contador = contador +1;

            intervalosRaizes(contador, 1) = intervalos(indice);
            intervalosRaizes(contador, 2) = intervalos(indice+1);
        end
    
    end
endfunction

function y = fun(x)
    y = sin(10 *x) +  cos(3*x)
endfunction

disp(buscaIntervalos(3,6,50,fun));