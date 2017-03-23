function check = top()

    Nvals = [1e1 2 1e2 1e3 1e4 1e5 1e6 1e7 1e8];
    check = [];
    for jj = 2 : length(Nvals)
        check(jj) = wierd_newton(0.5,Nvals(jj));
    end
end


function xn = wierd_newton(x0,N)
    count = 0;
    fp = @(x) exp(-x.^2./2)/sqrt(2*pi);
    fx0 = trap_method(fp,0,x0,N)-.45;
    xn = x0 - fx0/fp(x0);
    while(abs(xn-x0) > eps*abs(x0))
        x0 = xn;
        fx0 = trap_method(fp,0,x0,N) -.45;
        xn = x0 - fx0/fp(x0);
        if count > 100
            break
        end
        count = count + 1;
    end
end



function tot = trap_method(f,a,b,N)
    X = linspace(a,b,N+1);
    tot = (b-a)/(2*N)*(f(a) + f(b) + 2*sum(f(X(2:N))));
end