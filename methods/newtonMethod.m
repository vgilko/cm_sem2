source("prints/printPoint.m");
source("methods/goldenSectionSearch.m");

function [x, y] = newtonMethod(a, b, epsilon)

    if (nargin != 3)
        return;
    endif

    global targFunction;

    % [x1, x2] = goldenSectionSearch(a, b, (b - a) / 7);
    % [x1, x2] = goldenSectionSearch(a, b, 0.25);

    % x_star = (x1 + x2) / 2;
    x_star = (a + b) / 2;

    h = 12 * epsilon;

    run = true;

    while (run)
        f_plus = targFunction(x_star + h);
        f_star = targFunction(x_star);
        f_minus = targFunction(x_star - h);
        printPoint(x_star, f_star, 'r', 'o');

        x0 = x_star;

        f1 = (f_plus - f_star) / h;
        f2 = (f_plus - 2 * f_star + f_minus) / (h.^2);
        x_star = x_star - f1 / f2;
        printPoint(x_star, f_star, 'r', 'o');

        run = (abs(x_star - x0) > epsilon) || (abs(f1) > epsilon);
    end

    x = x_star;
    y = f_star;
endfunction
