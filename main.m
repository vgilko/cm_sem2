source("methods/goldenSectionMethod.m");
source("methods/radixMethod.m");

source("targetFunctions/targetFunction.m");

source("prints/printPlot.m");
source("prints/printSteps.m");
source("prints/printRow.m");
source("prints/printHeader.m");



global executionCount;

a = -1;
b = 0;
epsilon = [1e-2,1e-4,1e-6];

debug = false;
needPrintPlot = false;
methodName = 'radixMethod';
method = @goldenSectionMethod;

if (strcmp(methodName, 'radixMethod') == 1)
    method = @radixMethod;
else
    method = @goldenSectionMethod;
endif

printf("Current method: %s\n", methodName);
printHeader();
for index = 1:length(epsilon)
    currentEpsilon = epsilon(index);

    [point, functionValue] = method(a,b,currentEpsilon);

    printRow(index, point, functionValue, currentEpsilon, executionCount);
    
    executionCount = 0;

    pause;
endfor