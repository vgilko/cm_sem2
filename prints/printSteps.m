function printSteps(steps, debug, method)
    if (nargin < 1)
        return;
    endif;

    if (debug)

        template = '';
        if (strcmp(method, 'radixMethod') == 1)
            template = "Шаг %d. X=%f, f(x)=%f\n";
            
            printf("Последовательность точек xi, приближающих точку искомого минимума:\n");
        elseif (strcmp(method, 'goldenSectionMethod') == 1)
            template = 'Шаг %d. [%f; %f]\n';

            printf("Последовательность отрезков [ai, bi], приближающих точку искомого минимума:\n");
        endif

        for index = 1:size(steps, 1)
            currentPair = steps(index, :);

            printf(template, index, currentPair(1), currentPair(2));
        endfor
    endif
endfunction