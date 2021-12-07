t=linspace(0,20*pi,600);
x=t.*sin(t);
y=t.*cos(t);

plot3(x,y,t);
hold on;
plot3(y,x,t);