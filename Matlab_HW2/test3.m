t=linspace(0,4*pi,80);
y=exp(-0.2.*t).*(cos(t)+i.*sin(t));
z=imag(y);
plot(t,y,t,z);
title('\bf Plot of complex function vs Time');
xlabel('\bf t');
ylabel('\bf y(t)');	
legend('real','img');