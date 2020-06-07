function divisao = dividir(eixoX, eixoY)

    tamanho = length(eixoX);

    divisao = eixoY;

    for i = 2: tamanho

        for j = 1: i-1

            divisao(i) = (divisao(j) - divisao(i)) / (eixoX(j) - eixoX(i));
        
        end
    
    end

endfunction

function pontoY = newton(eixoX, eixoY, pontoX)

    divisao = dividir(eixoX, eixoY);
    tamanho = length(divisao);

    pontoY = divisao(tamanho);

    for i = tamanho-1: -1: 1

        pontoY = pontoY * (pontoX - eixoX(i)) + divisao(i);
    
    end


endfunction

x = 1 : 2 : 20;
y = x.**3 + x - 1;

resposta = newton(x, y, 4);
disp(resposta);

x = 0 : 1 : 5;
y = [1 2 21 76 185 366];
resposta = newton(x, y, 3.2);
disp(resposta);