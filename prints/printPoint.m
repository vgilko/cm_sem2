function printPoint(point, functionValue, pointColor, marker)
    global isDebug;
    if (nargin != 4 || !isDebug)
        return;
    endif

    hold on;
    % plot(point, functionValue, 'ro', 'Marker', marker, 'MarkerSize', 10, 'MarkerFaceColor', pointColor);
    plot(point, functionValue, 'ro', 'Marker', marker, 'MarkerSize', 10);
    pause(5);
endfunction