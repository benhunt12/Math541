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
