function x2 = secantQ2(x0,x1)
    k = 0;
    func = @(x) 816*x^3 - 3835*x^2 + 6000*x -3125;
    while abs(x1-x0) > eps*abs(x1)
        x2 = x0;
        x0 = x1;
        x1 = x1 + (x1 - x2)/(func(x2)/func(x1)-1);
        k = k + 1;
    end
    k
    
end

