source("targetFunctions/targetFunction.m");
source("prints/printFunctionPlot.m");
source("prints/printPoint.m");
source("utils/isValidPoint.m");


function [currentPoint, currentFunctionValue] = radixMethod(a,b,epsilon)
    if (nargin < 1)
        return;
    endif

    printFunctionPlot(a,b);

    currentPoint = a;
    currentFunctionValue = targetFunction(currentPoint);
    printPoint(currentPoint, currentFunctionValue, 'g', 'o');

    delta = (b - a) / 4;

    while (abs(delta) > epsilon)
        do 
            nextPoint = currentPoint + delta;
            nextFunctionValue = targetFunction(nextPoint);
            printPoint(nextPoint, nextFunctionValue, 'b', '*');

            if (nextFunctionValue >= currentFunctionValue)
                break;
            endif

            currentPoint = nextPoint;
            currentFunctionValue = nextFunctionValue;
            printPoint(currentPoint, currentFunctionValue, 'g', 'o');

        until (!isValidPoint(currentPoint,a,b));

        delta = -delta / 4;
    endwhile

    close;
endfunction