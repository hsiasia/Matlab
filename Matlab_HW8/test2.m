x=(-4:0.1:4);
y=(-4:0.1:4);
[X,Y] = meshgrid(x,y);
z=exp(-0.5.*(X.^2+0.5*((X-Y).^2)));

mesh(X, Y, z);
colorbar;
title("Mesh graph");