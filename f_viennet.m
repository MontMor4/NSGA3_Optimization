function S = f_viennet(entrada)
    x = entrada(1);
    y = entrada(2);
    S(1) = 0.5*(x^2 + y^2) + sin(x^2+y^2);
    S(2) = ((3*x - 2*y + 4)^2)/8 + ((x-y+1)^2)/27 + 15;
    S(3) = 1/(x^2 + y^2 + 1) - 1.1 * exp(-x^2 - y^2);
end