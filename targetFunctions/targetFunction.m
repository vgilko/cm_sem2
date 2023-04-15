global executionCount;
executionCount = 0;

function functionValue = targetFunction(point)
  if (nargin < 1)
    return;
  endif

  global executionCount;
  executionCount = executionCount + 1;

  quadX = point * point;
  functionValue = sin((quadX + point - 4)/5) + \
                  cosh((quadX * point + 3 * quadX + 5 * point + 8)/(3*point + 9)) - 1.0;
endfunction