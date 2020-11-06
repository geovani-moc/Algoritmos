clc; clear;
function [y] = funcao(x)
    y = (x**2)-5 
    endfunction;

//a,b =os extremos do intervalo onde a raiz esta localizada
//Ep = precisao
//it - numero maximo de iteracoes

function x=bisseccao(a,b,Ep,it,func)
    n=0;
    while abs(b-a) > Ep &n<it
        n=n+1;
        x(n)=(a+b)/2;
        if func(a)/abs(func(a))==func(x(n))/abs(func(x(n))) then
            a=x(n);
        else
            b=x(n);
        end
    end
endfunction

function x=trisseccao(a,b,Ep,it,func)
    n=0;
    while abs(b-a) > Ep & n<it
        n=n+1;
        x(n)=a;
        terco = ((b-a)/3);
        
        //disp([sign(func(a)),sign(func(a+terco)),sign(func(a+2*terco)),sign(func(b))]);

        if(sign(func(a)) ~= sign(func(a+terco))) then
            b = a+terco;
            //disp([a,b,terco]);

            elseif (sign(func(a+terco)) ~= sign(func(a+2*terco))) then
            a = a+terco;
            b = a+2*terco;
            //disp([a,b]);

                elseif (sign(func(a+2*terco)) ~= sign(func(b))) then
                a = a+2*terco;
                //disp([a,b,terco]);
        end
        disp([a, b]);
    end
endfunction

a = 2;
b = 3;
Ep = 0.01;
it = 150;
x=bisseccao(a,b,Ep,it,funcao)
disp(x);

x2 = trisseccao(a,b,Ep,it,funcao);
//disp(x2);
