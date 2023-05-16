function printPoint(point, functionValue, pointColor, marker)
    global isDebug;
    global withPause;

    if (nargin != 4 || !isDebug)
        return;
    endif

    hold on;
    plot(point, functionValue, 'ro', 'Marker', marker, 'MarkerSize', 10);
    
    if (withPause)
        pause(5);
    endif
endfunction