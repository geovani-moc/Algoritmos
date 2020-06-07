// metodo de runge-kutta ordem 2
// metodo muito eficiente para edo's
// todos algoritmos resolvem problemas de valor inicial

clc; clear;

function yd = rb(x, y)
    yd = x - 2*y + 1;
endfunction


// a=limite inferio, b= limite superior, h = tamanho do passo
// y0=valor inicial

function [vetX, vetY] = rungeKutta2(a, b, h, y0, rb)
    m = (b-a)/h;
    xt = a;
    yt = y0;
    vetX(1) = xt;
    vetY(1) = yt;

    disp([0, xt, yt]);
    for i = 1: m
    
        x = xt; y =yt;
        k1 = rb(x,y);

        x = xt+h; y = yt + h * k1;
        k2 = rb(x,y);

        xt = a+i*h;
        yt = yt + h/2 * (k1+k2);
        
        disp([i, xt, yt]);
        vetX(i+1) = xt;
        vetY(i+1) = yt;
    end
endfunction

m=10;
a=0;
b=1;
y0=1;
h = 0.1;

[x,y] = rungeKutta2(a,b,h,y0,rb);
