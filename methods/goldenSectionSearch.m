function [a, optimalPoint, b] = goldenSectionSearch(a, b, epsilon)
    if (nargin != 3)
        return;
    endif

    global targFunction;
    global executionCount;
    
    tau = (sqrt(5) - 1) / 2;
    l = b - a;

    x1 = b - l * tau;
    f1 = targFunction(x1);

    x2 = a + l * tau;
    f2 = targFunction(x2);

    executionCount = executionCount - 2;


    while (l > 2 * epsilon)
        if (f1 <= f2)
            b = x2;
            l = b - a;

            x2 = x1;
            f2 = f1;

            x1 = b - l * tau;
            f1 = targFunction(x1);

        else
            a = x1;
            l = b - a;
            
            x1 = x2;
            f1 = f2;

            x2 = a + l * tau;
            f2 = targFunction(x2);

        endif

    executionCount = executionCount - 2;

    endwhile

    optimalPoint = (a + b) / 2;
    optimalValue = targFunction(x1);
endfunction
