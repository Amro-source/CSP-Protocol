function port = calcpriorities(port)
global priorities
 
switch port
    case priorities.PRIO_CRITICAL
        port = 0;
    case priorities.PRIO_HIGH
        port = 1;
    case priorities.PRIO_NORM
        port = 2;
    case priorities.PRIO_LOW
        port = 3;
    
    
    otherwise
        error(['Unknown enum value: ' num2str(port)]);
end
end