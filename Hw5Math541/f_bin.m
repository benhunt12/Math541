function decimal = f_bin(f)

    decimal = 0; %total return value
    for jj=1:52 %for every bit in the mantissa
        decimal = decimal + f(jj)/2^jj; %find next term and add to total
    end
end

