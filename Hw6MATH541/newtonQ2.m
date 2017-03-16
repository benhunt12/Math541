function x0 = newtonQ2(x0)
    syms x;
    f = 816*x.^3 - 3835*x.^2 + 6000*x - 3125;
    [func,fprim] = getderiv(f);
    k = 0;
    x = x0 - func(x0)/fprim(x0);
    for jj = 1 : 100
        x0 = x;
        x = x0 - func(x0)/fprim(x0);
        k = k + 1;
    end
    k
    
end

