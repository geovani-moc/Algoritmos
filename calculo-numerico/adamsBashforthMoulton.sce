/*
    PROGRAMADOR: GEOVANI PEREIRA DOS SANTO
    IFNMG - MONTES CLAROS - 2019
    CALCULO NUMERICO - ALGORITMO DE ADAMS-BASHFORTH-MOULTON 
    PARA PVI
*/
clc; clear;
//funcao
function yd = rb(x, y)
    yd = x - 2*y + 1;
endfunction

//metodo de Dormand-Prince para a solucao de PVI
function [vetX, vetY, EG] = dopri(a, b, m, y0, rb)

    //parametros do metodo 
    a21 = 1/5;
    a31 = 3/40; a32 = 9/40;
    a41 = 44/45; a42 = -56/15; a43 = 32/9;
    a51 = 19372/6561; a52 = -25360/2187; a53 = 64448/6561; a54 = -212/729;
    a61 = 9017/3168; a62 = -355/33; a63 = 46732/5247; a64 = 49/176; a65 = -5103/18656;
    a71 = 35/384; a73 = 500/1113; a74 = 125/192; a75 = -2187/6784; a76 = 11/84;

    c2 = 1/5; c3 = 3/10; c4 = 4/5; c5 = 8/9; c6 = 1; c7 =1;
    e1 = 71/57600; e3 = -71/16695; e4 = 71/1920; e5 = -17253/339200;
    e6 = 22/525; e7 = -1/40;

    h = (b-a)/m;
    xt = a;
    yt = y0;
    vetX(1) = xt;
    vetY(1) = yt;
    EG(1) = 0;

    //disp([0, xt, yt]);

    for i = 1: m

        x = xt; y = yt;
        k1 = h*rb(x, y);
        
        x = xt + c2*h; y = yt + a21*k1;
        k2 = h*rb(x, y);

        x = xt + c3*h; y = yt + a31*k1 + a32*k2;
        k3 = h*rb(x, y);

        x = xt + c4*h; y = yt + a41*k1 + a42*k2 + a43*k3;
        k4 = h*rb(x, y);

        x = xt + c5*h; y = yt + a51*k1 + a52*k2 + a53*k3 + a54*k4;
        k5 = h*rb(x, y);

        x = xt + c6*h; y = yt + a61*k1 + a62*k2 + a63*k3 + a64*k4 + a65*k5;
        k6 = h*rb(x, y);

        x = xt + c7*h; y = yt + a71*k1 + a73*k3 + a74*k4 + a75*k5 + a76*k6;
        k7 = h*rb(x, y);

        xt = a+i*h;
        yt = yt + a71*k1 + a73*k3 + a74*k4 + a75*k5 + a76*k6;
        ErroGlobal = e1*k1 + e3*k3 + e4*k4 + e5*k5 + e6*k6 + e7*k7;

        vetX(i+1) = xt;
        vetY(i+1) = yt;
        EG(i+1) = ErroGlobal;
        
        //disp([i, xt, yt, ErroGlobal]);
    end
    
endfunction

//Metodo Adans-Bashforth-Moulton
//entrada a(limite inferior),b(limite superior),
//m(numero de sub intervalos),y0(valor inicial),rb(funcao)
function [vetX, vetY, erro] = abm(a, b, m, y0, rb)

    h = (b-a)/m;
    // chamado do metodo Dormand-Prince
    [vetX, vetY, erro] = dopri(a, a+3*h, 3, y0, rb);

    for i = 1:4
        disp([i-1, vetX(i), vetY(i), erro(i)]);    
    end

    for i = 4: m
        //avaliar f(x,y)
        x = vetX(i-3);
        y = vetY(i-3);
        f0 = rb(x,y);
        //avaliar f(x,y)
        x = vetX(i-2);
        y = vetY(i-2);
        f1 = rb(x,y);
        //avaliar f(x,y)
        x = vetX(i-1);
        y = vetY(i-1);
        f2 = rb(x,y);
        //avaliar f(x,y)
        x = vetX(i);
        y = vetY(i);
        f3 = rb(x,y);

        yPre = h*(55*f3 - 59*f2 +37*f1 - 9*f0)/24 + vetY(i);
        vetY(i+1) = yPre;
        vetX(i+1) = a+i*h;
        x = vetX(i+1);
        
        for j = 1:2
        
            y = vetY(i+1);
            f4 = rb(x,y);

            yCor = h*(9*f4 + 19*f3 - 5*f2 + f1)/24 + vetY(i);
            vetY(i+1) = yCor;
        end

        erro = abs(yCor - yPre)*19/270;
        disp([i, vetX(i+1), vetY(i+1), erro])
    end
    
endfunction

// exemplo de execuçao
a = 0;
b = 1;
m = 10;
y0 = 1;

abm(a, b, m, y0, rb);