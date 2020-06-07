clear 
clc
 xx = linspace(-3, 3, 100);
 yy = linspace(-3, 3, 100);
 n = length(xx);
 m = length(yy);
 
 for i=1:n
     for j=1:m
         z(i,j) =  -(xx(i)^2) - (yy(j)^2);
     end
     
 end
 
 plot3d1(xx, yy, z);
 
 f=get("current_figure");
 f.color_map = jetcolormap(64);
