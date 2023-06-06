function printPoint(point, functionValue, pointColor, marker)
    global isDebug;
    global withPause;
    global pauseTime;

    if (nargin != 4 || !isDebug)
        return;
    endif

    hold on;
    plot(point, functionValue, 'ro', 'Marker', marker, 'MarkerSize', 10);
    
    if (withPause)
        pause(pauseTime);
    endif
endfunction