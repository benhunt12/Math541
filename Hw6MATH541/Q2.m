function Q2(b)

    %%816x^3 - 3835x^2 + 6000x - 3125
    
    %part A
    p = [816 -3835 6000 -3125];
    rvals = roots(p)
    
    %part B
    p = @(x) 816*x.^3 - 3835*x.^2 + 6000*x - 3125;
    x = 1.43:0.01:1.71;
    plot(x,p(x))
    hold on
    plot(rvals(1),p(rvals(1)), 'r*')
    hold on
    plot(rvals(2),p(rvals(2)), 'r*')
    hold on
    plot(rvals(3),p(rvals(3)), 'r*')
end

