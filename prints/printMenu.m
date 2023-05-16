function [method] = printMenu()
    methodName = 'Метод парабол';
    method = @quadraticInterpolationGoldenSection;

    methodN = input("Выберите метод: \n [1] Метод поразрадного поиска \n [2] Метод золотого сечения \n [3] Метод парабол \n Ваш выбор: ");

    if (methodN == 1)
        method = @radixMethod;
        methodName = 'Метод поразрадного поиска';
    elseif (methodN == 2)
        method = @goldenSectionMethod;
        methodName = 'Метод золотого сечения';
    endif

    printf("Выбран метод: %s\n", methodName);
endfunction