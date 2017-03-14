function [out, charac, mant] = dec_to_float(dec)
    
  char = floor(log2(abs(dec))) + 1023; %reverse the formula 
  man = abs(dec)*2^(1023-char) - 1;
  
  characteristic = []; 
  mantissa = [];
  
  %%%%USED dec_to_bin.m from BlackBoard, just replaced some variables
  %%%%with new ones created above
  while(char > 0)     
      c0 = mod(char,2);
      char = (char-c0)/2;      
      characteristic = [num2str(c0) characteristic];
  end
  characteristic
  while(man > 0)    
      man = 2*man;
      c1 = floor(man);
      man = man - c1;
      mantissa = [mantissa num2str(c1)];
  end
  mantissa
  if(dec < 0)
      sign = '1';
  else
      sign = '0';
  end
  
  out = [sign characteristic mantissa];
  


end

