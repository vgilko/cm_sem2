function drawLine(x1, x2, y1, y2)
    global isDebug;


    if (nargin != 4 || !isDebug)
        return;
    endif

    hold on;
    plot([x1, x2], [y1, y2], '-', 'LineWidth', 2);
endfunction
