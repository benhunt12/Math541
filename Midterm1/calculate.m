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

