function [d,car,mant] = bin_64bit_to_dec(n)

    sval = n(1);
    cvals = n(2:12);
    fvals = n(13:64);
    
    car = 0;
    for jj=1:11
        car = car + cvals(jj)*2^(11-jj);
    end
    car = car - 1023;
    
    mant = 0;
    for jj=1:52
        mant = mant + fvals(jj)/2^jj;
    end

    d = ((-1)^sval)*(2^car)*(1+mant);
    
end
