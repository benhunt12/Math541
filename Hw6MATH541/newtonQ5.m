function newtonQ5(x,A)

    xprev = 0;
    count = 0;
    
    while abs(x - xprev) > eps*abs(x)
        xprev = x;
        x = 0.5*(x + A/x);
        count = count + 1;
    end
    x
    count

end

