function [f,f1,f2,f3] = get_deriv()
    syms x;
    f = cos(cos(x^2));
    f1 = diff(f)
    f2 = diff(f1)
    f3 = diff(f2)
end

