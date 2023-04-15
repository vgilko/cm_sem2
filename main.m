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

debug = true;
needPrintPlot = true;
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

    [point, functionValue, steps] = method(a,b,currentEpsilon);

    printSteps(steps, debug, methodName);
    printRow(index, point, functionValue, currentEpsilon, executionCount);
    
    if (needPrintPlot)
        printPlot(a, b, steps, [point, functionValue], sprintf("Epsilon: %f", currentEpsilon), methodName);
    endif

    executionCount = 0;
endfor