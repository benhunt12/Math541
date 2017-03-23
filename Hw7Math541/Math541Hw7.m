function analyze_trap()

    syms x;
    f = matlabFunction(2/(1 + x^2));
    a = -1;
    b = 1;
    tint = pi;
    Nvals = [1e1 1e2 1e3 1e4 1e5 1e6]';
    Evals = zeros(length(Nvals),1);
    for jj = 1 : length(Nvals)
       tot = trapezoid(f,a,b,Nvals(jj));
       Evals(jj) = log10(abs(tint-tot));
    end
   
    lgNvals = log10(Nvals);
    plot(log10(Nvals),Evals);
    title('LogLog Plot of Error');
    ylabel('Error');
    xlabel('N Value');
    slopes = (Evals(2:end)- Evals(1:end-1))./(lgNvals(2:end)-lgNvals(1:end-1));
    disp(max(slopes))
    disp(min(slopes))
    disp(mean(slopes))
    
end

function tot = trapezoid(f,a,b,N)
    X = linspace(a,b,N+1);
    tot = (b-a)/(2*N)*(f(a) + f(b) + 2*sum(f(X(2:N))));
end

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

