%% test2template.txt
%% Define the trivial plot.. 
x = -3*pi:pi/10:3*pi;
y1 = sin(x);
y2 = cos(x);

%% complete the plot..
    %% figure with tag 1
gHand_1 = plot(x, y1);
tag = 1;
setting_figure(gHand_1, tag);
hold on;

    %% figure with tag 2
gHand_2 = plot(x, y2);
tag = 2;
setting_figure(gHand_2, tag);
hold off;

%% event handler..
%%% your code in second part of test1.m.
inputans='n';
while inputans=='n'
    event = waitforbuttonpress;
    if event==0
            linewidth=get(gco,'linewidth');
            linestyle=get(gco,'linestyle');
            fprintf('The LineWidth is %d and the LineStyle is %s\n',linewidth,linestyle);
    end
    inputans = input('finish ?','s');
    if inputans=='n'
        fprintf('then click the line ~~\n');
    end
end
%% It's time to show your hack..
function setting_figure(gHand, tag)
    %%.. your code in first part of test1.m.
    if tag==1
        set(gHand, 'linewidth', 5);    
        set(gHand, 'linestyle', ':');
        set(gHand, 'Color', 'y');
    elseif tag==2       
        set(gHand, 'linewidth', 3);   
        set(gHand, 'linestyle', '--');
        set(gHand, 'Color', 'g');
    end
end