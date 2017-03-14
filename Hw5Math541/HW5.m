function [n1 n2] = initializer()

n1 = [0 1 1 1 0 1 0 1 0 1 1 1 1 1 1 1 1 0 0 0 0 0 1 0 ...
0 1 0 0 1 0 0 1 0 1 1 1 1 0 0 0 0 0 1 0 0 1 0 0 1 ...
0 0 1 0 1 1 1 1 0 0 0 0 1 0 1];

n2 = [0 1 1 1 0 1 0 1 0 1 1 1 1 1 1 1 1 0 0 0 0 0 1 0 ...
0 1 0 0 1 0 0 1 0 1 1 1 1 0 0 0 0 0 1 0 0 1 0 0 1 ...
0 0 1 0 1 1 1 1 0 1 0 0 1 1 0];


end

function decimal = char_to_dec(binary)
    decimal = 0; %total decimal number
    term = 0; %term to be added to total through each iteration
    for jj=1:length(binary) %starts at one, goes until the end of the input array
        term = 2^(length(binary)-jj)*binary(jj); %formula
        decimal = decimal + term; %add term to total
    end
    decimal = decimal - 1023; %subratct 1023 by the formula
end

function decimal = f_bin(f)

    decimal = 0; %total return value
    for jj=1:52 %for every bit in the mantissa
        decimal = decimal + f(jj)/2^jj; %find next term and add to total
    end
end

function out = dec_to_float(dec)
    
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
  
  while(man > 0)    
      man = 2*man;
      c1 = floor(man);
      man = man - c1;
      mantissa = [mantissa num2str(c1)];
  end
    
  if(dec < 0)
      sign = '1';
  else
      sign = '0';
  end
  
  out = [sign characteristic mantissa];

end

function Q1()
    [n1,n2] = initializer(); %initialize the two arrays
    
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

function Q2()
    x = 1; counter = 0; while 1+x > 1, x = x/2, pause(.02), counter = counter + 1, end
    
    %x = 1; counter = 0; while x+x > x, x = 2*x, pause(.02), counter = counter + 1, end
    
    %x = 1; counter = 0; while x+x > x, x = x/2, pause(.02), counter = counter + 1, end
end

function Q2()
    %x = 1; counter = 0; while 1+x > 1, x = x/2, pause(.02), counter = counter + 1, end
    
    %x = 1; counter = 0; while x+x > x, x = 2*x, pause(.02), counter = counter + 1, end
    
    x = 1; counter = 0; while x+x > x, x = x/2, pause(.02), counter = counter + 1, end
end

function powersinQ4(x)
    % POWERSIN. Power series for sin(x).
    % POWERSIN(x) tries to compute sin(x)
    % from a power series
    s = 0;
    t = x;
    n = 1;
    count = 0; %counts the number of times throught the loop
    max = t; % hold the max term value
    while s+t ~= s;
        s = s + t;
        if (t > max) %if the current term is bigger than the current max
            max = t; % set that t value to max
        end
        t = -x.^2/((n+1)*(n+2)).*t;
        n = n + 2;
        count = count + 1;
    end
    
    s1 = sin(x); %calculate matlab function sin(x)
    error = (abs((s-s1)/s1))*100; %find error between sin(x) and powersin(x)
    count; %display the counter
    max; %display the max value
    fprintf('sin(x): %i, powersin(x): %i, Error: %i, Count: %i, Max: %i \n\n', s1, s, error, count, max);
end

function bin = Q5(x,base)
  
  flag = 0; %used to determine if letters have been used, i.e. base 10 or greater
  s = ' ';
  if(x < 0)
      s = '-';
      x = -x;
  end
  
  xint = floor(x);
  xdec = x - floor(x);
  Nmax = 104;
  count = 1;
  
  cbd = []; 
  cad = [];
  
  while(xint > 0)     
      c0 = mod(xint,base); %changed from mod(x,2) to mod(x,base), base given by user
      xint = (xint-c0)/base; %divided by base insteat of 2      
      if(c0 == 10) %if statements to convert values greater than 10 to letters
          cx = 'A'; %another variable 'cx' is needed, because 'c0' is modified in each... 
          flag = 1; %...iteration, and matlab wont perform math operations on chars
      elseif(c0 == 11)
          cx = 'B';
          flag = 1;
      elseif(c0 == 12)
          cx = 'C';
          flag = 1;
      elseif(c0 == 13)
          cx = 'D';
          flag = 1;
      elseif(c0 == 14)
          cx = 'E';
          flag = 1;
      elseif(c0 == 15)
          cx = 'F';
          flag = 1;
      end
      if (flag == 1) %if flag is 1, it means the number was changed to a letter
        cbd = [num2str(cx) cbd];
      else
        cbd = [num2str(c0) cbd];
      end
      flag = 0; %reset flag for next iteration
  end
  
  while(xdec > 0 && count<=Nmax)     
      xdec = base*xdec;%multiply by base instead of 2
      c1 = floor(xdec);
      xdec = xdec - c1;
      cad = [cad num2str(c1)];
      count = count + 1;
  end

  bin = [s cbd '.' cad]; %concatenated the three parts
  
end

  


