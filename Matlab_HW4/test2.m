 x1=-1:0.1:3;
 y1=2*(x1.^2)-3*sin(x1)+2;
 
 plot(x1,y1,'c--','linewidth',3);
 hold on;
 
 for x2=-1:0.1:3;
    y2=2*(x2.^2)-3*sin(x2)+2;
    plot(x2,y2,'m.','MarkerSize',20);
    hold on;
 end