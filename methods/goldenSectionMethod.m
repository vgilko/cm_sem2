source("prints/printPoint.m");

function [optimalPoint, optimalValue] = goldenSectionMethod(a,b, epsilon)
    if (nargin != 3)
        return;
    endif

    global targFunction;
    
    tau = (sqrt(5) - 1) / 2;
    l = b - a;

    currentPoint = b - l * tau;
    currentFunctionValue = targFunction(currentPoint);
    printPoint(currentPoint, currentFunctionValue, 'g', 'o');

    nextPoint = a + l * tau;
    nextFunctionValue = targFunction(nextPoint);
    
    while (l > 2 * epsilon)
        if (currentFunctionValue <= nextFunctionValue)
            b = nextPoint;
            l = b - a;

            nextPoint = currentPoint;
            nextFunctionValue = currentFunctionValue;
            printPoint(nextPoint, nextFunctionValue, 'r', '+');

            currentPoint = b - l * tau;
            currentFunctionValue = targFunction(currentPoint);
            printPoint(currentPoint, currentFunctionValue, 'g', 'o');
        else
            a = currentPoint;
            l = b - a;
            
            currentPoint = nextPoint;
            currentFunctionValue = nextFunctionValue;
            printPoint(currentPoint, currentFunctionValue, 'g', 'o');

            nextPoint = a + l * tau;
            nextFunctionValue = targFunction(nextPoint);
            printPoint(nextPoint, nextFunctionValue, 'r', '+');
        endif

    endwhile

    optimalPoint = (a + b) / 2;
    optimalValue = targFunction(currentPoint);
endfunction