function [ jj ] = my_hypergeom( a,b,x )

if ~isempty(a) && ~isempty(b)
    a = a; 
    b = b;
elseif ~isempty(a) && isempty(b)
    b = 1;
elseif isempty(a) && ~isempty(b)
    a = 1; 
elseif isempty(a) && isempty(b)   
  a = 1;
  b = 1;
end

length(a)
length(b)

flag = 0;
term = 1;
    
for jj = 1 : length(a)
    evalA{jj} = a(jj);
end
for nn = 1 :length(b)
    evalB{nn} = b(nn);   
end

if (length(a) < length(b))
    for n = 0 : length(a)     
        jj = sum(a.*(x.^n))/(b.*factorial(n));    
    end    
else
    for n = 0 : length(b)   
        jj = sum(a.*(x.^n))/(b.*factorial(n));
    end
end



end
