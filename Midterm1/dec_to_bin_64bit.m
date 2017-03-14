function [bin, cbin, fbin]  = dec_to_bin_64bit(x)
  
  ca = floor(log2(abs(x))) + 1023;
  fa = abs(x)*2^(1023-ca) - 1;
  
  cbin = []; 
  while(ca > 0)     
      c0 = mod(ca,2);
      ca = (ca-c0)/2;          
      cbin = [num2str(c0) cbin];
  end
    
  fbin = [];    
    
  while(fa > 0)     
        fa = 2*fa;
        f1 = floor(fa);
        fa = fa - f1;
        fbin = [fbin num2str(f1)];
  end
  

  s = sign(x);
  if s<0
    s = '1';
  else
    s = '0';
  end
  
  bin = [s cbin fbin];
  
%   while(length(bin) ~= 64)
%       bin = [bin 1 1];
%   end
  
cbin
  
end

