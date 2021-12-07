x=(1:15:100);
y=(1:20:200);
[X,Y]=meshgrid(x,y);
z=sin(X)+cos(Y);

surf(X,Y,z);
colorbar;
title("simple end");