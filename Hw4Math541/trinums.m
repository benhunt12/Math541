function trinum = trinums(m)
    n = 1; %so start at index 1
    
    while(n^2 + n - 2*m <= 0) %condition given by problem
        n = n + 1;
    end
    
    v = 1:n;
    trinum = v.*(v+1)/2;
    


end

