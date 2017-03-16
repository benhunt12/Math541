function newtonQ6()
    syms x;
    f = x*cos(x) - sin(x)^2;
    [func,fprim] = getderiv(f);
    retArr = [];
    
    ii = 1;
    for jj = 0 : 0.1 : 5
        x1 = jj - func(jj)/fprim(jj);
        while abs(x1-jj) > 10e-3*abs(jj)
            jj= x1;
            x1 = jj - func(jj)/fprim(jj);
        end
        if x1 >0
            if x1 <5
                retArr(ii) = x1;
                ii = ii +1;
            end
        end
    end

% i = 1;
% for jj = 0 : 0.1 : 5
%     x1 = jj - func(jj)/fprim(jj);
%     while abs(x1 - jj) > 10e-6*abs(jj)
%         jj = x1;
%         x1 = jj - func(jj)/fprim(jj);
%         if (x1 < 5 && x1 > 0)
%             retArr(i) = x1;
%             i = i + 1;
%         end          
%     end
% end

retArr
real = [];
copy = retArr;
n = 1;
for pp = 1 : length(retArr) - 1
    if (abs(retArr(pp+1) - retArr(pp)) > 0.001)
       real(n) = retArr(pp);
       n = n + 1;
       if (pp == length(retArr))
           break
       end
    end
    
end

c = 1;
for zz = 2 : length(retArr)
    if (abs(retArr(zz) - retArr(zz-1)) > 0.001)
       real(c) = retArr(zz);
       c = c + 1;
       if (zz == length(retArr))
           break
       end
    end
    
end
real
end

