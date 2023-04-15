source("targetFunctions/targetFunction.m");

function printFunctionPlot(a, b)
    x = linspace(a,b, 1000);
    y = [];
    for i = 1:length(x)
        y(i) = targetFunction(x(i));
    endfor

    plot(x,y,'-', 'LineWidth', 2);

    global executionCount;
    executionCount = 0;

endfunction