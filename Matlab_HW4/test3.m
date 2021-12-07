timer1=tic;
for x2=-1:0.1:3
    y2=2*(x2.^2)-3*sin(x2)+2;
end
time1=toc(timer1);

timer2=tic;
x1=-1:0.1:3;
y1=2*(x1.^2)-3*sin(x1)+2;
time2=toc(timer2);

fprintf('for loop time:%f\n',time1);
fprintf('vectorization time:%f\n',time2);