function updown_partb()

fup = [1,1,1,1,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,1,1,1,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,1,1,1,1,0,0,0,0,1,1,1];
fdown = [1,1,1,1,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,1,1,1,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,1,1,1,1,0,0,0,0,0,0,1];
char = [1,1,1,1,0,0,1,0,1,1,1];
sign = [0];
new = [1,1,1,1,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,1,1,1,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,1,1,1,1,0,1,0,0,1,0,1];
mant1 = 0;
for jj=1:52
    mant1 = mant1 + fup(jj)/2^jj;
end

mant2 = 0;
for jj=1:52
    mant2 = mant2 + fdown(jj)/2^jj;
end

partc_up = [sign char fup]
partc_down = [sign char fdown]

mant3 = 0;
for jj=1:52
    mant3 = mant3 + new(jj)/2^jj;
end

down = 2^(-31)*(1+mant3)

mant3


end
