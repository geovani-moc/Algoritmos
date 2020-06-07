clc; clear;

function tolerancia = naTolerancia(valorAtual, valorAnterior)

    tolerancia = abs(valorAtual - valorAnterior) / valorAtual;
endfunction

function valor = iteracao(valorAnterior, fatorRaiz, numero)

    valor = (1/fatorRaiz) * (((fatorRaiz-1)*valorAnterior) + (numero/(valorAnterior**(fatorRaiz-1))))
endfunction

function valorAtual = raiz(fatorRaiz, numero, tolerancia)
    
    valorAnterior = numero;
    valorAtual = iteracao(valorAnterior, fatorRaiz, numero);

    while naTolerancia(valorAtual, valorAnterior) > tolerancia then
        valorAnterior = valorAtual;
        valorAtual = iteracao(valorAnterior, fatorRaiz, numero);
    end
endfunction

fatorRaiz = 5;
numero = 2;
tolerancia = 10**(-3);
resposta = raiz(fatorRaiz, numero, tolerancia);
disp(resposta);