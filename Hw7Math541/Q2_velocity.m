function Q2_velocity()

    syms v;
    m = 1;
    v0 = 10;
    vc = 2;
    r = 3;
    vt = 5;
    term = [];
    Nvals = [1e1 1e2 1e3 1e4 1e5 1e6 1e8];
    %diff = (vt - v0)/n;
    %v = linspace(v0,vt,diff);
    R = @(v) (m./(-r.*(2./(1+exp(-v.^2/vc.^2))-1)));
    
    
    for jj = 1 : length(Nvals)
        term(jj) = trapezoid(R,v0,vt,Nvals(jj));
    end
    
    fprintf('The approximate time is %i seconds\n',term(end));
    
end

