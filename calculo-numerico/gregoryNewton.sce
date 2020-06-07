function pontoY = gregoryNewton(eixoX, eixoY, pontoX)

    tamanho = length(eixoX);

    vetor = eixoY;

    for i = 1: tamanho -1

        for j = tamanho : -1 : i+1

            vetor(j) = vetor(j) - vetor(j-1);
        
        end
    
    end

    u = ((pontoX - eixoX(1))/(eixoX(2) - x(1)))
    pontoY = vetor(tamanho);
    for i = tamanho-1 : -1: 1

        pontoY = pontoY * (u - i + 1)/ i + vetor(i);
    
    end


endfunction

x = 1 : 2 : 20;
y = x.**3 + x - 1;

resposta = gregoryNewton(x, y, 4);
disp(resposta);

x = 0 : 1 : 5;
y = [1 2 21 76 185 366];
resposta = gregoryNewton(x, y, 3.2);
disp(resposta);

x = [1.1 1.3 1.4 1.6 1.7 1.9];
y = [0.9048 0.7408 0.6703 0.5488 0.4966 0.4066];
resposta = gregoryNewton(x, y, 1.33);
disp(resposta);