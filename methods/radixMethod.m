source("targetFunctions/targetFunction.m");

function [currentPoint, currentFunctionValue, steps] = radixMethod(a,b,epsilon)
    if (nargin < 1)
        return;
    endif

    delta = (b - a) / 4;
    currentPoint = a;
    currentFunctionValue = targetFunction(currentPoint);
    steps = [[currentPoint, currentFunctionValue]];

    % while(abs(delta) > epsilon)
    %     do 
    %         nextPoint = currentPoint + delta;
    %         nextFunctionValue = targetFunction(nextPoint);


    %         if (currentFunctionValue <= nextFunctionValue)
    %             break;
    %         endif

    %         currentPoint = nextPoint;
    %         currentFunctionValue = nextFunctionValue;            
    %         steps(end+1,:) = [currentPoint; currentFunctionValue];
    %     until (currentPoint > a && 
    %             currentPoint < b)

    %     delta = -delta / 4;
    % endwhile

    while (abs(delta) >= epsilon)
        nextPoint = currentPoint + delta;
        nextFunctionValue = targetFunction(nextPoint);
        steps(end+1,:) = [nextPoint; nextFunctionValue];
        
        while (currentPoint > a && 
                currentPoint < b)
            if (currentFunctionValue > nextFunctionValue)
                currentPoint = nextPoint;
                currentFunctionValue = nextFunctionValue;
                steps(end+1,:) = [currentPoint; currentFunctionValue];
            else    
                break;
            endif

            nextPoint = currentPoint + delta;
            nextFunctionValue = targetFunction(nextPoint);
            steps(end+1,:) = [nextPoint; nextFunctionValue];
        endwhile

        currentPoint = nextPoint;
        currentFunctionValue = nextFunctionValue;
        delta = -delta / 4;

        steps(end+1,:) = [currentPoint; currentFunctionValue];
    endwhile
endfunction