source("methods/goldenSectionMethod.m");
source("methods/radixMethod.m");

source("targetFunctions/targetFunction.m");
source("prints/printSteps.m");
source("prints/printRow.m");
source("prints/printHeader.m");
source("prints/printPoint.m");
source("prints/printFunctionPlot.m");

global targFunction;
global executionCount;
global isDebug;

a = -1;
b = 0;
% epsilon = [1e-2,1e-4,1e-6];
epsilon = [1e-6];

isDebug = true;
methodName = 'goldenSectionMethod';
targFunction = @targetFunction;

method = @goldenSectionMethod;

if (strcmp(methodName, 'radixMethod') == 1)
    method = @radixMethod;
else
    method = @goldenSectionMethod;
endif

printf("Current method: %s\n", methodName);
printHeader();
for index = 1:length(epsilon)
    printFunctionPlot(a,b);

    currentEpsilon = epsilon(index);

    [point, functionValue] = method(a,b,currentEpsilon);

    printRow(index, point, functionValue, currentEpsilon, executionCount);

    % printPoint(point, functionValue, 'g', '*');
    plot(point, functionValue, 'ro', 'Marker', 's', 'MarkerSize', 10, 'MarkerFaceColor', 'g');

    
    executionCount = 0;

    if (isDebug)
        pause;
        close;
    endif
endfor