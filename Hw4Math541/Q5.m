function Q5(n)
    A = 1;
    for jj = 2:n
        A(jj,jj) = 0; %create new row and col based on 'jj'
        A(:,jj) = jj; %set that row to all 'jj'
        A(jj,:) = jj; %set col to all 'jj'
    end
    A = A.^2 %vectorized multiply for getting jj^2
    %A(:,1:2:n)
    %A
end