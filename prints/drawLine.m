function drawLine(x1, x2, y1, y2)
    global isDebug;
    global withPause;
    global pauseTime;


    if (nargin != 4 || !isDebug)
        return;
    endif

    hold on;
    plot([x1, x2], [y1, y2], '-', 'LineWidth', 2);

    if (withPause)
        pause(pauseTime);
    endif 
endfunction
