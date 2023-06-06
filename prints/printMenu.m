function [method] = printMenu()
    methodName = 'fminbnd';
    method = @newtonMethod;


    methodN = input("Выберите метод: \n [1] Метод поразрадного поиска \n [2] Метод золотого сечения \n [3] Метод парабол \n [4] Метод Ньютона \n [5] fminbnd \n Ваш выбор: ");

    if (methodN == 1)
        method = @radixMethod;
        methodName = 'Метод поразрадного поиска';
    elseif (methodN == 2)
        method = @goldenSectionMethod;
        methodName = 'Метод золотого сечения';
    elseif (methodN == 3)
        method = @quadraticInterpolationGoldenSection;
        methodName = 'Метод парабол';
    elseif (methodN == 4)
        method = @newtonMethod;
        methodName = 'Метод Ньютона';
    elseif (methodN == 5)
        global useFminbnd;
        useFminbnd = true;
    endif

    printf("Выбран метод: %s\n", methodName);
endfunction
