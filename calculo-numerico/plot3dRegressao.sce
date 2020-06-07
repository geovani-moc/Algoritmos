/*[x y] = meshgrid(-10:1:10);
z = 2.*x + 3.*y + 4;
surf(x,y,z);
set(gca(),"auto_clear","off");
plot3(DataX, DataY, DataZ);
*/

//https://help.scilab.org/docs/6.0.0/ru_RU/scatter3.html

[a, b] = meshgrid(-3 : 0.2 :3, -3:0.2:3);
c = 2*a;

//surf(a, b, c);
//plot3d(a, b, c, alpha=0);
mesh(a,b,c);

t = -3:0.2:3
x = t .* cos(t) .* sin(t)
y = t .* sin(t) .* sin(t)
z = t .* cos(t)

scatter3(x, y, z, ".")
