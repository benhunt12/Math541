function [func,fprim] = getderiv(f)
    func = matlabFunction(f);
    temp = diff(f);
    fprim = matlabFunction(temp);
end

