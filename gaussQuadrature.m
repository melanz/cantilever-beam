function [wts, loc] = gaussQuadrature(option)
switch option
    case '1point'
        loc = 0;
        wts = 2;
    case '2point'
        loc = [-sqrt(1/3); sqrt(1/3)];
        wts = [1; 1];
    case '3point'
        loc = [-sqrt(3/5); 0; sqrt(3/5)];
        wts = [5/9; 8/9; 5/9];
    case '4point'
        loc = [-sqrt(3/7 + sqrt(120)/35); -sqrt(3/7 - sqrt(120)/35);
            sqrt(3/7 - sqrt(120)/35); sqrt(3/7 + sqrt(120)/35)];
        wts = [1/2 - 5/(3*sqrt(120)); 1/2 + 5/(3*sqrt(120));
            1/2 + 5/(3*sqrt(120)); 1/2 - 5/(3*sqrt(120))];
    case '5point'
        loc = [-(sqrt(5 + 2*sqrt(10/7)))/3; -(sqrt(5 - 2*sqrt(10/7)))/3; 0;
        (sqrt(5 - 2*sqrt(10/7)))/3; (sqrt(5+2*sqrt(10/7)))/3];
        wts = [(322 - 13*sqrt(70))/900; (322 + 13*sqrt(70))/900; 128/225;
            (322 + 13*sqrt(70))/900; (322 - 13*sqrt(70))/900];
end
end