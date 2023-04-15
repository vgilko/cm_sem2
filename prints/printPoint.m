function printPoint(point, functionValue, pointColor, marker)
    global isDebug;
    if (nargin != 4 || !isDebug)
        return;
    endif

    hold on;
    % plot(point, functionValue, 'ro', 'Marker', marker, 'MarkerSize', 5, 'MarkerFaceColor', pointColor);
    plot(point, functionValue, 'ro', 'Marker', marker, 'MarkerSize', 5);
    pause(0.5);
endfunction