type test4.txt;
[x,y] = textread('test4.txt', '%f%f');
plot(x,y,'bo');
hold on;

p=polyfit(x,y,1);
y1=polyval(p,x);

plot(x,y1,'g');
axis([1 8 0 9]);
title('Least Square Regression When n=1');