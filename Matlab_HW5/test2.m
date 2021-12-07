%% test2.m
%% Salary reference..
%John = [1000, 2000, 3000, 4000];
%Marie = [2000, 3000, 4000];
%Joseph = [3000, 4000];
%Dougman = [5000];

fprintf('John total salary = %d\n', salary_cal(1000, 2000, 3000, 4000));
fprintf('Marie total salary = %d\n', salary_cal(2000, 3000, 4000));
fprintf('Joseph total salary = %d\n', salary_cal(3000, 4000));
fprintf('Dougman total salary = %d\n', salary_cal(5000));

function n = salary_cal(salary1, salary2, salary3, salary4)
    %% narginchk..;  %% your code implement here..
    minArg=1;
    maxArg=4;
    narginchk(minArg,maxArg);
    total = -1;  % baseline;
    %% nargin & switch..; your code implement here..
    n = total;   % return answer;
    switch nargin
        case 4
            n = salary1 + salary2 + salary3 + salary4;
        case 3
            n = salary1 + salary2 + salary3;
        case 2
            n = salary1 + salary2;
        case 1
            n = salary1;
        otherwise
            n = 0;
    end
end

function n1 = base_salary(salary1)
    n1 = salary1*2.2;
end

function n2 = merit_bonus(salary2)
    n2 = salary2*1.5;
end

function n3 = external_bonus(salary3)
    n3 = salary3*0.8;
end

function n4 = special_bonus(salary4)
    n4 = salary4*0.4;
end