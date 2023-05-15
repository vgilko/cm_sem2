source("prints/printPoint.m");
source("prints/drawLine.m");

function [optimalPoint, optimalValue] = goldenSectionMethod(a,b, epsilon)
    if (nargin != 3)
        return;
    endif

    global targFunction;
    global executionCount;
    
    tau = (sqrt(5) - 1) / 2;
    l = b - a;

    x1 = b - l * tau;
    f1 = targFunction(x1);
    printPoint(x1, f1, 'g', 'o');

    x2 = a + l * tau;
    f2 = targFunction(x2);
    printPoint(x2, f2, 'r', '+');

    drawLine(a,b, targFunction(a), targFunction(b));
    executionCount = executionCount - 2;


    while (l > 2 * epsilon)
        if (f1 <= f2)
            b = x2;
            l = b - a;

            x2 = x1;
            f2 = f1;
            printPoint(x2, f2, 'r', '+');

            x1 = b - l * tau;
            f1 = targFunction(x1);
            printPoint(x1, f1, 'g', 'o');

        else
            a = x1;
            l = b - a;
            
            x1 = x2;
            f1 = f2;
            printPoint(x1, f1, 'g', 'o');

            x2 = a + l * tau;
            f2 = targFunction(x2);
            printPoint(x2, f2, 'r', '+');

        endif

    drawLine(a,b, targFunction(a), targFunction(b));
    executionCount = executionCount - 2;

    endwhile

    optimalPoint = (a + b) / 2;
    optimalValue = targFunction(x1);
endfunction