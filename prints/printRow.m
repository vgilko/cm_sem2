function printRow(index, point, functionValue, epsilon, execCount)
    if (nargin < 1) 
        return;
    endif

    printf(" %d   | %f | %f | %f | %d\n", index, point, functionValue, epsilon, execCount);
endfunction