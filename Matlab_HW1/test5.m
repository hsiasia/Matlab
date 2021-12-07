for i=0:10;
    x=i/10;
    subplot(3,4,i+1);
    imshow(x);
    title(['gray scale = ',num2str(i/10)]);
end