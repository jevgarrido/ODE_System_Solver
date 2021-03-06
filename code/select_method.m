function [] = select_method(method)
    global MAIN
    
    switch method
        case 'Euler'    % 1st Order
            MAIN.a = 0;
            MAIN.b = 1;
            MAIN.c = 0;
            MAIN.method_type = 'Explicit';
            
        case 'MidPoint' % 2nd Order
            MAIN.a = [ 0 0;...
                       1/2 0 ];
            MAIN.b = [ 0 1 ]';
            MAIN.c = [ 0 1/2 ];
            MAIN.method_type = 'Explicit';

        case 'RK_4'     % 4th Order
            MAIN.a = [   0   0 0 0;...
                       1/2   0 0 0;...
                         0 1/2 0 0;...
                         0   0 1 0];
            MAIN.b = [ 1/6 1/3 1/3 1/6]';
            MAIN.c = [ 0 1/2 1/2 1];
            MAIN.method_type = 'Explicit';
            
        case 'RK_8-12'  % 8th Order with 12 intermediate steps
            a1  = zeros(1,12);
            a2  = [1/9, zeros(1,11)];
            a3  = [1, 3, zeros(1,10)]/24;
            a4  = [1, 0, 3, zeros(1,9)]/16;
            a5  = [29, 0, 33, -12, zeros(1,8)]/500;
            a6  = [33, 0, 0, 4, 125, zeros(1,7)]/972;
            a7  = [-21, 0, 0, 76, 125, -162, zeros(1,6)]/36;
            a8  = [-30, 0, 0, -32, 125, 0, 99, zeros(1,5)]/243;
            a9  = [1175, 0, 0, -3456, -6250, 8424, 242, -27, zeros(1,4)]/324;
            a10 = [293, 0, 0, -852, -1375, 1836, -118, 162, 324, zeros(1,3)]/324;
            a11 = [1303, 0, 0, -4260, -6875, 9990, 1030, 0, 0, 162, zeros(1,2)]/1620;
            a12 = [-8595, 0, 0, 30720, 48750, -66096, 378, -729, -1944, -1296, 3240, 0]/4428;
            MAIN.a = [a1; a2; a3; a4; a5; a6; a7; a8; a9; a10; a11; a12];
            MAIN.b = [41, 0, 0, 0, 0, 216, 272, 27, 27, 36, 180, 41]'/840;
            MAIN.c = [0, 1/9, 1/6, 1/4, 1/10, 1/6, 1/2, 2/3, 1/3, 5/6, 5/6, 1];
            MAIN.method_type = 'Explicit';
    end
end