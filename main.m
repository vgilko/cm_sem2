source("methods/goldenSectionMethod.m");
source("methods/radixMethod.m");
source("methods/quadraticInterpolationGoldenSection.m");

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

a = 0;
b = 1;
% epsilon = [1e-2,1e-4,1e-6];
epsilon = [1e-6];

isDebug = true;
withPause = false;
targFunction = @var11TargetFunction;

method = printMenu();
printHeader();

for index = 1:length(epsilon)
    printFunctionPlot(a, b);

    currentEpsilon = epsilon(index);

    [point, functionValue] = method(a, b, currentEpsilon);

    printRow(index, point, functionValue, currentEpsilon, executionCount);

    hold on;
    plot(point, functionValue, 'ro', 'Marker', 's', 'MarkerSize', 10, 'MarkerFaceColor', 'g');

    executionCount = 0;

    if (isDebug)
        pause;
        close;
    endif

endfor
