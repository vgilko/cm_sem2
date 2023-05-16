source("prints/printPoint.m");
source("utils/isValidPoint.m");


function [currentPoint, currentFunctionValue] = radixMethod(a,b,epsilon)
    if (nargin < 1)
        return;
    endif
    
    global targFunction;

    currentPoint = a;
    currentFunctionValue = targFunction(currentPoint);
    printPoint(currentPoint, currentFunctionValue, 'g', 'o');

    delta = (b - a) / 4;

    while (abs(delta) > epsilon)
        do 
            nextPoint = currentPoint + delta;
            nextFunctionValue = targFunction(nextPoint);
            printPoint(nextPoint, nextFunctionValue, 'b', '*');

            if (currentFunctionValue > nextFunctionValue)
                currentPoint = nextPoint;
                currentFunctionValue = nextFunctionValue;
                printPoint(currentPoint, currentFunctionValue, 'g', 'o');
            else
                break;
            endif

        until (!isValidPoint(currentPoint,a,b));

        delta = -delta / 4;
    endwhile
endfunction