source("./targetFunctions/targetFunction.m");

function printPlot(a, b, steps, optimalPair, plotTitle, method)
    if (nargin < 1)
        return;
    endif

    x = linspace(a,b,1000);
    y = [];
    for i = 1:length(x)
        y(i) = targetFunction(x(i));
    endfor

    plot(x,y,'-', 'LineWidth', 2);

    if (strcmp(method, 'radixMethod'))
        usedPoints = [];
        functionValues = [];
        for index = 1:size(steps, 1)
            usedPoints = [usedPoints, steps(index,1)];
            functionValues = [functionValues, steps(index,2)];
        endfor

        hold on;
        title(plotTitle);
        plot(usedPoints, functionValues, 'ro', 'MarkerSize', 2, 'MarkerFaceColor', 'r');
    endif

    hold on;
    plot(optimalPair(1), optimalPair(2), 'ro', 'MarkerSize', 4, 'MarkerFaceColor', 'g');
    
    printf("Нажмите любую кнопку для продолжения\n");
    pause;
    close;

endfunction