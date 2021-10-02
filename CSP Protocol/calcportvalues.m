

function port = calcportvalues(port)
global csp_reserved_ports
 
switch port
    case csp_reserved_ports.CMP
        port = 0;
    case csp_reserved_ports.PING
        port = 1;
    case csp_reserved_ports.PS
        port = 2;
    case csp_reserved_ports.MEMFREE
        port = 3;
    case csp_reserved_ports.REBOOT
        port = 4;
    case  csp_reserved_ports.BUF_FREE
        port = 5;
    case  csp_reserved_ports.UPTIME
        port = 6;
    case  csp_reserved_ports.ANY
        port = 7;
    case  csp_reserved_ports.PROMISC
        port = 8;
    
    
    otherwise
        error(['Unknown enum value: ' num2str(port)]);
end
end