function y = threenplus1(length)
    n = 0; %counter starting at zero
    for jj = 1:length
        n = 5*(2^length);
        y = n;
        while n > 1
        if mod(n,2)==0
            n = n/2;
        else
            n = 3*n+1;
        end
        y = [y n];
    end
end

