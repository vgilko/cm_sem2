function printRow(index, point, functionValue, epsilon, execCount)
    if (nargin < 1) 
        return;
    endif

    output_precision(14);
    
    printf(" %d   | %.10f | %.10f | %.10f | %d\n", index, point, functionValue, epsilon, execCount);
endfunction