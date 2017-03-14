function Q1()
    [n1,n2] = initializer(); %initialize the two arrays
    
    midval = dec_to_float(1.745459324156347e277);
    midval(2:12)
    midval(13:end)
    
    c1 = n1(2:12); %slice both to get characteristic bits
    c2 = n2(2:12);
    dec_c1 = char_to_dec(c1); %converts from binary to decimal for char
    dec_c2 = char_to_dec(c2);
    
    dec_c1
    dec_c1
     
    f1 = n1(13:64); %slice both to get mantissa bits
    f2 = n2(13:64);
    dec_f1 = f_bin(f1); %then convert them to decimal
    dec_f2 = f_bin(f2);
    
    dec_f1
    dec_f2
    
    sign1 = n1(1); %get the first bit of each array
    sign2 = n2(1);
    
    dec1 = ((-1)^sign1)*(2^dec_c1)*(1+dec_f1); %plug eahc part into formula
    dec2 = ((-1)^sign2)*(2^dec_c2)*(1+dec_f2);
    
    add = dec1 + dec2; %add the two numbers in decimal
    add_dec = dec_to_float(add); %convert back to floating point
    
    sub = dec1 - dec2; %subract the two numbers in decimal
    sub_dec = dec_to_float(sub); %convert back to floating point
    
    add_dec
    sub_dec
     
end

