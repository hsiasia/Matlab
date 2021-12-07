n=input('¿é¤J¡G');
if n<0
    disp('error'); 
else
    N=n+1;
    L = zeros(1,N);
    L(1)=2;
    L(2)=1;
    i = 3;
    while i<=N
        L(i)=L(i-1)+L(i-2);
        i = i+1;
    end
    disp(L(N));
end