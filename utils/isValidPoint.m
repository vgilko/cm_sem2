function isValid = isValidPoint(point, a,b)
    if (nargin != 3)
        return;
    endif

    isValid = a < point && point < b;
endfunction