source("prints/drawLine.m");

source("methods/goldenSectionSearch.m");

source("utils/getCurrentX.m");
source("utils/getQuadraticCoefficients.m");

function [optimalPoint, optimalValue] = quadraticInterpolationGoldenSection(a, b, epsilon)

    if (nargin != 3)
        return;
    endif

    global targFunction;

    [x1, x2, x3] = goldenSectionSearch(a, b, (b - a) / 4);

    f1 = targFunction(x1);
    f2 = targFunction(x2);
    f3 = targFunction(x3);

    [a1, a2] = getQuadraticCoefficients(x1, x2, x3, f1, f2, f3);
    currentX = getCurrentX(x1, x2, a1, a2);
    currentF = 0;

    drawLine(x1, x3, f1, f3);

    prevX = 100000;

    while (abs(prevX - currentX) > epsilon)
        currentF = targFunction(currentX);

        if (currentF <= f2)
            x1 = x2;
            f1 = f2;

            x2 = currentX;
            f2 = currentF;
        else
            x3 = currentX;
            f3 = currentF;
        endif

        [a1, a2] = getQuadraticCoefficients(x1, x2, x3, f1, f2, f3);
        prevX = currentX;
        currentX = getCurrentX(x1, x2, a1, a2);

        drawLine(x1, x3, f1, f3);
    endwhile

    optimalPoint = currentX;
    optimalValue = currentF;
endfunction
