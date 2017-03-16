function x = bisectionQ2()
    a = 1;
    b = 2;
    k = 0;
    func = @(x) 816*x^3 - 3835*x^2 + 6000*x -3125;
    while b-a > eps
        x = (a + b)/2;
        if  func(a)*func(b) > func(x)
            b = x;
        else
            a = x;
        end
        k = k + 1;
    end    
    k

end

