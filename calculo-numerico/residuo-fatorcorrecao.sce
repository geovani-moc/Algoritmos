clc;
clear;
//A = input("Entre com a matriz A: ");
A=[5 -2 3;-2 10 4;3 4 20]
//b = input("Entre com o vetor b");
b=[31 -10 81]'
//x =  input("Entre com o vetor x");
x=[10 11 12]'
r = A*x-b; //residuo
c = A\r; //correcao
while norm(c,'inf')>=10^(-3)
    x = x + c;
    r = b-(A*x);
    c = A\r;
end
disp(x);
