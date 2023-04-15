source("./targetFunctions/targetFunction.m");

function [optimalPoint, optimalValue, steps] = goldenSectionMethod(a,b, epsilon)
    if (nargin < 1)
        return;
    endif

    tau = (sqrt(5) - 1) / 2;
    l = b - a;

    currentPoint = b - l * tau;
    currentFunctionValue = targetFunction(currentPoint);
    
    nextPoint = a + l * tau;
    nextFunctionValue = targetFunction(nextPoint);
    
    steps = [[]];

    while (l > 2 * epsilon)
        if (currentFunctionValue <= nextFunctionValue)
            b = nextPoint;
            l = b - a;

            nextPoint = currentPoint;
            nextFunctionValue = currentFunctionValue;

            currentPoint = b - l * tau;
            currentFunctionValue = targetFunction(currentPoint);
        else
            a = currentPoint;
            l = b - a;
            
            currentPoint = nextPoint;
            currentFunctionValue = nextFunctionValue;

            nextPoint = a + l * tau;
            nextFunctionValue = targetFunction(nextPoint);
        endif

        steps(end+1,:) = [a; b; currentFunctionValue];
    endwhile

    optimalPoint = (a + b) / 2;
    optimalValue = targetFunction(currentPoint);
endfunction