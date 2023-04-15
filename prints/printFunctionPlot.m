
function printFunctionPlot(a, b)
    global isDebug;

    if (nargin != 2 || !isDebug)
        return;
    endif

    global targFunction;

    x = linspace(a,b, 1000);
    y = [];
    for i = 1:length(x)
        y(i) = targFunction(x(i));
    endfor

    plot(x,y,'-', 'LineWidth', 2);

    global executionCount;
    executionCount = 0;

endfunction