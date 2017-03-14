function tot = weird_sum(n)
    
    X = linspace(0,1,(n+1)) %%ratio j/n
    %%Ex: n = 3, ratio = 0/3, 1/3, 2/3, 3/3
    %%From Ex. above, linspace 0 - 1, in increments of n
    tot = sum(cos(pi.*((X.^3) + (4.*X)))); %%since the ratios j/n have already been computed
    %%use X and vectorized operation to cube and multiply
    %%sum function adds up the each index in the vector X
end

