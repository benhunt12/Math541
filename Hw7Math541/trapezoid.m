function tot = trapezoid(f,a,b,N)
    X = linspace(a,b,N+1);
    tot = (b-a)/(2*N)*(f(a) + f(b) + 2*sum(f(X(2:N))));
end

