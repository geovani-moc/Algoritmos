// Geovani Pereira dos Santo - IFNMG - 2019

function [x, y, yDerivado] = rungeKutta(funcao, funcaoDerivada, limiteInferior, limiteSuperior, passo, valorInicial, valorInicialDerivada)

    x(1) = limiteInferior;
    y(1) = valorInicial;
    yDerivado(1) = valorInicialDerivada;

    quantidadePassos = (limiteSuperior-limiteInferior)/passo;

    for i = 1 : quantidadePassos
    
        x(i+1) = x(i)+passo;

        //calculando  k1
        k11 = funcao(x(i) , y(i), yDerivado(i));
        k12 = funcaoDerivada(x(i) , y(i), yDerivado(i));
        //calculando  k2
        k21 = funcao((x(i)+passo/2) , (y(i)+ passo*k11/2), (yDerivado(i) + passo* k12/2));
        k22 = funcaoDerivada((x(i)+passo/2) , (y(i)+ passo*k11/2), (yDerivado(i) + passo* k12/2));
        //calculando  k3
        k31 = funcao((x(i)+passo/2) , (y(i)+ passo*k21/2), (yDerivado(i) + passo* k22/2));
        k32 = funcaoDerivada((x(i)+passo/2) , (y(i)+ passo*k21/2), (yDerivado(i) + passo* k22/2));
        //calculando  k4
        k41 =  funcao((x(i)+passo) , (y(i)+ passo*k31), (yDerivado(i) + passo* k32));
        k42 =  funcaoDerivada((x(i)+passo) , (y(i)+ passo*k31), (yDerivado(i) + passo* k32));
        //Avaliando y e yDerivado:
        y(i+1) = y(i) + (passo/6)*(k11+ 2*k21 + 2*k31 + k41);
        yDerivado(i+1) = yDerivado(i) + (passo/6)*(k12+ 2*k22 + 2*k32 + k42);        
    end

endfunction



// exemplo execução

function y1d = f1(x, y1, y2);
    y1d = 1.5*y1 - 0.5*y1*y2;
endfunction

function y2d = f2(x, y1, y2);
    y2d = -0.5*y2 + y1*y2;
endfunction
a = 0;// limite inferior
b = 20;//limite superios
h = 0.05;//passo
y10 = 2;//valor ini da funcao
y20 = 2;// valor inicial da derivada da funcao

[x, y, yDerivado] = rungeKutta(f1, f2, a, b, h, y10, y20);

disp(['x'; 'y'; 'y derivado']');
disp([x'; y'; yDerivado']');
