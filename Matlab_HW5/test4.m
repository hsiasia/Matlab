%%test4.m
%% main function in structural programming style: 
global arr;
arr = [1, 5, 2, 3, 9, 7, 11];
comp = @yourCompare;
ssort(arr, comp);
%% define selection sort :
function sortedArr = ssort(arr, comp)
    narginchk(1, 2);
    nvals = length(arr);
    for idx=1:nvals-1
        select = idx;
        for jdx=idx+1:nvals
            %% 
            if(nargin==1)
                if(arr(jdx)<arr(select))
                    select = jdx;
                end
            else
                if(comp(arr(jdx), arr(select)))
                    select = jdx;
                end
            end
        end
        if idx ~= select
                tmp = arr(idx);
                arr(idx) = arr(select);
                arr(select) = tmp;
        end
    end
    sortedArr = arr;
    disp(arr);
end

%%
function tag = yourCompare(x1, x2)
    if(x1<x2)
        tag = true;
    else
        tag = false;
    end
end