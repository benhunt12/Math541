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

  

