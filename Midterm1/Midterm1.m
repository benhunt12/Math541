function tot = weird_sum(n)
    
    X = linspace(0,1,(n+1)) %%ratio j/n
    %%Ex: n = 3, ratio = 0/3, 1/3, 2/3, 3/3
    %%From Ex. above, linspace 0 - 1, in increments of n
    tot = sum(cos(pi.*((X.^3) + (4.*X)))); %%since the ratios j/n have already been computed
    %%use X and vectorized operation to cube and multiply
    %%sum function adds up the each index in the vector X
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

function Q2parta()
    tot = [0,1,1,1,1,0,0,1,0,1,1,1,1,1,1,1,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,1,1,1,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,1,1,1,1,0,0,0,0,1];
    tot1 = [0,1,1,1,1,0,0,1,0,1,1,1,1,1,1,1,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,1,1,1,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,1,1,1,1,0,0,0,0,1];


    for jj = 1 : 12
        tot(jj) = 0;
    end
    num2str(tot)
    for jj = 13 : 64
        tot1(jj) = 0;
    end
    num2str(tot1)
    

end

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

function phi_n = phi_fib(a,b,phi1,phi2,N)
    
    %creates array of zeros, the size of desired N, to be filled by loop
    %sets first two indexes with user input
    phi_n = zeros(1,N); 
    X = linspace(0,N,N);
    phi_n(1)=phi1;
    phi_n(2)=phi2;
    n = 3; %start at 3 because indexes 1 and 2 have alread been filled
    
    %loops until the number of iterations has reach user inputs
    while n <= N
        phi_n(n)=(a*phi_n(n-1))+(b*phi_n(n-2));
        n=n+1;
    end
    
    %slope of semilog
    deltaY = phi_n(2:end) - phi_n(1:end-1);
    deltaX = X(2:end) - X(1:end-1);
    
    slope = deltaY./deltaX
end

function phi_plotter()

    %plot
    ten = phi_fib(3,-1/2,2,1,10);
    
    subplot(2,2,1);
    semilogy(abs(ten),'LineWidth',2,'Color','blue');
    xlabel('Count (N)');
    ylabel('Value at Index "N"');
    title('N = 10');
    
    twenty = phi_fib(3,-1/2,2,1,20);
    subplot(2,2,2);
    semilogy(abs(twenty),'LineWidth',2,'Color','blue');
    xlabel('Count (N)');
    ylabel('Value at Index "N"');
    title('N = 20');
    
    thirty = phi_fib(3,-1/2,2,1,30);
    subplot(2,2,3);
    semilogy(abs(thirty),'LineWidth',2,'Color','blue');
    xlabel('Count (N)');
    ylabel('Value at Index "N"');
    title('N = 30');
    
    fourty = phi_fib(3,-1/2,2,1,40);
    subplot(2,2,4);
    semilogy(abs(fourty),'LineWidth',2,'Color','blue');
    xlabel('Count (N)');
    ylabel('Value at Index "N"');
    title('N = 40');

end

function [f,f1,f2,f3] = get_deriv()
    syms x;
    f = cos(cos(x^2));
    f1 = diff(f)
    f2 = diff(f1)
    f3 = diff(f2)
end

function tot = calculate(a,low,up)
%%Gets point around, upper and lower bounds of the integral
%%Returns value
%%This function allows me to solve the problem by solving the 3 broken-up
%%intengrals one at time
    tot = 0; 
    [f,f1,f2,f3] = get_deriv(); %gets 1st, 2nd, 3rd derivatives of the desired func
    syms x;
    val = vpa(subs(f,x,a)); %'subs' allows you to substitute a decimal value for a symbol
    val1 = vpa(subs(f1,x,a)); %in this case, the point around 
    val2 = vpa(subs(f2,x,a)); %'vpa'essentially forces matlab to return a single value
    val3 = vpa(subs(f3,x,a));
    
    %Create function handle to be used in 'integral'
    %these functions will have this general form no matter the coefficient
    %so i just hard coded them in
    func = @(x)double(val); 
    func1 = @(x)double(val1*(x-a));
    func2 = @(x)double((val2/2) *((x-a)^2));
    func3 = @(x)double((val3/6) *((x-a)^3));
    
    %integrate over the input bounds
    out = integral(func,low,up,'ArrayValued',true);
    out1 = integral(func1,low,up,'ArrayValued',true);
    out2 = integral(func2,low,up,'ArrayValued',true);
    out3 = integral(func3,low,up,'ArrayValued',true);
    
    tot = out + out1 + out2 + out3;
    
end

function quadratic(a, b, c)
    classic1 = (-b+sqrt(b^2-4*a*c))/(2*a); %quadratic formula, '+' root
    classic2 = (-b-sqrt(b^2-4*a*c))/(2*a); %quadratic formula, '-' root
    
    new1 = (2*c)/(-b - sqrt(b^2-4*a*c));
    new2 = (2*c)/(-b + sqrt(b^2-4*a*c));
    
    return1 = 0;
    return2 = 0;
    
    if(b > 0 && b^2 - 4*a*c > 10^6)
        return1 = new1;
        return2 = classic2;
        elseif(b < 0 && b^2 - 4*a*c < -10^6)
            return1 = classic1;
            return2 = new2;
    else
        return1 = classic1;
        return2 = classic2;
    end
 
    rvals = roots([a b c]); %quadratic formula using 'roots' funciton
    
%     %comparing 'roots' and 'r1'
%     error1 = (abs((new1-classic1)/classic1))*100;
%     fprintf('Root(1) = %i, Custom(r1) = %i, Percent Error = %i\n', new2, classic1, error1);
%     
%    
%     %comparing 'roots' and 'r2'
%     error2 = (abs((new2-classic2)/classic2))*100;
%     fprintf('Root(2) = %i, Custom(r2) = %i, Percent Error = %i\n\n', new1, classic2, error2);
      fprintf('Root1 = %i, Root2 = %i\n\n', return1, return2);
      fprintf('Correct1 = %i, Correct2 = %i\n\n', rvals(1), rvals(2));
end

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

