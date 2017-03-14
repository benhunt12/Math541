function Q3(a, b, c)
    r1 = (-b+sqrt(b^2-4*a*c))/(2*a); %quadratic formula, '+' root
    r2 = (-b-sqrt(b^2-4*a*c))/(2*a); %quadratic formula, '-' root

    rvals = roots([a b c]); %quadratic formula using 'roots' funciton
    
    %comparing 'roots' and 'r1'
    error1 = (abs((rvals(1)-r1)/r1))*100;
    fprintf('Root(1) = %i, Custom(r1) = %i, Percent Error = %i\n', rvals(1), r1, error1);
    
   
    %comparing 'roots' and 'r2'
    error2 = (abs((rvals(2)-r2)/r2))*100;
    fprintf('Root(2) = %i, Custom(r2) = %i, Percent Error = %i\n\n', rvals(2), r2, error2);
end

