n = input('Please input the date¡G');

switch n
	case 7
		week = 'Sun';
	case 1
		week = 'Mon';
	case 2
		week = 'Tue';
	case 3
		week = 'Wed';	
    case 4
		week = 'Thr';	
    case 5
		week = 'Fri';	
   	case 6
		week = 'Sat';	
    otherwise
        fprintf('ERROR_MESSAGE : \nThe date should less than 8.\n');
		return;
end
fprintf('today is %s \n',week);