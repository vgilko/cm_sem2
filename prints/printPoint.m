function printPoint(point, functionValue, pointColor, marker)
    hold on;
    % plot(point, functionValue, 'ro', 'Marker', marker, 'MarkerSize', 5, 'MarkerFaceColor', pointColor);
    plot(point, functionValue, 'ro', 'Marker', marker, 'MarkerSize', 5);
    pause(0.7);
endfunction