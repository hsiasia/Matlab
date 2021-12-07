theta=linspace(-pi,pi,50);
phi=linspace(-pi/2,pi/2,50);
[Theta,Phi]=meshgrid(theta,phi);
x=sin(Phi).*sin(Theta);
y=cos(Phi).*cos(Theta);
z=sin(Phi).*cos(Phi);

surf(x,y,z);
title("\bf unknown sphere");