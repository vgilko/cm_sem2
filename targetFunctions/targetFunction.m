global executionCount;

executionCount = 0;

function functionValue = targetFunction(point)
  if (nargin < 1)
    return;
  endif

  global executionCount;
  executionCount = executionCount + 1;

  squarePoint = point * point;
  functionValue = sin((squarePoint + point - 4)/5) + \
                  cosh((squarePoint * point + 3 * squarePoint + 5 * point + 8)/(3*point + 9)) - 1.0;
endfunction