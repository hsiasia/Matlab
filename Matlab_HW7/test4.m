cofLst = [3,2,6];
fh = sum_gen(cofLst);
fprintf("ans = %d",fh(2,3,5));

function fh = sum_gen(cofLst)
    strTmp = "@(a,b,c)";
   
    Ca=cofLst(1);
    Cb=cofLst(2);
    Cc=cofLst(3);
    
    str=sprintf(' %d*a+%d*b+%d*c',Ca,Cb,Cc);
    strTmp=strcat(strTmp,str);
    
    fh = str2func(strTmp);
end

