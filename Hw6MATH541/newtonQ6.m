function newtonQ6(x0,tol)
%%PART A
syms x;
f = x*cos(x) - sin(x)^2;
[func,fprime] = getderiv(f);
 
x1 = x0 - func(x0)/fprime(x0);
results = [x0 x1]; %vector to hold all the iteration values
 
while abs(x1-x0) > tol*abs(x0)
    x0= x1;
    x1 = x0 - func(x0)/fprime(x0);
    results = [results x1];
end
results

%%PART B
root = results(length(results)); %the last value added from the iterations is the best approx
yvals = abs(results(2:end-1)-root);
xvals = abs(results(1:end-2)-root);

plot(xvals,yvals);

end

