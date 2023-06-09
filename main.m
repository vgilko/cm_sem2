source("methods/goldenSectionMethod.m");
source("methods/radixMethod.m");
source("methods/quadraticInterpolationGoldenSection.m");
source("methods/newtonMethod.m");

source("targetFunctions/targetFunction.m");
source("targetFunctions/var11TargetFunction.m");

source("prints/printSteps.m");
source("prints/printRow.m");
source("prints/printHeader.m");
source("prints/printPoint.m");
source("prints/printFunctionPlot.m");
source("prints/printMenu.m");

global targFunction;
global executionCount;
global isDebug;
global withPause;
global pauseTime;
global useFminbnd;

a = -1;
b = 0;
% epsilon = [1e-2,1e-4,1e-6];
epsilon = [1e-6];
pauseTime = 3;

isDebug = true;
withPause = true;
useFminbnd = false;
targFunction = @targetFunction;

method = printMenu();
printHeader();

for index = 1:length(epsilon)
    printFunctionPlot(a, b);

    currentEpsilon = epsilon(index);

    if (useFminbnd)
        [x_star, f_star] = fminbnd(targFunction, a, b, optimset('Display', 'iter', 'TolX', epsilon));
        p2 = plot(x_star, f_star, 'r.');

        printRow(index, x_star, f_star, currentEpsilon, executionCount);
    else
        [point, functionValue] = method(a, b, currentEpsilon);

        printRow(index, point, functionValue, currentEpsilon, executionCount);

        hold on;
        plot(point, functionValue, 'ro', 'Marker', 's', 'MarkerSize', 10, 'MarkerFaceColor', 'g');

        executionCount = 0;

        if (isDebug)
            pause;
            close;
        endif

    endif

endfor
