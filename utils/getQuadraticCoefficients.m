function [a1, a2] = getQuadraticCoefficients(x1, x2, x3, f1, f2, f3)
    a1 = (f2 -f1) / (x2 - x1);
    a2 = (1 / (x3 - x2)) * ((f3 - f1) / (x3 - x1) - a1);
endfunction