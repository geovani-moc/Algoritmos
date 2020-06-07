//calcular a raiz de uma equacao pelo metodo da secante
/*
a,b = limites do intervalo
toler = tolerancia
iterMax = numero maximo de iteracoes
f = funcao
*/
clc;clear; 

function [raiz, iter, erro] = secante(a, b, toler, iterMax, f)
    fa = f(a);
    fb = f(b);

    if abs(fa) < abs(fb) then
        t = a;
        a = b;
        b = t;
        t = fa;
        fa = fb;
        fb = t;
    end

    iter = 0;
    x = b;
    fx = fb;

    while 1 then
        iter = iter+1;
        deltaX = -fx/(fb-fa)*(b-a);
        x = x + deltaX;
        fx = f(x);
        disp([iter, a, b, x, fx, deltaX]);
        if (abs(deltaX)<toler && abs(fx)<toler) || iter >= iterMax then
            break;
        end
        a = b;
        fa = fb;
        b = x;
        fb = fx;
    end

    raiz = x;
    if abs(deltaX) < toler && abs(fx) < toler then
        erro = 0;
        else 
            erro = 1;
    end

endfunction

function y = f(x)
    y = 2*x^3-cos(x+1)-3;
endfunction

a =-1;
b = 2;
toler = 0.0001;
iterMax = 100;

[raiz, iter, erro] = secante(a, b, toler, iterMax, f)
