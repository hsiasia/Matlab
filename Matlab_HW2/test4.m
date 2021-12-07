x=[15/50,5/50,10/50,5/50,15/50];
explode=[1 0 0 0 1];
p = pie(x,explode);
title('candy question:');

ptext=findobj(p,'Type','text');
percentvalue=get(ptext,'String');
txt={'John(';'Marie(';'Joseph(';'Turine(';'Nash('};
txt2={')';')';')';')';')'};
combinedtxt = strcat(txt,percentvalue);
combinedtxt2 = strcat(combinedtxt,txt2);

ptext(1).String = combinedtxt2(1);
ptext(2).String = combinedtxt2(2);
ptext(3).String = combinedtxt2(3);
ptext(4).String = combinedtxt2(4);
ptext(5).String = combinedtxt2(5);