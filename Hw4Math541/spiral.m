function S = spiral(n,c)
%SPIRAL SPIRAL(n) is an n-by-n matrix with elements
%1:n^2 arranged in a rectangular spiral pattern.
    S = [];
    for m = 1:n
        S = rot90(S,2);
        S(m,m) = 0;
        p = m^2 - m + c;
        v = (m-1:-1:0);
        S(:,m) = p-v';
        S(m,:) = p+v;
    end
    if mod(n,2)==1
        S = rot90(S,2);
    end
    %r1 = S(n+1,1:n-2)
    %r2 = S(n-1,n+2:end)
end

