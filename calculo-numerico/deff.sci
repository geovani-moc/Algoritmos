a =[2 -1 3];
// definir equação
deff('[y] = yh(x)', 'y = a(1)+a(2).*x+a(3).*x.^2');
yy = yh(x);

//regressao linear multipla

x1 = [1 1 2 3 1 5];
x2 = [2 -1 3 1 -2 1];
x3 = [4 5 6 -1 2 8];
y = [1; 2; 3; 4; 5; 6];

z = [ones(1, 6)' x1' x2' x3'];

a = z\y;
