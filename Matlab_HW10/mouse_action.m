function mouse_action(action)

    if nargin<1, action='start'; end

    switch(action)
        case 'start'	
            axis([0 1 0 1]);	
            box on;			
            title('Click and drag your mouse in the window');
    		set(gcf,'WindowButtonDownFcn','mouse_action down');
        case 'down'	
            set(gcf,'WindowButtonMotionFcn','mouse_action move');
            set(gcf,'WindowButtonUpFcn','mouse_action up');
    	case 'move'
        	currPt = get(gca,'CurrentPoint');
            x = currPt(1,1);
            y = currPt(1,2);
            line(x,y,'marker','.');
    	case 'up'
        	set(gcf,'WindowButtonMotionFcn','');
            set(gcf,'WindowButtonUpFcn','');
            clf('reset');
            mouse_action();
    end
end