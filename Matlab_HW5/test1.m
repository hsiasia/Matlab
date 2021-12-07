
function test1(iter,ser_typ)
    if (ser_typ=="Lucas")
    test1ans=lucas(iter);
    elseif (ser_typ=="Fibo")
        test1ans=fibo(iter);
    end
    fprintf('The %d of term in %s=%d\n',iter,ser_typ,test1ans);
end

function lucasnum=lucas(iter)
    if(iter==0)
        lucasnum=2;
    elseif(iter==1)
        lucasnum=1;
    else
        lucasnum=lucas(iter-1)+lucas(iter-2);
    end
end

function fibonum=fibo(iter)
    if(iter==0)
        fibonum=0;
    elseif(iter==1)
        fibonum=1;
    else
        fibonum=fibo(iter-1)+fibo(iter-2);
    end
end