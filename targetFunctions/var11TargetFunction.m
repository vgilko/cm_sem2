global executionCount;

executionCount = 0;

function functionValue = var11TargetFunction(point)
    if (nargin != 1)
        return;
    endif

    global executionCount;
    executionCount = executionCount + 1;

    pointSquare = point * point;

    firstValue = tan((2 * pointSquare * pointSquare - 5 * point + 6) / 8);
    secondValue = atan((7 * pointSquare - 11 * point + 1 - sqrt(2)) / (-7 * pointSquare + 11 * point + sqrt(2)));
    functionValue = firstValue + secondValue;
endfunction